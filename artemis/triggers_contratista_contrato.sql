/* Trigger contratista */

/****** Object:  Table [dbo].[ContratistasControlCambios]    Script Date: 31/10/2016 15:23:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ContratistasControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
    [pk_codigo_Contratista] [int] NOT NULL,
	[CodigoContratista] [nvarchar](200) NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[CIF] [nvarchar](200) NULL,
	[Direccion] [nvarchar](200) NULL,
	[CP] [nvarchar](50) NULL,
	[Localidad] [nvarchar](200) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[ReferenciaExterna] [nvarchar](200) NULL,
	[Telefono] [nvarchar](200) NULL,
	[FAX] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Comentarios] [nvarchar](max) NULL,
	[ConfirmacionPorFax] [bit] NULL,
	[ConfirmacionPorEmail] [bit] NULL,
	[FK_ContratistasEstados_PK_Codigo] [int] NOT NULL,
	[FK_Paises_PK_Codigo] [int] NOT NULL,
	[FK_Provincias_PK_Codigo] [int] NOT NULL,
	[FK_ComunidadesAutonomas_PK_Codigo] [int] NOT NULL,
	[TelefonoMovil] [nvarchar](200) NULL,
	[IVRCode] [nvarchar](200) NULL,
	[IVRPin] [nvarchar](200) NULL,
	[IncidenciasPermitidoIVR] [bit] NOT NULL,
	[IncidenciasPermitidoManual] [bit] NOT NULL,
	[IntegracionAperturaActivado] [bit] NOT NULL,
	[IntegracionAperturaTest] [bit] NOT NULL,
	[URLContratista] [nvarchar](250) NULL,
	[DireccionRespuesta] [nvarchar](250) NULL,
	[ClaveSecretaTest] [nvarchar](250) NULL,
	[ClaveSecretaProduccion] [nvarchar](250) NULL,
	[IntegracionAperturaFechaComienzo] [datetime] NULL,
	[IntegracionCierreActivado] [bit] NOT NULL,
	[IntegracionCierreTest] [bit] NOT NULL,
	[IntegracionCierreFechaComienzo] [datetime] NULL,
	[ClaveSecretaCierreTest] [nvarchar](250) NULL,
	[ClaveSecretaCierreProduccion] [nvarchar](250) NULL,
	[IncidenciasPermitidasMovilidad] [bit] NULL,
	[ComentariosPrivados] [nvarchar](max) NULL,
	[EmailEnvioInformesProgramados] [nvarchar](max) NULL,
	[Multiservicio] [bit] NULL,
	[EmailEnvioMultiservicio] [nvarchar](max) NULL,
	[ConfirmacionPorSms] [bit] NULL,
	[TelefonoMovilMultiservicio] [nvarchar](max) NULL,
	[recibirEmailComentariosEESS] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--Trigger

CREATE TRIGGER [dbo].[TR_Contratistas]

ON [dbo].[Contratistas]

AFTER INSERT,UPDATE

AS

BEGIN

    SET NOCOUNT ON;

	INSERT INTO ContratistasControlCambios (
           pk_codigo
		  ,pk_codigo_Contratista
		  ,[CodigoContratista]
           ,[Nombre]
           ,[CIF]
           ,[Direccion]
           ,[CP]
           ,[Localidad]
           ,[Descripcion]
           ,[ReferenciaExterna]
           ,[Telefono]
           ,[FAX]
           ,[Email]
           ,[Comentarios]
           ,[ConfirmacionPorFax]
           ,[ConfirmacionPorEmail]
           ,[FK_ContratistasEstados_PK_Codigo]
           ,[FK_Paises_PK_Codigo]
           ,[FK_Provincias_PK_Codigo]
           ,[FK_ComunidadesAutonomas_PK_Codigo]
           ,[TelefonoMovil]
           ,[IVRCode]
           ,[IVRPin]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[IntegracionAperturaActivado]
           ,[IntegracionAperturaTest]
           ,[URLContratista]
           ,[DireccionRespuesta]
           ,[ClaveSecretaTest]
           ,[ClaveSecretaProduccion]
           ,[IntegracionAperturaFechaComienzo]
           ,[IntegracionCierreActivado]
           ,[IntegracionCierreTest]
           ,[IntegracionCierreFechaComienzo]
           ,[ClaveSecretaCierreTest]
           ,[ClaveSecretaCierreProduccion]
           ,[IncidenciasPermitidasMovilidad]
           ,[ComentariosPrivados]
           ,[EmailEnvioInformesProgramados]
           ,[Multiservicio]
           ,[EmailEnvioMultiservicio]
           ,[ConfirmacionPorSms]
           ,[TelefonoMovilMultiservicio]
    ,[recibirEmailComentariosEESS])
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
          ,[PK_Codigo]
		 ,[CodigoContratista]
        ,[Nombre]
        ,[CIF]
        ,[Direccion]
        ,[CP]
        ,[Localidad]
        ,[Descripcion]
        ,[ReferenciaExterna]
        ,[Telefono]
        ,[FAX]
        ,[Email]
        ,[Comentarios]
        ,[ConfirmacionPorFax]
        ,[ConfirmacionPorEmail]
        ,[FK_ContratistasEstados_PK_Codigo]
        ,[FK_Paises_PK_Codigo]
        ,[FK_Provincias_PK_Codigo]
        ,[FK_ComunidadesAutonomas_PK_Codigo]
        ,[TelefonoMovil]
        ,[IVRCode]
        ,[IVRPin]
        ,[IncidenciasPermitidoIVR]
        ,[IncidenciasPermitidoManual]
        ,[IntegracionAperturaActivado]
        ,[IntegracionAperturaTest]
        ,[URLContratista]
        ,[DireccionRespuesta]
        ,[ClaveSecretaTest]
        ,[ClaveSecretaProduccion]
        ,[IntegracionAperturaFechaComienzo]
        ,[IntegracionCierreActivado]
        ,[IntegracionCierreTest]
        ,[IntegracionCierreFechaComienzo]
        ,[ClaveSecretaCierreTest]
        ,[ClaveSecretaCierreProduccion]
        ,[IncidenciasPermitidasMovilidad]
        ,[ComentariosPrivados]
        ,[EmailEnvioInformesProgramados]
        ,[Multiservicio]
        ,[EmailEnvioMultiservicio]
        ,[ConfirmacionPorSms]
        ,[TelefonoMovilMultiservicio]
        ,[recibirEmailComentariosEESS]
  	from inserted

END


/* CONTRATOS CONTROL CAMBIOS */

