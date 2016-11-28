/* Clientes portugueses, excluir gasóleo profesional */

INSERT INTO [dbo].[SuministrosErrores_Portugueses_20161102]
           ([FK_RegistroComunicaciones_Id]
           ,[IdMovCont]
           ,[CIM]
           ,[C_VENTA]
           ,[Fecha]
           ,[Hora]
           ,[CodProd]
           ,[Lit]
           ,[NIF]
           ,[Matricula]
           ,[CodigoError]
           ,[DescripcionError])
select [FK_RegistroComunicaciones_Id]
           ,[IdMovCont]
           ,[CIM]
           ,[C_VENTA]
           ,[Fecha]
           ,[Hora]
           ,[CodProd]
           ,[Lit]
           ,[NIF]
           ,[Matricula]
           ,[CodigoError]
           ,[DescripcionError]
 from SuministrosErrores where nif in ('510796494','510132588','502222557','505245779','501458425','504832204','504706233','510266339','501791850','506220109','504477889')

 delete from SuministrosErrores  where nif in ('510796494','510132588','502222557','505245779','501458425','504832204','504706233','510266339','501791850','506220109','504477889')

 select * from [SuministrosErrores_Portugueses_20161102]