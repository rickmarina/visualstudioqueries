USE [AdvancedArtemisDB_FORM]
GO
CREATE NONCLUSTERED INDEX [indexfkcontratoadhocpk]
ON [dbo].[ContratosADHOCEstacionesModelos] ([FK_EstacionesModelos_PK_Codigo])
INCLUDE ([FK_ContratosADHOC_PK_Codigo])
GO
