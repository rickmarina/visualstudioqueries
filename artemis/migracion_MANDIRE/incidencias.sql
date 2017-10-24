/*************** INCIDENCIAS *****************/

	delete from MultiserviciosEstadosHistorial where FK_Multiservicios_PK_Codigo in (select PK_Codigo from Multiservicios where esMANDIRE=1);
	delete from MultiserviciosDocumentos where FK_Multiservicios_PK_Codigo in (select PK_Codigo from Multiservicios where esMANDIRE=1);
	delete from MultiserviciosComentarios where origen = 'PERSONAL_DISA_DIRE';
	delete from Multiservicios where esMANDIRE=1; 
	delete from Multiservicios where ProcedenciaCreacion = 'Migración - Aplicación DIRE Mantenimiento';
	
	declare @referencia as nvarchar(200), @estadopk as int, @tipoavisopk as int, @tipomantmultipk as int, 
	        @observaciones as nvarchar(max), @numreaperturas as int, 
			@usucreacion as nvarchar(200), @fechacreacion as datetime, 
			@usumodificacion as nvarchar(200), @fechamodificacion as datetime, 
			@usuenvio as nvarchar(200), @fechaenvio as datetime, 
			@usucierre as nvarchar(200), @fechaenviocierre as datetime, 
			@fechacierremultiservicio as datetime, @fechacancelacion as datetime, @fechacomienzotrabajos as datetime,
			@nomInstalacion as nvarchar(200), 
			@funcionpk as int, @tipoequipopk as int,
			@nomb as nvarchar(200),	@idcont as nvarchar(200), @contratistapk as int,
			@procedenciaCreacion as nvarchar(200), @procedenciaCierre as nvarchar(200),
			@comentarios as nvarchar(MAX), 
			@infoseguridad as nvarchar(200),
			@ceco as nvarchar(200),	@totalCECO as int,
			@numFactura as nvarchar(200),
			@idu as nvarchar(200),
			@tipoINSTALACION as nvarchar(200),
			@estacionpk as int,
			@multiserviciopk as int,
			@histfechamod as datetime, 
			@histusumod as nvarchar(200), 
			@histfechacierre as datetime, 
			@histusucierre as nvarchar(200)

	set concat_null_yields_null off

	declare CUR_INCIDENCIAS cursor For

	select top 1000

	ots.REFER as Referencia, --num incidencia

	case when (estado = 1) then 2 --'CREADA'
		 when (estado = 2) then 3 -- 'ENVIADA CONTRATA'
		 when (estado = 3) then 4 -- 'CIERRE TÉCNICO'
		 when (estado = 4) then 1 -- 'CANCELADA' no existen canceladas en MANDIRE
	end as Estadopk,

	case when (prio is null) then '' 
		 when (prio = 1) then 2 --'Incidencia'
		 when (prio = 2) then 4 --'Urgencia'
		 when (prio = 3) then 1 --'Emergencia'
		 when (prio = 4) then 3 --'Planificación'
	end as Tipo_De_avisopk,

	case when (tpman is null) then ' '
		 when (tpman = 1) then 1 --'Correctivo'
		 when (tpman = 2) then 7 --'Modificativo'
		 when (tpman = 3) then 3 --'Preventivo'
		 when (tpman = 4) then 6 --'T.Extraordinario'
		 when (tpman = 5) then 5 --'T.No Programado'
		 when (tpman = 6) then 2 --'Legal'
		 when (tpman = 7) then 4 --'Suministro' 
	end as tipo_mnto_multiservpk,
	-- EL CAMPO FACTURA INDEPENDIENTE ESTARÁ DESACTIVADO
	NULL as Observaciones,
	'0' as num_reaperturas,

	case when (estado = 1) then accion.UsrMod
		 when (estado <> 1) then NULL
	end as usuario_creacion,

	case when (estado = 1) then iif(accion.fechamod = '1900-01-01 00:00:00.000',NULL, accion.fechamod)
		 when (estado <> 1) then NULL -- CUANDO PONE 1900-01-01 ES FECHA VACIA
	end as fecha_creacion,

	'ARTEMIS' as usuario_modificacion, --SIEMPRE SERÁ EL USUARIO ARTEMIS

	case when (estado = 1) then iif(accion.fechamod = '1900-01-01 00:00:00.000',NULL, accion.fechamod)
		 when (estado <> 1) then NULL -- CUANDO PONE 1900-01-01 ES FECHA VACIA
	end as fecha_modificacion,

	-- INFORMACIÓN DE CONFIRMACIONES ESTARÁ DESMARCADO
	case when (estado = 2) then accion.UsrMod
		 when (estado <> 2) then NULL
	end as usuario_envio,
	case when (estado = 2) then accion.fechamod
		 when (estado <> 2) then NULL -- CUANDO PONE 1900-01-01 ES FECHA VACIA
	end as fecha_envio,
	
	case when (estado = 3) then accion.UsrMod
		 when (estado <> 3) then NULL
	end as usuario_cierre,
	case when (estado = 3) then iif(accion.fechamod = '1900-01-01 00:00:00.000',NULL, accion.fechamod)
		 when (estado <> 3) then NULL -- CUANDO PONE 1900-01-01 ES FECHA VACIA
	end as fecha_envio_cierre,
	

	fechoutot as fecha_cierre_multiservicio,
	NULL      as fecha_cancelacion,

	-- ESTE CAMPO ES NUEVO Y TENEMOS QUE COLOCARLO EN EL MÓDULO DE FECHAS (ESTA FECHA ES LA QUE DEBE APARECER EN EL PARTE CANARIAS)
	OTS.FECHINOT as Fecha_comienzo_trabajos,


	unidades.anau as nombre_instalacion, --NOMBRE DE LA INSTALACIÓN SOBRE LA QUE SE DA LA INCIDENCIA

	28 as funcionpk,   -- CAMPO FUNCIÓN Multiservicios Canarias Migrados
	655 as tipoequipopk, -- CAMPO TIPO DE EQUIPO EN BLANCO (TRABAJOS VARIOS)

	NOF + + '   -   (' + CON + ')' + '  -  ' + 
	case when (contacto.provincia = '38') then 'Tenerife'
		 when (contacto.provincia = '35') then 'Las Palmas'
		 when (contacto.provincia is null) then 'Todas las provincias'
	end as nomb,
	ots.idcont as contratista,
	(select top 1 pk_Codigo from Contratistas where ots.idcont = contratistas.CodigoContratista and esMANDIRE=1) as contratistapk,

	'Migración - Aplicación DIRE Mantenimiento' as Procedencia_de_creacion,
	'Migración - Aplicación DIRE Mantenimiento' as Procedencia_cierre,

	'Descripción:  ' + INCID + char(10) /*salto de línea*/ +  'Observaciones: ' + COMEN as Comentarios,


	--archivo as documento_adjunto, --TENER EN CUENTA NO SUBIR EL MISMO DOCUEMNTO DOS VECES
	--adjunto as si_archivo_adjunto,
	--adjunto.descrip as descripcion, --descripcion del archivo adjunto

	' ' as informacion_seguridad, --SIEMPRE EN BLANCO

	unidades.ceco as CECO,

	(select count(*) from ZZZ_ceco where ceco = replace(unidades.ceco,'-PI','')) as totalCECO,

	-----MODULO FINANCIERO
	pres as Numero_factura_1,
	unidades.IDU --COD. ARTEMIS DE LA INSTALACIÓN
	, tipo.dtp as Tipo_Instalacion,
	
	case when tipo.dtp  = 'ESTACION' then (
		select top 1 pk_codigo from estaciones where CentroCoste = replace(unidades.ceco,'-PI','') or CentroCoste = unidades.ceco
	) else (
		select top 1 pk_codigo from estaciones where unidades.idu = CodigoEstacion and esMANDIRE=1) 
	end as estacionpk 
	from MAN_DIRE.dbo.CONTRATAS 
		 inner join MAN_DIRE.dbo.contacto on contratas.idcont = contacto.CID 
		 inner join MAN_DIRE.dbo.ots on ots.IDCONT = CONTRATAS.IDCONT 
		 inner join MAN_DIRE.dbo.unidades on ots.IDU = unidades.IDU   
		 inner join MAN_DIRE.dbo.tipo on unidades.idtp = tipo.idtp -- nuevo 
		 inner join MAN_DIRE.dbo.ACCION on OTS.IDOTS = ACCION.OTSID   
		 --full JOIN MAN_DIRE.dbo.ADJUNTO on OTS.IDOTS = ADJUNTO.OTSID  
	where (left(contacto.Provincia,2) = left(UNIDADES.cp,2) or (contacto.Provincia is null))  and refer is not null
	and estado = 1 --CREADA
	order by Referencia, estado 

	OPEN CUR_INCIDENCIAS 
		fetch next from CUR_INCIDENCIAS into @referencia , @estadopk , @tipoavisopk , @tipomantmultipk , 
	        @observaciones, @numreaperturas , 
			@usucreacion , @fechacreacion , 
			@usumodificacion , @fechamodificacion , 
			@usuenvio , @fechaenvio , 
			@usucierre , @fechaenviocierre , 
			@fechacierremultiservicio , @fechacancelacion , @fechacomienzotrabajos,
			@nomInstalacion , 
			@funcionpk , @tipoequipopk ,
			@nomb, @idcont, @contratistapk ,
			@procedenciaCreacion , @procedenciaCierre ,
			@comentarios, 
			@infoseguridad ,
			@ceco ,	@totalCECO ,
			@numFactura ,
			@idu ,
			@tipoINSTALACION ,
			@estacionpk 
		while @@FETCH_STATUS = 0 
		begin 

			insert into multiservicios (referencia, FK_MultiserviciosEstados_PK_Codigo, FK_TiposAvisos_PK_Codigo, FK_TiposMantenimientosMultiservicios_PK_Codigo,
			observaciones, numeroReaperturas, UsuarioCreacion, FechaCreacion, UsuarioModificacion, FechaModificacion,
			FechaEnvio, FechaEnvioCierre, FechaCierre, FechaCancelacion,
			FK_CatalogoTiposEquipos_PK_Codigo,
			FK_Contratistas_PK_Codigo,
			ProcedenciaCreacion, ProcedenciaCierre,
			Comentarios, --NumeroFactura, 
			FK_Estaciones_PK_Codigo, esMANDIRE, fechaComienzoTrabajos, numeroFacturaPresupuesto)
			values (@referencia, @estadopk, @tipoavisopk, @tipomantmultipk, 
			        @observaciones, @numreaperturas, @usucreacion, @fechacreacion, @usumodificacion, @fechamodificacion,
					@fechaenvio, @fechaenviocierre, @fechacierremultiservicio, @fechacancelacion,
					@tipoequipopk, 
					@contratistapk, 
					@procedenciaCreacion, @procedenciaCierre,
					@comentarios, --@numFactura,
					@estacionpk,1, @fechacomienzotrabajos, @numFactura)

			SELECT @multiserviciopk = SCOPE_IDENTITY();

			--Añadir el histórico de comentarios  
			insert into MultiserviciosComentarios (fkMultiservicios_pkCodigo, fecha, origen, comentario, usuario) 
			values (@multiserviciopk, @fechacreacion, 'PERSONAL_DISA_DIRE', @comentarios, @usucreacion)

			 
			--Añadir los documentos  
			insert into MultiserviciosDocumentos (FK_Multiservicios_PK_Codigo, NombreFichero, Fichero, ContentType, Extension,
											  Nombre, 
											  FechaCreacion, UsuarioCreacion,
											  NombreFicheroOriginal, Longitud, provieneMasivo, Borrado, FK_TiposDocumentos_PK_Codigo)
			select @multiserviciopk, adjunto.Nombre, adjunto.Archivo, adjunto.Mime, adjunto.Ext,
				   adjunto.Nombre, adjunto.FechaMod, 
				   case adjunto.UsrMod
					when 'mario.lorenzo' then 96
					when 'noemi.mora' then 501
					when 'patricia.abad' then 100
					when 'pablo.jimenez' then 99
					when 'magdalena.perez' then 90
					else null
				   end as usrmod,
				   adjunto.Nombre, len(adjunto.archivo), 0 ,0, 38
			from MAN_DIRE.dbo.ots
			inner join	MAN_DIRE.dbo.ADJUNTO on OTS.IDOTS = ADJUNTO.OTSID 
			where refer = @referencia
			 
			--Insertar historial para CREADO  
			insert into MultiserviciosEstadosHistorial (FK_Multiservicios_PK_Codigo, FK_MultiserviciosEstados_PK_Codigo, fecha, usuario)
			select  @multiserviciopk, 2, @fechacreacion, @usucreacion
			 
			--Insertar historial para ENVIADO  
			select top 1 @histfechamod= FechaMod, @histusumod = accion.UsrMod
			from MAN_DIRE.dbo.ots 
					inner join MAN_DIRE.dbo.ACCION on OTS.IDOTS = ACCION.OTSID   
			where estado = 2 --ENVIADA  
			and REFER = @referencia

			insert into MultiserviciosEstadosHistorial (FK_Multiservicios_PK_Codigo, FK_MultiserviciosEstados_PK_Codigo, fecha, usuario)
			select top 1 @multiserviciopk, 3, FechaMod, accion.UsrMod
			from MAN_DIRE.dbo.ots 
					inner join MAN_DIRE.dbo.ACCION on OTS.IDOTS = ACCION.OTSID   
			where estado = 2 --ENVIADA  
			and REFER = @referencia
			IF @@ROWCOUNT > 0 
			BEGIN
				update Multiservicios set FK_MultiserviciosEstados_PK_Codigo = 3,
				FechaModificacion=@histfechamod,
				UsuarioModificacion= @histusumod,
				FechaEnvio = @histfechamod where PK_Codigo = @multiserviciopk
			END

			--Insertar historial para CERRADO 
			select top 1 @histfechamod= FechaMod, @histusumod = accion.UsrMod
			from MAN_DIRE.dbo.ots 
					inner join MAN_DIRE.dbo.ACCION on OTS.IDOTS = ACCION.OTSID   
			where estado = 3 -- CERRADA  
			and REFER = @referencia

			insert into MultiserviciosEstadosHistorial (FK_Multiservicios_PK_Codigo, FK_MultiserviciosEstados_PK_Codigo, fecha, usuario)
			select top 1 @multiserviciopk, 4, FechaMod, accion.UsrMod
			from MAN_DIRE.dbo.ots 
					inner join MAN_DIRE.dbo.ACCION on OTS.IDOTS = ACCION.OTSID   
			where estado = 3 -- CERRADA  
			and REFER = @referencia
			IF @@ROWCOUNT > 0 
			BEGIN
				update Multiservicios set FK_MultiserviciosEstados_PK_Codigo = 4,
				FechaModificacion=@histfechamod,
				UsuarioModificacion= @histusumod--,
				,FechaEnvioCierre = @histfechamod
				--FechaCierre = @fechacierremultiservicio --@histfechamod, ponemos el nuevo campo de fecha cierre
				where PK_Codigo = @multiserviciopk
			END
			
			
			fetch next from CUR_INCIDENCIAS into @referencia , @estadopk , @tipoavisopk , @tipomantmultipk , 
	        @observaciones, @numreaperturas , 
			@usucreacion , @fechacreacion, @usumodificacion, @fechamodificacion, 
			@usuenvio, @fechaenvio, @usucierre, @fechaenviocierre, 
			@fechacierremultiservicio, @fechacancelacion, @fechacomienzotrabajos,
			@nomInstalacion,  
			@funcionpk , @tipoequipopk , 
			@nomb, @idcont, @contratistapk , 
			@procedenciaCreacion , @procedenciaCierre , 
			@comentarios,  
			@infoseguridad ,
			@ceco ,	@totalCECO , 
			@numFactura ,
			@idu ,
			@tipoINSTALACION ,
			@estacionpk 
		end
	CLOSE CUR_INCIDENCIAS
	deallocate CUR_INCIDENCIAS

	/*************** FIN INCIDENCIAS *****************/
