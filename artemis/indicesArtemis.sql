/*
Faltan detalles del índice de SQLQuery5.sql - localhost.AdvancedArtemisDB_FORM (PLESVSSQL12\Ricardo (69))
El procesador de consultas estima que la implementación del siguiente índice podría mejorar el costo de la consulta en un 11.5349%.
*/


USE [AdvancedArtemisDB_FORM]
GO
CREATE NONCLUSTERED INDEX [iContratosADHOCEstacionesModelosfkestionesmodelos_pk]
ON [dbo].[ContratosADHOCEstacionesModelos] ([FK_EstacionesModelos_PK_Codigo])

GO

/*
Faltan detalles del índice de SQLQuery3.sql - localhost.AdvancedArtemisDB_FORM (PLESVSSQL12\Ricardo (70))
El procesador de consultas estima que la implementación del siguiente índice podría mejorar el costo de la consulta en un 9.983%.
*/


USE [AdvancedArtemisDB_FORM]
GO
CREATE NONCLUSTERED INDEX [iEstacionesModelosCADHOC]
ON [dbo].[EstacionesModelos] ([FK_CatalogoModelos_PK_Codigo],[FK_Estaciones_PK_Codigo])
INCLUDE ([PK_Codigo],[NumeroOrden],[Descripcion],[NumeroSerie],[FechaInstalacion],[Denominacion],[CodigoSAP],[LimiteGarantia],[FK_EstacionesModelosEstados_PK_Codigo],[CodigoEstacionModelo],[IncidenciasPermitidoIVR],[IncidenciasPermitidoManual],[Comentarios],[FK_TiposMantenimientos_PK_Codigo],[IncidenciasPermitidasMovilidad],[ComentariosPrivados],[provieneCarga],[UsuarioModificacion],[FechaModificacion],[UsuarioBaja],[FechaBaja])
GO

