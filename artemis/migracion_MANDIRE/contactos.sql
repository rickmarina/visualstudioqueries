/*************** CONTACTOS *****************/

		delete from ContactosEstaciones where FK_Contactos_PK_Codigo in (select PK_Codigo from Contactos where esmandire = 1)
		delete from contactos where esmandire = 1;

		declare @idu_contacto as nvarchar(50);
		declare @nom1 as nvarchar(250), @nom2 as nvarchar(250), @nom3 as nvarchar(250), @nom4 as nvarchar(250);
		declare @t1 as nvarchar(50), @t2 as nvarchar(40), @t3 as nvarchar(50), @t4 as nvarchar(50);
		declare @f1 as nvarchar(50), @f2 as nvarchar(40), @f3 as nvarchar(50), @f4 as nvarchar(50);
		declare @m1 as nvarchar(50), @m2 as nvarchar(40), @m3 as nvarchar(50), @m4 as nvarchar(50);
		declare @pkcodigo bigint;
		declare @eesspk bigint;

		--Tabla temporal de contactos
		drop table ##contactosTemp
		create table ##contactosTemp (c nvarchar(250) unique, pk int)

		DECLARE mandire_contactos CURSOR FOR 
				select idu, RTRIM(LTRIM(nom1)), replace(LTRIM(str(t1,25,5)),'.00000',''), replace(LTRIM(str(f1,25,5)),'.00000',''), replace(LTRIM(str(m1,25,5)),'.00000',''), 
							RTRIM(LTRIM(nom2)), replace(LTRIM(str(t2,25,5)),'.00000',''), replace(LTRIM(str(f2,25,5)),'.00000',''), replace(LTRIM(str(m2,25,5)),'.00000',''), 
							RTRIM(LTRIM(nom3)), replace(LTRIM(str(t3,25,5)),'.00000',''), replace(LTRIM(str(f3,25,5)),'.00000',''), replace(LTRIM(str(m3,25,5)),'.00000',''), 
							RTRIM(LTRIM(nom4)), replace(LTRIM(str(t4,25,5)),'.00000',''), replace(LTRIM(str(f4,25,5)),'.00000',''), replace(LTRIM(str(m4,25,5)),'.00000','')  
							,(SELECT pk_codigo from Estaciones where CodigoEstacion = idu and esMANDIRE=1) as estacionpk  
				from [man_dire].[dbo].unidades  
				inner join MAN_DIRE.dbo.tipo on unidades.idtp = tipo.idtp  
				where tipo.dtp <> 'ESTACION'  
				and (len(nom1)>0 or len(nom2)>0 or len(nom3)>0 or len(nom4)>0)
		OPEN mandire_contactos FETCH NEXT FROM mandire_contactos INTO @idu_contacto, @nom1, @t1, @f1, @m1, @nom2, @t2, @f2, @m2, @nom3, @t3, @f3, @m3, @nom4, @t4, @f4, @m4, @eesspk
		WHILE @@FETCH_STATUS = 0 
		BEGIN
				print 'nuevo registro';
			  --PRINT '@nom1:'+cast(@nom1 as nvarchar)+' @nom2:'+cast(@nom2 as nvarchar)+' @nom3:'+cast(@nom3 as nvarchar)+' @nom4:'+cast(@nom4 as nvarchar)+' eesspk:'+cast(@eesspk as nvarchar)

			  IF (@nom1 = 'Cristian') 
			  BEGIN 
				print 'debug';
			  END

			  --nombre1
			  IF (LEN(@nom1)>0) 
			  BEGIN
					SELECT @pkcodigo = pk from ##contactosTemp where c = @nom1;
					IF (@pkcodigo is null) 
					BEGIN
					   print 'inserta nom1:'+cast(@nom1 as nvarchar);
					   insert into contactos(nombre,apellidos,telefono,fax,telefonoMovil,fk_paises_pk_codigo,fk_comunidadesautonomas_pk_codigo,FK_Provincias_PK_Codigo,
												FK_ContactosRoles_PK_Codigo,esMANDIRE,borrado,incluirContactoEnIncidencias) 
											values (@nom1,'-',@t1,@f1,@m1,1,7,41,5,1,0,0);
						SELECT @pkcodigo = SCOPE_IDENTITY(); 
						insert into ##contactosTemp values (@nom1,@pkcodigo)
					END

				   --buscar e insertar en contactos_estaciones 
				   --buscar a qué pkcodigo de estacion pertenece este idu de contacto 
				   IF (@eesspk is not null) 
				   BEGIN 
					   insert into ContactosEstaciones (FK_Contactos_PK_Codigo, FK_Estaciones_PK_Codigo) 
					   values (@pkcodigo, @eesspk);
				   END

				   SET @pkcodigo = NULL
			   END

			  --nombre2
			  IF (LEN(@nom2)>0) 
			  BEGIN
					SELECT @pkcodigo = pk from ##contactosTemp where c = @nom2;
					IF (@pkcodigo is null) 
					BEGIN
						   print 'inserta nom2:'+cast(@nom2 as nvarchar);
						   insert into contactos(nombre,apellidos,telefono,fax,telefonoMovil,fk_paises_pk_codigo,fk_comunidadesautonomas_pk_codigo,FK_Provincias_PK_Codigo,
															   FK_ContactosRoles_PK_Codigo,esMANDIRE,borrado,incluirContactoEnIncidencias) 
												values (@nom2,'-',@t2,@f2,@m2,1,7,41,5,1,0,0);
						   SELECT @pkcodigo = SCOPE_IDENTITY();
						insert into ##contactosTemp values (@nom2,@pkcodigo)

					END
				   --buscar e insertar en contactos_estaciones 
				   --buscar a qué pkcodigo de estacion pertenece este idu de contacto 
				   IF (@eesspk is not null) 
				   BEGIN 
					   insert into ContactosEstaciones (FK_Contactos_PK_Codigo, FK_Estaciones_PK_Codigo) 
					   values (@pkcodigo, @eesspk);
				   END
				   SET @pkcodigo = NULL
			   END

			  --nombre3
			  IF (LEN(@nom3)>0) 
			  BEGIN
					SELECT @pkcodigo = pk from ##contactosTemp where c = @nom3;
					IF (@pkcodigo is null) 
					BEGIN
						   print 'inserta nom3:'+cast(@nom3 as nvarchar);
						   insert into contactos(nombre,apellidos,telefono,fax,telefonoMovil,fk_paises_pk_codigo,fk_comunidadesautonomas_pk_codigo,FK_Provincias_PK_Codigo,
															   FK_ContactosRoles_PK_Codigo,esMANDIRE,borrado,incluirContactoEnIncidencias) 
												values (@nom3,'-',@t3,@f3,@m3,1,7,41,5,1,0,0);
						   SELECT @pkcodigo = SCOPE_IDENTITY();
							insert into ##contactosTemp values (@nom3,@pkcodigo)

					END
				   --buscar e insertar en contactos_estaciones 
				   --buscar a qué pkcodigo de estacion pertenece este idu de contacto 
				   IF (@eesspk is not null) 
				   BEGIN 
					   insert into ContactosEstaciones (FK_Contactos_PK_Codigo, FK_Estaciones_PK_Codigo) 
					   values (@pkcodigo, @eesspk);
				   END
				   SET @pkcodigo = NULL
			   END

			  --nombre4
			  IF (LEN(@nom4)>0) 
			  BEGIN
					SELECT @pkcodigo = pk from ##contactosTemp where c = @nom3;
					IF (@pkcodigo is null) 
					BEGIN
					   print 'inserta nom4:'+cast(@nom4 as nvarchar);
					   insert into contactos(nombre,apellidos,telefono,fax,telefonoMovil,fk_paises_pk_codigo,fk_comunidadesautonomas_pk_codigo,FK_Provincias_PK_Codigo,
														   FK_ContactosRoles_PK_Codigo,esMANDIRE,borrado,incluirContactoEnIncidencias) 
											values (@nom4,'-',@t4,@f4,@m4,1,7,41,5,1,0,0);
					   --SET @pkcodigo = @@IDENTITY
					   SELECT @pkcodigo = SCOPE_IDENTITY();
						insert into ##contactosTemp values (@nom4,@pkcodigo)
					END
				   --buscar e insertar en contactos_estaciones 
				   --buscar a qué pkcodigo de estacion pertenece este idu de contacto 
				   IF (@eesspk is not null) 
				   BEGIN 
					   insert into ContactosEstaciones (FK_Contactos_PK_Codigo, FK_Estaciones_PK_Codigo) 
					   values (@pkcodigo, @eesspk);
				   END
				   SET @pkcodigo = NULL
			   END
                
			   PRINT 'fetch_Status:'+cast(@@FETCH_STATUS as nvarchar)

			   FETCH NEXT FROM mandire_contactos INTO @idu_contacto, @nom1, @t1, @f1, @m1, @nom2, @t2, @f2, @m2, @nom3, @t3, @f3, @m3, @nom4, @t4, @f4, @m4, @eesspk
		END
		CLOSE mandire_contactos
		DEALLOCATE mandire_contactos

	/*************** FIN CONTACTOS *****************/

	/*

select idu, nom1, t1, f1, m1, 
            nom2, t2, f2, m2, 
			nom3, t3, f3, m3, 
			nom4, t4, f4, m4  
from [man_dire].[dbo].unidades
inner join MAN_DIRE.dbo.tipo on unidades.idtp = tipo.idtp
where tipo.dtp <> 'ESTACION'  
and len(nom1)>0 or len(nom2)>0 or len(nom3)>0 or len(nom4)>0
*/