/****** Object:  Table [dbo].[ContratosControlCambios]    Script Date: 31/10/2016 15:44:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ContratosControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
    [pk_codigo_Contrato] [int] NOT NULL,
	[Referencia] [nvarchar](200) NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[Comentarios] [nvarchar](max) NULL,
	[FK_TiposContratos_PK_Codigo] [int] NOT NULL,
	[FK_ContratosEstados_PK_Codigo] [int] NOT NULL,
	[FK_Contratistas_PK_Codigo] [int] NOT NULL,
	[CodigoContrato] [nvarchar](200) NULL,
	[DiasPagoFactura] [nvarchar](200) NULL,
	[PeriodicidadPagoFactura] [nvarchar](200) NULL,
	[ComentarioFactura] [nvarchar](max) NULL,
	[ProcesamientoAutomatico] [bit] NOT NULL,
	[IncidenciasPermitidoIVR] [bit] NOT NULL,
	[IncidenciasPermitidoManual] [bit] NOT NULL,
	[ConfirmacionPorSms] [bit] NULL,
	[TelefonoMovil] [nvarchar](200) NULL,
	[Email] [nvarchar](300) NULL,
	[FAX] [nvarchar](200) NULL,
	[ConfirmacionPorFax] [bit] NULL,
	[ConfirmacionPorEmail] [bit] NULL,
	[IncidenciasPermitidasMovilidad] [bit] NULL,
	[ComentariosPrivados] [nvarchar](max) NULL) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


--Trigger

CREATE TRIGGER [dbo].[TR_Contratos]

ON [dbo].[Contratos]

AFTER INSERT,UPDATE

AS

BEGIN

    SET NOCOUNT ON;

	INSERT INTO ContratosControlCambios 
           ([PK_Codigo]
           ,[pk_codigo_Contrato]
           ,[Referencia]
           ,[Nombre]
           ,[FechaInicio]
           ,[FechaFin]
           ,[Comentarios]
           ,[FK_TiposContratos_PK_Codigo]
           ,[FK_ContratosEstados_PK_Codigo]
           ,[FK_Contratistas_PK_Codigo]
           ,[CodigoContrato]
           ,[DiasPagoFactura]
           ,[PeriodicidadPagoFactura]
           ,[ComentarioFactura]
           ,[ProcesamientoAutomatico]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[ConfirmacionPorSms]
           ,[TelefonoMovil]
           ,[Email]
           ,[FAX]
           ,[ConfirmacionPorFax]
           ,[ConfirmacionPorEmail]
           ,[IncidenciasPermitidasMovilidad]
           ,[ComentariosPrivados])
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
        ,[PK_Codigo]
        ,[Referencia]
        ,[Nombre]
        ,[FechaInicio]
        ,[FechaFin]
        ,[Comentarios]
        ,[FK_TiposContratos_PK_Codigo]
        ,[FK_ContratosEstados_PK_Codigo]
        ,[FK_Contratistas_PK_Codigo]
        ,[CodigoContrato]
        ,[DiasPagoFactura]
        ,[PeriodicidadPagoFactura]
        ,[ComentarioFactura]
        ,[ProcesamientoAutomatico]
        ,[IncidenciasPermitidoIVR]
        ,[IncidenciasPermitidoManual]
        ,[ConfirmacionPorSms]
        ,[TelefonoMovil]
        ,[Email]
        ,[FAX]
        ,[ConfirmacionPorFax]
        ,[ConfirmacionPorEmail]
        ,[IncidenciasPermitidasMovilidad]
        ,[ComentariosPrivados]
  	from inserted

END
