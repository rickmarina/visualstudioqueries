pk_codigo nvarchar(50)
pk_codigo_entidad int 



USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  Trigger [dbo].[TR_Estaciones]    Script Date: 31/10/2016 14:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TR_Estaciones]

ON [dbo].[Estaciones]

AFTER INSERT,UPDATE

AS

BEGIN

    SET NOCOUNT ON;

	INSERT INTO EstacionesControlCambios(
           pk_codigo
		  ,pk_codigo_estaciones
		  ,[CodigoEstacion]
		  ,[Nombre]
		  ,[Direccion]
		  ,[CP]
		  ,[Localidad]
		  ,[Telefono]
		  ,[FAX]
		  ,[Email]
		  ,[FK_TiposEstaciones_PK_Codigo]
		  ,[Comentarios]
		  ,[FK_Provincias_PK_Codigo]
		  ,[ConfirmacionPorFax]
		  ,[ConfirmacionPorEmail]
		  ,[ConfirmacionPorSms]
		  ,[FK_EstacionesEstados_PK_Codigo]
		  ,[FK_Paises_PK_Codigo]
		  ,[FK_ComunidadesAutonomas_PK_Codigo]
		  ,[TelefonoMovil]
		  ,[IVRCode]
		  ,[IVRPin]
		  ,[IncidenciasPermitidoIVR]
		  ,[IncidenciasPermitidoManual]
		  ,[IntegracionActivada]
		  ,[IncidenciasPermitidasMovilidad]
		  ,[ComentariosPrivados]
		  ,[Longitud]
		  ,[Latitud]
		  ,[LocID]
		  ,[CodigoEuroshell]
		  ,[CAPEX]
		  ,[CEBE]
		  ,[IdCliente]
		  ,[Licencia]
		  ,[NumeroRegistroAutonomico]
		  ,[NumeroRegistroNacional]
		  ,[CAE]
		  ,[CIM]
		  ,[PIVFI]
		  ,[CentroCoste]
		  ,[FechaApertura],[UsuarioModificacion],[FechaModificacion], [CodigoSAP],[Sociedad],[LineaADSL])
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
          ,[PK_Codigo]
		  ,[CodigoEstacion]
		  ,[Nombre]
		  ,[Direccion]
		  ,[CP]
		  ,[Localidad]
		  ,[Telefono]
		  ,[FAX]
		  ,[Email]
		  ,[FK_TiposEstaciones_PK_Codigo]
		  ,[Comentarios]
		  ,[FK_Provincias_PK_Codigo]
		  ,[ConfirmacionPorFax]
		  ,[ConfirmacionPorEmail]
		  ,[ConfirmacionPorSms]
		  ,[FK_EstacionesEstados_PK_Codigo]
		  ,[FK_Paises_PK_Codigo]
		  ,[FK_ComunidadesAutonomas_PK_Codigo]
		  ,[TelefonoMovil]
		  ,[IVRCode]
		  ,[IVRPin]
		  ,[IncidenciasPermitidoIVR]
		  ,[IncidenciasPermitidoManual]
		  ,[IntegracionActivada]
		  ,[IncidenciasPermitidasMovilidad]
		  ,[ComentariosPrivados]
		  ,[Longitud]
		  ,[Latitud]
		  ,[LocID]
		  ,[CodigoEuroshell]
		  ,[CAPEX]
		  ,[CEBE]
		  ,[IdCliente]
		  ,[Licencia]
		  ,[NumeroRegistroAutonomico]
		  ,[NumeroRegistroNacional]
		  ,[CAE]
		  ,[CIM]
		  ,[PIVFI]
		  ,[CentroCoste]
		  ,[FechaApertura],[UsuarioModificacion],[FechaModificacion], [CodigoSAP],[Sociedad],[LineaADSL]
  	from inserted

END
