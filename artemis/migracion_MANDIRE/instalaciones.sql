/*************** INSTALACIONES *****************/

		delete from EstacionesEstadosHistorial where FK_Estaciones_PK_Codigo in (select PK_Codigo from Estaciones where esmandire = 1)
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
		replace(LTRIM(str(unidades.NºSAP,25,5)),'.00000','') as sap_cliente, -- CÓDIGO SAP CLIENTE (codigo nuevo en artemis = codigo sap en dire)
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

		ltrim(rtrim(isnull(str(unidades.f1),'')))+';'+ltrim(rtrim(isnull(str(unidades.f2),'')))+';'+ltrim(rtrim(isnull(str(unidades.f3),'')))+';'+ltrim(rtrim(isnull(str(unidades.f4),''))) as FAX,
		ltrim(rtrim(isnull(str(unidades.t1),'')))+';'+ltrim(rtrim(isnull(str(unidades.t2),'')))+';'+ltrim(rtrim(isnull(str(unidades.t3),'')))+';'+ltrim(rtrim(isnull(str(unidades.t4),''))) as TELEFONO,
		ltrim(rtrim(isnull(str(unidades.m1),'')))+';'+ltrim(rtrim(isnull(str(unidades.m2),'')))+';'+ltrim(rtrim(isnull(str(unidades.m3),'')))+';'+ltrim(rtrim(isnull(str(unidades.m4),''))) as Telefono_movil,
--		concat(str(isnull(unidades.t1,''),25,5),';',str(isnull(unidades.t2,''),25,5),';',str(isnull(unidades.t3,''),25,5),';',str(isnull(unidades.t4,''),25,5)) as TELEFONO,
--		concat(str(isnull(unidades.m1,''),25,5),';',str(isnull(unidades.m2,''),25,5),';',str(isnull(unidades.m3,''),25,5),';',str(isnull(unidades.m4,''),25,5)) as Telefono_movil,-- TELEFONO MOVIL (móvil en dire)
		
		case
			   when (unidades."is" = 'PA') then 6 --'La Palma' -- 6
			   when (unidades."is" = 'FV' or unidades."is" = 'FU') then 3 --'Fuerteventura' --3
			   when (unidades."is" = 'LA') then 4 --'Lanzarote' --4
			   when (unidades."is" = 'TF') then 1 --'Tenerife' --1
			   when (unidades."is" = 'GO') then 2 -- 'Gomera' --2
			   when (unidades."is" = 'HI') then 5 -- 'Hierro' --5
			   when (unidades."is" = 'GC') then 7 -- 'Gran Canaria' --7
		else ' ' end as Islapk, -- ISLA (isla en dire)
		case when len((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4)) <= 5 then NULL 
		ELSE replace((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4),';;','') end as email,
		case when len((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4)) <= 5 
		or len((unidades.e1) + ';' + (unidades.e2) + ';' + (unidades.e3) + ';' + (unidades.e4)) is null
		then 0 else 1 end as confirmacionPorEmail,
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

		update estaciones set fax = replace(fax,';;;;','') where esmandire=1
		update estaciones set fax = replace(fax,';;;','') where esmandire=1
		update estaciones set fax = replace(fax,';;','') where esmandire=1
		
		update estaciones set telefono = replace(telefono,';;;;','') where esmandire=1
		update estaciones set telefono = replace(telefono,';;;',';') where esmandire=1
		update estaciones set telefono = replace(telefono,';;',';') where esmandire=1
		
		update estaciones set telefonoMovil = replace(telefonoMovil,';;;;','') where esmandire=1
		update estaciones set telefonoMovil = replace(telefonoMovil,';;;','') where esmandire=1
		update estaciones set telefonoMovil = replace(telefonoMovil,';;','') where esmandire=1

		update estaciones set telefonomovil = SUBSTRING(telefonomovil,2,len(telefonomovil)-1) where esMANDIRE=1 and left(telefonomovil,1) = ';'

	/*************** FIN INSTALACIONES *****************/

/*************** ACTUALIZAR SAP CLIENTE EN ARTEMIS DE LAS INSTALACIONES DIRE QUE SEAN DE TIPO ESTACION ***************/
declare @sap_ccoste as nvarchar(50), @sap_nrosap as nvarchar(50), 
		@sap_eesspk as int, @sap_tipo as nvarchar(50), @sap_neess as nvarchar(250)
declare cursap cursor For 
	select unidades.CECO as Centro_de_coste, replace(LTRIM(str(unidades.NºSAP,25,5)),'.00000','') as sap_cliente, 
	(select top 1 pk_codigo from estaciones where CentroCoste = replace(replace(unidades.ceco,'-PI',''),'-','') or CentroCoste = unidades.ceco) as eesspk,
	tipo.DTP as tipoInstalacion,
	unidades.ANAU
	from MAN_DIRE.dbo.unidades
				inner join MAN_DIRE.dbo.tipo on MAN_DIRE.dbo.unidades.idtp = MAN_DIRE.dbo.tipo.idtp
	where tipo.DTP = 'ESTACION' and NºSAP is not null 
OPEN cursap
	fetch next from cursap into @sap_ccoste, @sap_nrosap, @sap_eesspk, @sap_tipo, @sap_neess
	while @@FETCH_STATUS = 0 
	BEGIN 
		IF (LEN(@sap_eesspk)>0)
		BEGIN
			update estaciones set SapCliente=@sap_nrosap where PK_Codigo = @sap_eesspk
		END
		fetch next from cursap into @sap_ccoste, @sap_nrosap, @sap_eesspk, @sap_tipo, @sap_neess
	END
CLOSE cursap
deallocate cursap
/********************* FIN ACTUALIZAR SAP CLIENTE *********************/

	select nombre, SapCliente,esMANDIRE 
	from estaciones where SapCliente is not null


	select * from EstacionesEstados
	select top 10 * from EstacionesEstadosHistorial
	select * from Estaciones where FK_EstacionesEstados_PK_Codigo = 1

	select * from ZZZ_CECO




