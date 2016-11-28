USE [AdvancedArtemisDB_FORM]
GO

/****** Object:  View [dbo].[VW_REPORT_AA_IncidenciasDetalle]    Script Date: 10/10/2016 13:04:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[VW_REPORT_AA_IncidenciasDetalle]
WITH SCHEMABINDING
AS
select distinct 
       incidencias.pk_codigo as incidenciapkcodigo, 
	   incidencias.UsuarioCreacion as usuariocreacion, --new
       Incidencias.FechaCreacion as IncidenciasFechaCreacion, 
       Incidencias.FechaLimiteResolucion as FechaLimiteResolucion,
       Estaciones.CP as cpEstacion, 
       IncidenciasEstados.Descripcion as EstadoDescripcion, 
       Estaciones.Nombre as NombreEstaciones,
       Estaciones.CodigoEstacion as CodigoEstacion, 
       ComunidadesAutonomas.Descripcion as ComunidadAutonomaDescripcion,
       year(Incidencias.fechacreacion) as año,
       month(Incidencias.fechacreacion) as mes, 
       CatalogoTiposEquipos.Nombre as NombreTipoEquipo,
       TiposEstaciones.Nombre as NombreTipoEstacion, 
       CatalogoFunciones.Nombre as NombreFunciones,
       EstacionesEstados.Nombre as Estado, 
       Incidencias.Referencia as Referencia,
       Incidencias.FechaEnvio as FechaEnvio, 
       Incidencias.FechaEnvioCierre as FechaEnvioCierre, 
       Incidencias.FechaCierre as FechaCierre,
       Incidencias.Comentarios as Comentarios,
       Contratistas.Nombre as ContratistaNombre,
       CategoriasFallos.Descripcion as CategoriaFallo, 
	   categoriasfallos.pk_codigo as categoriafallopkcodigo,
	   causasfallos.pk_codigo as causafallopkcodigo,
       CausasFallos.nombre as causaFalloNombre ,
	   CausasFallos.ivrcode as causaFalloCodigoIVR,
	   Contratistas.PK_Codigo as ContratistasPK_Codigo,
	   CatalogoFunciones.PK_Codigo as CatalogoFuncionesPK_Codigo,
       CatalogoTiposEquipos.PK_Codigo as CatalogoTiposEquiposPK_Codigo,
       Estaciones.pk_codigo as EstacionesPK_Codigo,
	   ContratosAdhoc.pk_codigo as ContratosAdhocPK_Codigo,
       incidencias.fk_incidenciasestados_pk_codigo as incidenciaestadopkcodigo
from [dbo].Incidencias 
     inner join [dbo].Contratistas 							on Contratistas.pk_codigo= FK_Contratistas_PK_Codigo_Origen 
     inner join [dbo].Estaciones   							on Estaciones.pk_codigo=Incidencias.FK_Estaciones_PK_Codigo_Origen 
     inner join [dbo].EstacionesEstados   					on EstacionesEstados.pk_codigo=Estaciones.FK_EstacionesEstados_PK_Codigo 
     inner join [dbo].TiposEstaciones   					on TiposEstaciones.pk_codigo=Estaciones.FK_TiposEstaciones_PK_Codigo 
     inner join [dbo].ComunidadesAutonomas    				on ComunidadesAutonomas.pk_codigo= Estaciones.fk_comunidadesautonomas_pk_codigo 
     inner join [dbo].EstacionesModelos   					on EstacionesModelos.pk_codigo=Incidencias.FK_EstacionesModelos_PK_Codigo_Origen 
     left join [dbo].CausasFallos                           on CausasFallos.pk_codigo = incidencias.FK_CausasFallos_PK_Codigo_Solucion 
     inner join [dbo].CatalogoModelos   					on CatalogoModelos.pk_codigo=EstacionesModelos.FK_CatalogoModelos_PK_Codigo 
     inner join [dbo].CatalogoTiposEquipos  				on CatalogoTiposEquipos.pk_codigo=CatalogoModelos.FK_CatalogoTiposEquipos_PK_Codigo 
     inner join [dbo].CatalogoFunciones 					on CatalogoFunciones.Pk_Codigo=CatalogoTiposEquipos.FK_CatalogoFunciones_PK_Codigo 
     inner join [dbo].CatalogoErrores   					on CatalogoErrores.PK_Codigo=incidencias.FK_CatalogoErrores_PK_Codigo_Origen  
     inner join [dbo].ContratosADHOC   					    on ContratosADHOC.PK_Codigo=Incidencias.FK_ContratosADHOC_PK_Codigo_Origen 
     inner join [dbo].CategoriasFallos   					on CategoriasFallos.PK_Codigo=(select top 1 ContratosMatriz.FK_CategoriasFallos_PK_Codigo 
                                                                                     from [dbo].ContratosMatriz 
                                                                                     where ContratosMatriz.FK_CatalogoErrores_PK_Codigo=CatalogoErrores.PK_Codigo and 
                                                                                           ContratosMatriz.FK_Contratos_PK_Codigo=ContratosADHOC.FK_Contratos_PK_Codigo and 
                                                                                           ContratosMatriz.FK_CatalogoTiposEquipos_PK_Codigo=CatalogoTiposEquipos.pk_codigo 
                                                                                     ) 
     inner join [dbo].IncidenciasEstados   					on IncidenciasEstados.PK_Codigo=Incidencias.FK_IncidenciasEstados_PK_Codigo 


GO


