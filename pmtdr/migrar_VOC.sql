
SET IDENTITY_INSERT PMTDR_V_4.dbo.[TuOpinionImportaEnviosClientes] ON;
GO
insert into PMTDR_V_4.[dbo].[TuOpinionImportaEnviosClientes]
SELECT [pkCodigo]
      ,[cl_cliente]
      ,[razon_social]
      ,[nombre]
      ,[apellido1]
      ,[apellido2]
      ,[email]
      ,[estacion_codigo]
      ,[estacion_nombre]
      ,[fechaEnvio]
      ,[codigoUnico]
      ,[nombreCompleto]
      ,[fecha]
      ,[hora]
      ,[cl_tarjeta]
      ,[tipoEnvio]
      ,[diasParaProximoEnvio]
      ,[estado]
      ,[estadoDescripcion]
      ,[sexo]
      ,[nombreCompletoConTratamiento]
      ,[shellURL]
  FROM [PMTDR_V_2].dbo.[TuOpinionImportaEnviosClientes]


SET IDENTITY_INSERT PMTDR_V_4.dbo.[TuOpinionImportaEnviosClientes] OFF;
GO


insert into TuOpinionImportaBajas
SELECT [email]
      ,[codigoUnico]
      ,[fecha]
      ,[x2]
      ,[motivo]
  FROM PMTDR_V_2.[dbo].[TuOpinionImportaBajas]
GO
