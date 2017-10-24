USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  StoredProcedure [dbo].[SP_AA_MigracionMANDIRE]    Script Date: 04/08/2017 12:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_AA_MigracionMANDIRE]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	/*************** INSTALACIONES *****************/
	delete from EstacionesHorarios where FK_Estaciones_PK_Codigo in (select PK_Codigo from Estaciones where esmandire = 1)

	delete from Estaciones where esMAndire = 1;

	declare @lastid as int, @codes as nvarchar(50), @nombre as nvarchar(200),
			@fkestacionestado as int, @fktipoestacion as int, @fktipoinstalacion as int , @codigoeshel as nvarchar(200), @sociedad as nvarchar(200), 
	@codigosap as nvarchar(200), @sapcliente as nvarchar(200), @centrocoste as nvarchar(200), @empresagestora as nvarchar(200), @cif as nvarchar(200),
	@direccion as nvarchar(200), @localidad as nvarchar(200), @cp as nvarchar(200), @fkpaises as int, @fkccaa as nvarchar(200), @fkprov as int, @fax as nvarchar(200), @telefono as nvarchar(200), 
	@movil as nvarchar(200), @fkisla as int, @email as nvarchar(200), @confirmacionemail as bit, @long as nvarchar(200), @lat as nvarchar(200), @comentarios as nvarchar(max), 
	@esmandire as bit, @ivrcode as nvarchar(200)
	
	declare cur cursor For

	select 
	unidades.idu, --ID INSTALACION PARA RELACIONAR CON VISTA CONTACTOS Y ORDENES DE TRABAJO -- SERÁ EL CÓDIGO ARTEMIS DE LA INSTALACIÓN 
	case when unidades.idu in (1038,2322,1685) then unidades.ANAU + ' S.L.' else unidades.ANAU end as Nombre,
	--unidades.ANAU AS Nombre,   -- NOMBRE INSTALACIÓN (NOMBRE UNIDAD dire)
	--'OPERATIVA' as Estado,   -- ESTADO (siempre será operativo) 4
	4 as estadopk,
	--'CLIENTES' as tipoEESS, --unidades.Plataforma as Tipo_EESS,   -- TIPO EESS (Plataforma en dire) 9
	9 as tipoeesspk,
	--tipo.dtp as Tipo_Instalacion,   -- TIPO DE INSTALACIÓN (tipo en dire) CLIENTE DIRECTO: 3 y COFRADIA PESCA: 4 
	case tipo.dtp
		when ('CLIENTE DIRECTO') then 3 
		when ('COFRADIA PESCA') then 4
		else 0
	end as tipoInstalacionPK,
	' ' as Código_euroshell,-- CÓDIGO EUROSHELL (no hay en dire)
	unidades.Sociedad as Sociedad,-- SOCIEDAD (sociedad en dire)
	' ' as Código_SAP, -- CODIGO SAP DE ARTEMIS IRÁ EN BLANCO
	unidades.NºSAP as sap_cliente, -- CÓDIGO SAP CLIENTE (codigo nuevo en artemis = codigo sap en dire)
	unidades.CECO as Centro_de_coste,-- CENTRO DE COSTE (ceco dire)
	clientes.nomc as Empresa_Gestora,-- EMPRESA GESTORA (cliente en dire)
	clientes.CIF as CIF,-- CIF (cif en dire en tabla clientes)
	case
	when (unidades.[Nº DIREU] is null) then unidades.DIRECU
	when (unidades.[Nº DIREU] is not null) then (convert(varchar(255),unidades.DIRECU) + ' ' + convert(varchar(255),unidades.[Nº DIREU]))
	end as Direccion,  -- DIRECCIÓN (dirección + numero en dire)
	unidades.POBL as Localidad,-- LOCALIDAD (población en dire)
	(convert(varchar,unidades.cp)  + convert(varchar,unidades.DP)) as CP,-- CP (cp en dire)
	--'España' as Pais, -- PAIS (no existe en dire siempre España)  1
	1 as paispk,
	--'Canarias' as Comunidad_autonoma,-- COMUNIDAD AUTONOMA (no existe = Canarias siempre) 7
	7 as comunidadpk,
	case
		   when (unidades.CP = '38') then 41 --'Santa Cruz de Tenerife'  -- 41
		   when (unidades.CP = '35') then 26 --'Las Palmas' -- 26
	end as 'PROVINCIAPK', --(sacar según isla asociada = Las Palmas o Tenerife)

	(str(unidades.f1) + ';' + str(unidades.f2) + ';' + str(unidades.f3) + ';' + str(unidades.f4)) as FAX,-- FAX (fax en dire)
	(str(unidades.t1) + ';' + str(unidades.t2) + ';' + str(unidades.t3) + ';' + str(unidades.t4)) as Telefono,-- TELÉFONO (teléfono en dire)
	(str(unidades.m1) + ';' + str(unidades.m2) + ';' + str(unidades.m3) + ';' + str(unidades.m4)) as Telefono_movil,-- TELEFONO MOVIL (móvil en dire)

	case
		   when (unidades."is" = 'PA') then 6 --'La Palma' -- 6
		   when (unidades."is" = 'FV' or unidades."is" = 'FU') then 3 --'Fuerteventura' --3
		   when (unidades."is" = 'LA') then 4 --'Lanzarote' --4
		   when (unidades."is" = 'TF') then 1 --'Tenerife' --1
		   when (unidades."is" = 'GO') then 2 -- 'Gomera' --2
		   when (unidades."is" = 'HI') then 5 -- 'Hierro' --5
		   when (unidades."is" = 'GC') then 7 -- 'Gran Canaria' --7
	else ' ' end as Islapk, -- ISLA (isla en dire)
	--(unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4) as email,-- EMAIL (email en dire)
	case when len((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4)) <= 5 then NULL 
	ELSE replace((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4),';;','') end as email,
	--'email' as informacion_confirmaciones,-- INFORMACIÓN DE CONFIRMACIONES (siempre será por email)
	1 as confirmacionPorEmail,
	unidades.Lng as Longitud,-- LONGITUD (longitud en dire)
	unidades.lat as latitud,-- LATITUD (latitud en dire)
	('- Comentario sobre instalación: ' + unidades.COMENTU + char(10) /*salto de línea*/ + 
	'- Comentario sobre cliente: ' + CLIENTES.COMENC) as comentarios_privados, -- COMENTARIOS PRIVADOS (dato adicional de estación + dato adicional de cliente en dire),
	1 as esMANDIRE,
	NULL as IVRCODE
	from MAN_DIRE.dbo.unidades
		   inner join MAN_DIRE.dbo.tipo on MAN_DIRE.dbo.unidades.idtp = MAN_DIRE.dbo.tipo.idtp
		   inner join MAN_DIRE.dbo.clientes on MAN_DIRE.dbo.unidades.idc = MAN_DIRE.dbo.clientes.idc
	where tipo.DTP <> 'Estacion'
	order by nombre


	OPEN cur
	fetch next from cur into @codes, @nombre, @fkestacionestado, @fktipoestacion, @fktipoinstalacion, @codigoeshel, @sociedad, @codigosap, @sapcliente, @centrocoste, @empresagestora, @cif,
							 @direccion, @localidad, @cp, @fkpaises, @fkccaa, @fkprov, @fax, @telefono, @movil, @fkisla, @email, @confirmacionemail, @long, @lat, @comentarios, @esmandire, @ivrcode

	while @@FETCH_STATUS = 0 
	begin 

		insert into Estaciones (CodigoEstacion,Nombre, fk_estacionesEstados_PK_Codigo,[FK_TiposEstaciones_PK_Codigo],
		[FK_TiposInstalaciones_PK_Codigo], [CodigoEuroshell], [Sociedad], [CodigoSAP], [SapCliente], [CentroCoste], [EmpresaGestora], [CIF],
		[Direccion], [Localidad], [CP], [FK_Paises_PK_Codigo],[FK_ComunidadesAutonomas_PK_Codigo],[FK_Provincias_PK_Codigo], 
		[FAX], [Telefono],[TelefonoMovil],[FK_Islas_PK_Codigo],[Email],[ConfirmacionPorEmail],[Longitud],[Latitud],[ComentariosPrivados],esMANDIRE,
		IVRCODE) values (@codes, @nombre, @fkestacionestado, @fktipoestacion, @fktipoinstalacion, @codigoeshel, @sociedad, @codigosap, @sapcliente, @centrocoste, @empresagestora, @cif,
								 @direccion, @localidad, @cp, @fkpaises, @fkccaa, @fkprov, @fax, @telefono, @movil, @fkisla, @email, @confirmacionemail, @long, @lat, @comentarios, @esmandire, @ivrcode)

		SELECT @lastid = SCOPE_IDENTITY();

		insert into EstacionesHorarios (FK_Estaciones_PK_Codigo, TiendaLVhi, TiendaLVhf, TiendaActivo) VALUES (@lastid, '08:00','15:00',1)

		fetch next from cur into @codes, @nombre, @fkestacionestado, @fktipoestacion, @fktipoinstalacion, @codigoeshel, @sociedad, @codigosap, @sapcliente, @centrocoste, @empresagestora, @cif,
								 @direccion, @localidad, @cp, @fkpaises, @fkccaa, @fkprov, @fax, @telefono, @movil, @fkisla, @email, @confirmacionemail, @long, @lat, @comentarios, @esmandire, @ivrcode

	end

	CLOSE cur
	deallocate cur

	/*************** FIN INSTALACIONES *****************/

	/*************** CONTACTOS *****************/
		delete from ContactosEstaciones where FK_Contactos_PK_Codigo in (select PK_Codigo from Contactos where esmandire = 1)

		delete from contactos where esmandire = 1;

		declare @idu nvarchar(50);
		declare @nombreContacto nvarchar(250);
		declare @pkcodigo bigint;
		declare @eesspk bigint;

		DECLARE mandire_cursor CURSOR FOR
			   SELECT idu, nombre --, 5 as rol, 1 as pais, 7 as ccaa, 41 as provincia
			   FROM
					  (select idu, nom1, nom2, nom3, nom4 from [man_dire].[dbo].unidades) unidades
					  unpivot ( nombre for num_nombre in (unidades.nom1, unidades.nom2, unidades.nom3, unidades.nom4)) as unpvt
			   where len(nombre)>0
			   order by idu, num_nombre;
		OPEN mandire_cursor FETCH NEXT FROM mandire_cursor INTO @idu, @nombreContacto 
		WHILE @@FETCH_STATUS = 0
		BEGIN
			   insert into contactos(nombre,apellidos,fk_paises_pk_codigo,fk_comunidadesautonomas_pk_codigo,FK_Provincias_PK_Codigo,
												   FK_ContactosRoles_PK_Codigo,esMANDIRE,borrado,incluirContactoEnIncidencias) 
			   values (@nombreContacto,'-',1,7,41,5,1,0,0);
       
			   SET @pkcodigo = @@IDENTITY
       

			   --buscar e insertar en contactos_estaciones 
			   --buscar a qué pkcodigo de estacion pertenece este idu de contacto 
			   SELECT @eesspk = pk_codigo from Estaciones where CodigoEstacion = @idu
			   IF (@eesspk is not null) 
			   BEGIN 
				   print 'eesspk: '+ cast(@eesspk as nvarchar);

				   insert into ContactosEstaciones (FK_Contactos_PK_Codigo, FK_Estaciones_PK_Codigo) 
				   values (@pkcodigo, @eesspk);
			   END

       
                
			   FETCH NEXT FROM mandire_cursor INTO @idu, @nombreContacto 
		END
		CLOSE mandire_cursor
		DEALLOCATE mandire_cursor

	/*************** FIN CONTACTOS *****************/

	/*************** CONTRATISTAS *****************/

		delete from contratistas where esMANDIRE = 1

		INSERT INTO [dbo].[Contratistas]
				   ([CodigoContratista]           ,[Nombre]           ,[CIF]
				   ,[Direccion]           ,[CP]           ,[Localidad]
				   ,[ReferenciaExterna] 
				   ,[Telefono]           ,[FAX]           ,[Email]
				   ,[Comentarios]           ,[ConfirmacionPorFax]           ,[ConfirmacionPorEmail]
				   ,[FK_ContratistasEstados_PK_Codigo]
				   ,[FK_Paises_PK_Codigo]           ,[FK_Provincias_PK_Codigo]           ,[FK_ComunidadesAutonomas_PK_Codigo]
				   ,IVRCode
				   ,[TelefonoMovil]
				   ,[EmailEnvioInformesProgramados]
				   ,[Multiservicio]
				   ,[EmailEnvioMultiservicio]
				   ,[ConfirmacionPorSms]
				   ,[TelefonoMovilMultiservicio]
				   ,[recibirEmailComentariosEESS]           ,[recibirEmailComentariosPersonalTecDisa]
				   ,[esMANDIRE])
		SELECT  
		CID, --ID
		(NOF + '   -   (' + CON + ')' + '  -  ' +
		(case 	when (Provincia = '38') then 'Santa Cruz de Tenerife'
				when (Provincia = '35') then 'Las Palmas' 
				when (Provincia is null ) then 'Todas las provincias' end)) as nombre, --NOMBRE DEL CONTRATISTA + ACRÓNIMO
		NULL as CIF,--EL CIF ESTARÁ EN BLANCO
		NULL as Direccion, --DIRECCION
		NULL as CP, --CP
		NULL as Localidad, --LOCALIDAD
		CON as ReferenciaExtena,
		NULL as telefono,
		NULL as fax,
		email as email,
		contacto.nombre + ': ' + contacto.email as Comentarios,  --COMENTARIOS PÚBLICOS
		0 as confirmacionPorFAX, --CONFIRMACIÓN POR FAX DESACTIVADA
		1 as confirmacionPorEMAIL, --CONFIRMACIÓN POR EMAIL ACTIVADA
		1 as EstadoPK, --ESTADO DEL CONTRATISTA  --'OPERATIVO' as Estado, --ESTADO DEL CONTRATISTA
		1 as paispk, 
		case 
			 when (Provincia = '38') then 41 --'Santa Cruz de Tenerife'  
			 when (Provincia = '35') then 26 --'Las Palmas' 
			 else 41
		end as provinciapk,  
		7 as comunidadpk, 
		NULL as ivrcode,
		mobile as telefono_movil, 
		EMAIL as EmailEnvioInformesProgramados, --EMAIL 
		1 as multiservicio, -- EL CAMPO ES MULTISERVICIO ESTARÁ MARCADA EN TODOS LOS CASOS 
		EMAIL as Email_envios_avisos_multiservicio, --EMAIL --CONCATENAR CON ; 
		0 as confirmacionPorSMS, --CONFIRMACIÓN POR SMS DESACTIVADA 
		MOBILE as Teléfono_movil_envio_avisos_multiservicio, --TELEFÓNO MOVIL 
		0 as recibirEmailComentariosEESS, -- EL CAMPO RECIBIR EMAIL CON COMENTARIOS DE EESS EN INCIDENCIAS ESTARÁ DESMARCADO 
		0 as recibirEmailComentariosPersonalTecDisa, -- EL CAMPO RECIBIR EMAIL CON COMENTARIOS DE PERSONAL TEC. DISA EN INCIDENCIAS ESTARÁ DESMARCADO 
		1 as esMANDIRE 
		FROM MAN_DIRE.dbo.CONTRATAS 
		inner join MAN_DIRE.dbo.CONTACTO on MAN_DIRE.dbo.CONTRATAS.IDCONT = MAN_DIRE.dbo.CONTACTO.CID 
		where 
		(contacto.nombre <> 'lmacias' and CONTACTO.Nombre <> 'cgomez' and CONTACTO.Nombre <> 'Félix Yanes Marrero' 
		and contacto.nombre <> 'ECANSA' and CONTACTO.Nombre <> 'ADMINISTRACIÓN FULLGAS') 
		order by contacto.nombre

	/*************** FIN CONTRATISTAS *****************/

END

