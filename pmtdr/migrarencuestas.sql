/****** Script for SelectTopNRows command from SSMS  ******/

USE [PMTDR_V_4]
GO
INSERT INTO [dbo].[EncuestasLCG]
           ([borrada]
           ,[usuarioAlta]
           ,[usuarioModificacion]
           ,[fechaCreacion]
           ,[fechaModificacion]
           ,[anyo]
           ,[periodo]
           ,[fk_estaciones_pkCodigo]
           ,[pregunta1]
           ,[pregunta2]
           ,[pregunta3]
           ,[pregunta4]
           ,[pregunta5]
           ,[pregunta6]
           ,[pregunta7]
           ,[pregunta8]
           ,[pregunta9]
           ,[pregunta10]
           ,[pregunta11]
           ,[pregunta12]
           ,[pregunta13]
           ,[pregunta14]
           ,[pregunta15]
           ,[pregunta16]
           ,[pregunta17]
           ,[pregunta18]
           ,[pregunta19]
           ,[pregunta20]
           ,[pregunta21]
           ,[pregunta22]
           ,[pregunta23]
           ,[pregunta24]
           ,[pregunta25]
           ,[pregunta26]
           ,[pregunta27]
           ,[pregunta28]
           ,[pregunta29]
           ,[pregunta30]
           ,[pregunta31]
           ,[pregunta32]
           ,[pregunta33]
           ,[pregunta34]
           ,[pregunta35]
           ,[pregunta36]
           ,[pregunta37]
           ,[pregunta38]
           ,[pregunta39]
           ,[totalAseosPotencial]
           ,[totalAseosPuntos]
           ,[totalAseosPorcentaje]
           ,[totalPersonalPotencial]
           ,[totalPersonalPuntos]
           ,[totalPersonalPorcentaje]
           ,[totalPistaPotencial]
           ,[totalPistaPuntos]
           ,[totalPistaPorcentaje]
           ,[totalSSMAPotencial]
           ,[totalSSMAPuntos]
           ,[totalSSMAPorcentaje]
           ,[totalTiendaPotencial]
           ,[totalTiendaPuntos]
           ,[totalTiendaPorcentaje]
           ,[totalPotencialFinal]
           ,[totalPuntosFinal]
           ,[totalPorcentajeFinal])
SELECT [borrada]
      ,[usuarioAlta]
      ,[usuarioModificacion]
      ,[fechaCreacion]
      ,[fechaModificacion]
      ,[anyo]
      ,[periodo]
      ,[fk_estaciones_pkCodigo]
      ,[pregunta1]
      ,[pregunta2]
      ,[pregunta3]
      ,[pregunta4]
      ,[pregunta5]
      ,[pregunta6]
      ,[pregunta7]
      ,[pregunta8]
      ,[pregunta9]
      ,[pregunta10]
      ,[pregunta11]
      ,[pregunta12]
      ,[pregunta13]
      ,[pregunta14]
      ,[pregunta15]
      ,[pregunta16]
      ,[pregunta17]
      ,[pregunta18]
      ,[pregunta19]
      ,[pregunta20]
      ,[pregunta21]
      ,[pregunta22]
      ,[pregunta23]
      ,[pregunta24]
      ,[pregunta25]
      ,[pregunta26]
      ,[pregunta27]
      ,[pregunta28]
      ,[pregunta29]
      ,[pregunta30]
      ,[pregunta31]
      ,[pregunta32]
      ,[pregunta33]
      ,[pregunta34]
      ,[pregunta35]
      ,[pregunta36]
      ,[pregunta37]
      ,[pregunta38]
      ,[pregunta39]
      ,[totalAseosPotencial]
      ,[totalAseosPuntos]
      ,[totalAseosPorcentaje]
      ,[totalPersonalPotencial]
      ,[totalPersonalPuntos]
      ,[totalPersonalPorcentaje]
      ,[totalPistaPotencial]
      ,[totalPistaPuntos]
      ,[totalPistaPorcentaje]
      ,[totalSSMAPotencial]
      ,[totalSSMAPuntos]
      ,[totalSSMAPorcentaje]
      ,[totalTiendaPotencial]
      ,[totalTiendaPuntos]
      ,[totalTiendaPorcentaje]
      ,[totalPotencialFinal]
      ,[totalPuntosFinal]
      ,[totalPorcentajeFinal]
  FROM [PMTDR_V_2].[dbo].[EncuestasLCG]