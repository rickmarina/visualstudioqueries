USE [AdvancedArtemisDB]
GO
CREATE NONCLUSTERED INDEX [indexfkcontratoadhocpk]
ON [dbo].[ContratosADHOCEstacionesModelos] ([FK_EstacionesModelos_PK_Codigo])
INCLUDE ([FK_ContratosADHOC_PK_Codigo])
GO
USE [AdvancedArtemisDB]
GO
CREATE NONCLUSTERED INDEX [indexpkfkfk]
ON [dbo].[EstacionesModelos] ([FK_Estaciones_PK_Codigo])
INCLUDE ([PK_Codigo],[FK_CatalogoModelos_PK_Codigo],[FK_EstacionesModelosEstados_PK_Codigo])
GO