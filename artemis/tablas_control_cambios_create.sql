/* Control de cambios HIST */

USE [AdvancedArtemisDB_HIST]
GO

/****** Object:  Table [dbo].[ContratistasControlCambios]    Script Date: 14/11/2016 12:07:49 ******/
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

GO

/****** Object:  Table [dbo].[ContratosADHOCControlCambios]    Script Date: 14/11/2016 12:08:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ContratosADHOCControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
	[PK_Codigo_ContratosADHOC] [int] NOT NULL,
	[FK_Contratos_PK_Codigo] [int] NOT NULL,
	[FechaMovimiento] [datetime] NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[NumeroEquipamientos] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FuncionesSeleccionadas] [nvarchar](max) NULL,
	[TiposEquiposSeleccionados] [nvarchar](max) NULL,
	[ModelosSeleccionados] [nvarchar](max) NULL,
	[GruposEstacionesSeleccionados] [nvarchar](max) NULL,
	[EstacionesGrupoEstacionesSeleccionadas] [nvarchar](max) NULL,
	[EstacionesIndividualesSeleccionadas] [nvarchar](max) NULL,
	[ProvinciasSeleccionadas] [nvarchar](max) NULL,
	[EstacionesProvinciasSeleccionadas] [nvarchar](max) NULL,
	[IncidenciasPermitidoIVR] [bit] NOT NULL,
	[IncidenciasPermitidoManual] [bit] NOT NULL,
	[FK_ContratosADHOCEstados_PK_Codigo] [int] NOT NULL,
	[EstacionesModelosEstadosSeleccionados] [nvarchar](max) NULL,
	[TodoCatalogo] [bit] NULL,
	[TodasEstaciones] [bit] NULL,
	[CodigoContratoADHOC] [nvarchar](200) NULL,
	[FK_HorariosApertura_PK_Codigo] [int] NULL,
	[ContratoADHOCPadrePkCodigo] [int] NULL,
	[IncidenciasPermitidasMovilidad] [bit] NULL,
	[NoUsarHorarios] [bit] NULL,
	[ComentariosPrivados] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ContratosADHOCControlCambios] ADD  CONSTRAINT [DF_ContratosADHOCControlCambios_FechaMovimiento]  DEFAULT (getdate()) FOR [FechaMovimiento]
GO

/****** Object:  Table [dbo].[ContratosControlCambios]    Script Date: 14/11/2016 12:08:25 ******/
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
	[ComentariosPrivados] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[EstacionesControlCambios]    Script Date: 14/11/2016 12:08:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EstacionesControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
	[PK_Codigo_Estaciones] [int] NULL,
	[CodigoEstacion] [nvarchar](50) NULL,
	[Nombre] [nvarchar](200) NULL,
	[Direccion] [nvarchar](200) NULL,
	[CP] [nvarchar](200) NULL,
	[Localidad] [nvarchar](200) NULL,
	[Telefono] [nvarchar](200) NULL,
	[FAX] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[FK_TiposEstaciones_PK_Codigo] [int] NULL,
	[Comentarios] [nvarchar](max) NULL,
	[FK_Provincias_PK_Codigo] [int] NULL,
	[ConfirmacionPorFax] [bit] NULL,
	[ConfirmacionPorEmail] [bit] NULL,
	[ConfirmacionPorSms] [bit] NULL,
	[FK_EstacionesEstados_PK_Codigo] [int] NULL,
	[FK_Paises_PK_Codigo] [int] NULL,
	[FK_ComunidadesAutonomas_PK_Codigo] [int] NULL,
	[TelefonoMovil] [nvarchar](200) NULL,
	[IVRCode] [nvarchar](200) NULL,
	[IVRPin] [nvarchar](200) NULL,
	[IncidenciasPermitidoIVR] [bit] NULL,
	[IncidenciasPermitidoManual] [bit] NULL,
	[IntegracionActivada] [bit] NULL,
	[IncidenciasPermitidasMovilidad] [bit] NULL,
	[ComentariosPrivados] [nvarchar](max) NULL,
	[Longitud] [nvarchar](200) NULL,
	[Latitud] [nvarchar](200) NULL,
	[LocID] [nvarchar](200) NULL,
	[CodigoEuroshell] [nvarchar](200) NULL,
	[CAPEX] [nvarchar](200) NULL,
	[CEBE] [nvarchar](200) NULL,
	[IdCliente] [nvarchar](200) NULL,
	[Licencia] [nvarchar](200) NULL,
	[NumeroRegistroAutonomico] [nvarchar](200) NULL,
	[NumeroRegistroNacional] [nvarchar](200) NULL,
	[CAE] [nvarchar](200) NULL,
	[CIM] [nvarchar](200) NULL,
	[PIVFI] [nvarchar](200) NULL,
	[CentroCoste] [nvarchar](50) NULL,
	[FechaApertura] [datetime] NULL,
	[UsuarioModificacion] [nvarchar](200) NULL,
	[FechaModificacion] [datetime] NULL,
	[CodigoSAP] [nvarchar](200) NULL,
	[Sociedad] [nvarchar](50) NULL,
	[LineaADSL] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


/****** Object:  Table [dbo].[EstacionesModelosControlCambios]    Script Date: 14/11/2016 12:09:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EstacionesModelosControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
	[PK_Codigo_EstacionesModelos] [bigint] NULL,
	[FK_Estaciones_PK_Codigo] [int] NOT NULL,
	[FK_CatalogoModelos_PK_Codigo] [int] NOT NULL,
	[NumeroOrden] [int] NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[NumeroSerie] [nvarchar](200) NULL,
	[FechaInstalacion] [datetime] NULL,
	[Denominacion] [nvarchar](200) NULL,
	[CodigoSAP] [nvarchar](200) NULL,
	[LimiteGarantia] [datetime] NULL,
	[FK_EstacionesModelosEstados_PK_Codigo] [int] NOT NULL,
	[CodigoEstacionModelo] [nvarchar](200) NULL,
	[IncidenciasPermitidoIVR] [bit] NOT NULL,
	[IncidenciasPermitidoManual] [bit] NOT NULL,
	[Comentarios] [nvarchar](max) NULL,
	[FK_TiposMantenimientos_PK_Codigo] [int] NULL,
	[IncidenciasPermitidasMovilidad] [bit] NULL,
	[ComentariosPrivados] [nvarchar](max) NULL,
	[provieneCarga] [bit] NULL,
	[UsuarioModificacion] [nvarchar](200) NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioBaja] [nvarchar](200) NULL,
	[FechaBaja] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[EstacionesModelosControlCambios] ADD  CONSTRAINT [DF__Estacione__Incid__795DFB40]  DEFAULT ((1)) FOR [IncidenciasPermitidoIVR]
GO

ALTER TABLE [dbo].[EstacionesModelosControlCambios] ADD  CONSTRAINT [DF__Estacione__Incid__7A521F79]  DEFAULT ((1)) FOR [IncidenciasPermitidoManual]
GO

/****** Object:  Table [dbo].[IncidenciasControlCambios]    Script Date: 14/11/2016 12:09:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IncidenciasControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
	[PK_Codigo_Incidencias] [int] NULL,
	[Referencia] [nvarchar](200) NULL,
	[UsuarioCreacion] [nvarchar](200) NULL,
	[UsuarioModificacion] [nvarchar](200) NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[ProcedenciaCreacion] [nvarchar](50) NULL,
	[FK_IncidenciasEstados_PK_Codigo] [int] NULL,
	[FK_EstacionesModelos_PK_Codigo_Origen] [int] NULL,
	[FK_ContratosADHOC_PK_Codigo_Origen] [int] NULL,
	[FK_CatalogoErrores_PK_Codigo_Origen] [int] NULL,
	[Comentarios] [nvarchar](max) NULL,
	[DescripcionAdicionalError] [nvarchar](max) NULL,
	[FK_EstacionesModelos_PK_Codigo_Solucion] [int] NULL,
	[FK_ContratosADHOC_PK_Codigo_Solucion] [int] NULL,
	[FK_CatalogoErrores_PK_Codigo_Solucion] [int] NULL,
	[FechaCierre] [datetime] NULL,
	[FechaReferencia] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
	[FechaLimiteResolucion] [datetime] NULL,
	[FK_Estaciones_PK_Codigo_Origen] [int] NULL,
	[FK_Estaciones_PK_Codigo_Solucion] [int] NULL,
	[FK_Contratistas_PK_Codigo_Origen] [int] NULL,
	[FK_Contratistas_PK_Codigo_Solucion] [int] NULL,
	[IncidenciaEnviada] [bit] NULL,
	[IncidenciaCierreEnviado] [bit] NULL,
	[FechaEnvioCierre] [datetime] NULL,
	[FK_CausasFallos_PK_Codigo_Solucion] [int] NULL,
	[ProcedenciaCierre] [nvarchar](200) NULL,
	[CodigoErrorIVR] [nvarchar](200) NULL,
	[FechaCancelacion] [datetime] NULL,
	[MotivoCancelacion] [nvarchar](max) NULL,
	[FechaRevisita] [datetime] NULL,
	[MotivoRevisita] [nvarchar](max) NULL,
	[IVRCreacionTelefono] [nvarchar](50) NULL,
	[IVRCierreTelefono] [nvarchar](50) NULL,
	[ForzarIncidenciaEnvio] [bit] NULL,
	[ForzarIncidenciaEnvioCierre] [bit] NULL,
	[FechaLimiteResolucionOriginal] [datetime] NULL,
	[IntegracionCodigoCierre] [nvarchar](250) NULL,
	[IntegracionCodigoApertura] [nvarchar](250) NULL,
	[FechaIntegracionCierre] [datetime] NULL,
	[ConformeEstacionCierre] [nvarchar](50) NULL,
	[Aux1] [nvarchar](200) NULL,
	[Aux2] [nvarchar](200) NULL,
	[DescripcionAdicionalCierreEstacion] [nvarchar](max) NULL,
	[FechaIntegracionApertura] [datetime] NULL,
	[noComprobarIncidenciasPermitidasIVROrigen] [bit] NULL,
	[noComprobarIncidenciasPermitidasWebOrigen] [bit] NULL,
	[noComprobarIncidenciasPermitidasMovilidadOrigen] [bit] NULL,
	[noComprobarIncidenciasPermitidasIVRSolucion] [bit] NULL,
	[noComprobarIncidenciasPermitidasWebSolucion] [bit] NULL,
	[noComprobarIncidenciasPermitidasMovilidadSolucion] [bit] NULL,
	[noComprobarHorariosActivosOrigen] [bit] NULL,
	[noComprobarHorariosActivosSolucion] [bit] NULL,
	[IdentificacionConformeEstacionCierre] [nvarchar](250) NULL,
	[FK_IncidenciasEstados_PK_Codigo_Proximo] [int] NULL,
	[comentariosPrivados] [nvarchar](max) NULL,
	[provieneIVR] [bit] NULL,
	[cierreIVR] [bit] NULL,
	[numeroReaperturas] [int] NULL,
	[aux3] [nvarchar](200) NULL,
	[aux4] [nvarchar](200) NULL,
	[UsuarioReapertura] [nvarchar](200) NULL,
	[FechaReapertura] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[MultiserviciosControlCambios]    Script Date: 14/11/2016 12:10:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MultiserviciosControlCambios](
	[PK_Codigo] [nvarchar](50) NOT NULL,
	[PK_Codigo_Multiservicios] [int] NOT NULL,
	[Referencia] [nvarchar](200) NULL,
	[UsuarioCreacion] [nvarchar](200) NOT NULL,
	[UsuarioModificacion] [nvarchar](200) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[ProcedenciaCreacion] [nvarchar](50) NOT NULL,
	[ProcedenciaCierre] [nvarchar](50) NULL,
	[FK_MultiserviciosEstados_PK_Codigo] [int] NOT NULL,
	[FK_MultiserviciosEstados_PK_Codigo_Proximo] [int] NULL,
	[FK_Estaciones_PK_Codigo] [int] NULL,
	[FK_Contratistas_PK_Codigo] [int] NULL,
	[FK_CatalogoTiposEquipos_PK_Codigo] [int] NULL,
	[FechaCierre] [datetime] NULL,
	[FechaReferencia] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
	[FechaEnvioCierre] [datetime] NULL,
	[FechaCancelacion] [datetime] NULL,
	[FechaLimiteResolucion] [datetime] NULL,
	[Aux1] [nvarchar](200) NULL,
	[Aux2] [nvarchar](200) NULL,
	[Aux3] [nvarchar](200) NULL,
	[Aux4] [nvarchar](200) NULL,
	[MotivoCancelacion] [nvarchar](max) NULL,
	[ComentariosPrivados] [nvarchar](max) NULL,
	[FechaAvisoShell] [datetime] NULL,
	[FechaPrevistaInicio] [datetime] NULL,
	[FechaPrevistaFin] [datetime] NULL,
	[FK_TiposTrabajos_PK_Codigo] [int] NULL,
	[FK_TiposUrgencias_PK_Codigo] [int] NULL,
	[PresupuestoEstimado] [nvarchar](50) NULL,
	[PresupuestoReal] [nvarchar](50) NULL,
	[ImporteFactura] [nvarchar](50) NULL,
	[NumeroFactura] [nvarchar](50) NULL,
	[NumeroCuenta] [nvarchar](50) NULL,
	[ValorRealEstimado] [nvarchar](50) NULL,
	[Relacion] [nvarchar](200) NULL,
	[PtoStBy] [nvarchar](50) NULL,
	[ValorCalleRealEstimado] [nvarchar](50) NULL,
	[numeroReaperturas] [int] NULL,
	[Comentarios] [nvarchar](max) NULL,
	[NumeroFactura2] [nvarchar](50) NULL,
	[ImporteFactura2] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/* PASAR DATA A HIST */
USE AdvancedArtemisDB_HIST;
GO

INSERT INTO AdvancedArtemisDB_HIST.dbo.ContratistasControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.ContratistasControlCambios 

INSERT INTO AdvancedArtemisDB_HIST.dbo.ContratosADHOCControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.ContratosADHOCControlCambios 

INSERT INTO AdvancedArtemisDB_HIST.dbo.ContratosControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.ContratosControlCambios 

INSERT INTO AdvancedArtemisDB_HIST.dbo.EstacionesControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.EstacionesControlCambios 

INSERT INTO AdvancedArtemisDB_HIST.dbo.EstacionesModelosControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.EstacionesModelosControlCambios

INSERT INTO AdvancedArtemisDB_HIST.dbo.IncidenciasControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.IncidenciasControlCambios

INSERT INTO AdvancedArtemisDB_HIST.dbo.MultiserviciosControlCambios 
select * from AdvancedArtemisDB_FORM.dbo.MultiserviciosControlCambios

/* BORRAR DATOS */
DELETE FROM AdvancedArtemisDB_FORM.dbo.ContratistasControlCambios 
DELETE FROM AdvancedArtemisDB_FORM.dbo.ContratosADHOCControlCambios 
DELETE FROM AdvancedArtemisDB_FORM.dbo.ContratosControlCambios 
DELETE FROM AdvancedArtemisDB_FORM.dbo.EstacionesControlCambios
DELETE FROM AdvancedArtemisDB_FORM.dbo.EstacionesModelosControlCambios
DELETE FROM AdvancedArtemisDB_FORM.dbo.IncidenciasControlCambios
DELETE FROM AdvancedArtemisDB_FORM.dbo.MultiserviciosControlCambios

DELETE FROM AdvancedArtemisDB_HIST.dbo.ContratistasControlCambios 
DELETE FROM AdvancedArtemisDB_HIST.dbo.ContratosADHOCControlCambios 
DELETE FROM AdvancedArtemisDB_HIST.dbo.ContratosControlCambios 
DELETE FROM AdvancedArtemisDB_HIST.dbo.EstacionesControlCambios
DELETE FROM AdvancedArtemisDB_HIST.dbo.EstacionesModelosControlCambios
DELETE FROM AdvancedArtemisDB_HIST.dbo.IncidenciasControlCambios
DELETE FROM AdvancedArtemisDB_HIST.dbo.MultiserviciosControlCambios

/* Modificar los triggers */

USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  Trigger [dbo].[TR_Contratistas]    Script Date: 14/11/2016 14:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger

ALTER TRIGGER [dbo].[TR_Contratistas]

ON [dbo].[Contratistas]

AFTER INSERT,UPDATE

AS

BEGIN

    SET NOCOUNT ON;

	INSERT INTO AdvancedArtemisDB_HIST.dbo.ContratistasControlCambios (
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





/****** Object:  Trigger [dbo].[updateNumeroEquipamientos]    Script Date: 14/11/2016 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[updateNumeroEquipamientos]
   ON  [dbo].[ContratosADHOC]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	update ContratosADHOC set NumeroEquipamientos = ( 
	select count(*) from ContratosADHOCEstacionesModelos where FK_ContratosADHOC_PK_Codigo= (select I.pk_codigo from inserted as I)
	) where ContratosADHOC.pk_codigo = (select I.pk_codigo from inserted as I)

	--print 'Numero total de equipamientos actualizado '

	INSERT INTO AdvancedArtemisDB_HIST.[dbo].[ContratosADHOCControlCambios]
           ([PK_Codigo]
           ,[PK_Codigo_ContratosADHOC]
           ,[FK_Contratos_PK_Codigo]
           ,[Nombre]
           ,[Descripcion]
           ,[FuncionesSeleccionadas]
           ,[TiposEquiposSeleccionados]
           ,[ModelosSeleccionados]
           ,[GruposEstacionesSeleccionados]
           ,[EstacionesGrupoEstacionesSeleccionadas]
           ,[EstacionesIndividualesSeleccionadas]
           ,[ProvinciasSeleccionadas]
           ,[EstacionesProvinciasSeleccionadas]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[FK_ContratosADHOCEstados_PK_Codigo]
           ,[EstacionesModelosEstadosSeleccionados]
           ,[TodoCatalogo]
           ,[TodasEstaciones]
           ,[CodigoContratoADHOC]
           ,[FK_HorariosApertura_PK_Codigo]
           ,[ContratoADHOCPadrePkCodigo]
           ,[IncidenciasPermitidasMovilidad]
           ,[NoUsarHorarios]
           ,[ComentariosPrivados]
           ,[NumeroEquipamientos])
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
           ,[PK_Codigo]
           ,[FK_Contratos_PK_Codigo]
           ,[Nombre]
           ,[Descripcion]
           ,[FuncionesSeleccionadas]
           ,[TiposEquiposSeleccionados]
           ,[ModelosSeleccionados]
           ,[GruposEstacionesSeleccionados]
           ,[EstacionesGrupoEstacionesSeleccionadas]
           ,[EstacionesIndividualesSeleccionadas]
           ,[ProvinciasSeleccionadas]
           ,[EstacionesProvinciasSeleccionadas]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[FK_ContratosADHOCEstados_PK_Codigo]
           ,[EstacionesModelosEstadosSeleccionados]
           ,[TodoCatalogo]
           ,[TodasEstaciones]
           ,[CodigoContratoADHOC]
           ,[FK_HorariosApertura_PK_Codigo]
           ,[ContratoADHOCPadrePkCodigo]
           ,[IncidenciasPermitidasMovilidad]
           ,[NoUsarHorarios]
           ,[ComentariosPrivados]
           ,[NumeroEquipamientos]
	from inserted

END

/****** Object:  Trigger [dbo].[TR_Contratos]    Script Date: 14/11/2016 16:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger

ALTER TRIGGER [dbo].[TR_Contratos]

ON [dbo].[Contratos]

AFTER INSERT,UPDATE

AS

BEGIN

    SET NOCOUNT ON;

	INSERT INTO AdvancedArtemisDB_HIST.dbo.ContratosControlCambios 
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

USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  Trigger [dbo].[TR_Estaciones]    Script Date: 14/11/2016 16:43:00 ******/
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

	INSERT INTO AdvancedArtemisDB_HIST.dbo.EstacionesControlCambios(
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


/****** Object:  Trigger [dbo].[TR_Multiservicios]    Script Date: 14/11/2016 14:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[TR_Multiservicios]
ON [dbo].[Multiservicios]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
   INSERT INTO AdvancedArtemisDB_HIST.[dbo].[MultiserviciosControlCambios]
           ([PK_Codigo]
           ,[PK_Codigo_Multiservicios]
           ,[Referencia]
           ,[UsuarioCreacion]
           ,[UsuarioModificacion]
           ,[FechaCreacion]
           ,[FechaModificacion]
           ,[ProcedenciaCreacion]
           ,[ProcedenciaCierre]
           ,[FK_MultiserviciosEstados_PK_Codigo]
           ,[FK_MultiserviciosEstados_PK_Codigo_Proximo]
           ,[FK_Estaciones_PK_Codigo]
           ,[FK_Contratistas_PK_Codigo]
           ,[FK_CatalogoTiposEquipos_PK_Codigo]
           ,[FechaCierre]
           ,[FechaReferencia]
           ,[FechaEnvio]
           ,[FechaEnvioCierre]
           ,[FechaCancelacion]
           ,[FechaLimiteResolucion]
           ,[Aux1]
           ,[Aux2]
           ,[Aux3]
           ,[Aux4]
           ,[MotivoCancelacion]
           ,[ComentariosPrivados]
           ,[FechaAvisoShell]
           ,[FechaPrevistaInicio]
           ,[FechaPrevistaFin]
           ,[FK_TiposTrabajos_PK_Codigo]
           ,[FK_TiposUrgencias_PK_Codigo]
           ,[PresupuestoEstimado]
           ,[PresupuestoReal]
           ,[ImporteFactura]
           ,[NumeroFactura]
           ,[NumeroCuenta]
           ,[ValorRealEstimado]
           ,[Relacion]
           ,[PtoStBy]
           ,[ValorCalleRealEstimado]
           ,[numeroReaperturas]
           ,[Comentarios]
		   ,[NumeroFactura2]
		   ,[ImporteFactura2])
     SELECT datediff(ms,convert(char,getdate(),112),getdate()),
	   [pK_Codigo]
      ,[Referencia]
      ,[UsuarioCreacion]
      ,[UsuarioModificacion]
      ,[FechaCreacion]
      ,[FechaModificacion]
      ,[ProcedenciaCreacion]
      ,[ProcedenciaCierre]
      ,[FK_MultiserviciosEstados_PK_Codigo]
      ,[FK_MultiserviciosEstados_PK_Codigo_Proximo]
      ,[FK_Estaciones_PK_Codigo]
      ,[FK_Contratistas_PK_Codigo]
      ,[FK_CatalogoTiposEquipos_PK_Codigo]
      ,[FechaCierre]
      ,[FechaReferencia]
      ,[FechaEnvio]
      ,[FechaEnvioCierre]
      ,[FechaCancelacion]
      ,[FechaLimiteResolucion]
      ,[Aux1]
      ,[Aux2]
      ,[Aux3]
      ,[Aux4]
      ,[MotivoCancelacion]
      ,[ComentariosPrivados]
      ,[FechaAvisoShell]
      ,[FechaPrevistaInicio]
      ,[FechaPrevistaFin]
      ,[FK_TiposTrabajos_PK_Codigo]
      ,[FK_TiposUrgencias_PK_Codigo]
      ,[PresupuestoEstimado]
      ,[PresupuestoReal]
      ,[ImporteFactura]
      ,[NumeroFactura]
      ,[NumeroCuenta]
      ,[ValorRealEstimado]
      ,[Relacion]
      ,[PtoStBy]
      ,[ValorCalleRealEstimado]
      ,[numeroReaperturas]
      ,[Comentarios]
	  ,[NumeroFactura2]
	  ,[ImporteFactura2]
  FROM inserted
END


/****** Object:  Trigger [dbo].[TR_Incidencias]    Script Date: 14/11/2016 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TR_Incidencias]

ON [dbo].[Incidencias]
AFTER INSERT,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	INSERT INTO AdvancedArtemisDB_HIST.dbo.IncidenciasControlCambios(
           pk_codigo
		   ,pk_codigo_incidencias
		   ,[Referencia]
           ,[UsuarioCreacion]
           ,[UsuarioModificacion]
           ,[FechaCreacion]
           ,[FechaModificacion]
           ,[ProcedenciaCreacion]
           ,[FK_IncidenciasEstados_PK_Codigo]
           ,[FK_EstacionesModelos_PK_Codigo_Origen]
           ,[FK_ContratosADHOC_PK_Codigo_Origen]
           ,[FK_CatalogoErrores_PK_Codigo_Origen]
           ,[Comentarios]
           ,[DescripcionAdicionalError]
           ,[FK_EstacionesModelos_PK_Codigo_Solucion]
           ,[FK_ContratosADHOC_PK_Codigo_Solucion]
           ,[FK_CatalogoErrores_PK_Codigo_Solucion]
           ,[FechaCierre]
           ,[FechaReferencia]
           ,[FechaEnvio]
           ,[FechaLimiteResolucion]
           ,[FK_Estaciones_PK_Codigo_Origen]
           ,[FK_Estaciones_PK_Codigo_Solucion]
           ,[FK_Contratistas_PK_Codigo_Origen]
           ,[FK_Contratistas_PK_Codigo_Solucion]
           ,[IncidenciaEnviada]
           ,[IncidenciaCierreEnviado]
           ,[FechaEnvioCierre]
           ,[FK_CausasFallos_PK_Codigo_Solucion]
           ,[ProcedenciaCierre]
           ,[CodigoErrorIVR]
           ,[FechaCancelacion]
           ,[MotivoCancelacion]
           ,[FechaRevisita]
           ,[MotivoRevisita]
           ,[IVRCreacionTelefono]
           ,[IVRCierreTelefono]
           ,[ForzarIncidenciaEnvio]
           ,[ForzarIncidenciaEnvioCierre]
           ,[FechaLimiteResolucionOriginal]
           ,[IntegracionCodigoCierre]
           ,[IntegracionCodigoApertura]
           ,[FechaIntegracionCierre]
           ,[ConformeEstacionCierre]
           ,[Aux1]
           ,[Aux2]
           ,[DescripcionAdicionalCierreEstacion]
           ,[FechaIntegracionApertura]
           ,[noComprobarIncidenciasPermitidasIVROrigen]
           ,[noComprobarIncidenciasPermitidasWebOrigen]
           ,[noComprobarIncidenciasPermitidasMovilidadOrigen]
           ,[noComprobarIncidenciasPermitidasIVRSolucion]
           ,[noComprobarIncidenciasPermitidasWebSolucion]
           ,[noComprobarIncidenciasPermitidasMovilidadSolucion]
           ,[noComprobarHorariosActivosOrigen]
           ,[noComprobarHorariosActivosSolucion]
           ,[IdentificacionConformeEstacionCierre]
           ,[FK_IncidenciasEstados_PK_Codigo_Proximo]
           ,[comentariosPrivados]
           ,[provieneIVR]
           ,[cierreIVR],[numeroReaperturas],aux3,aux4,UsuarioReapertura,FechaReapertura)
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
           ,pk_codigo
		   ,[Referencia]
           ,[UsuarioCreacion]
           ,[UsuarioModificacion]
           ,[FechaCreacion]
           ,[FechaModificacion]
           ,[ProcedenciaCreacion]
           ,[FK_IncidenciasEstados_PK_Codigo]
           ,[FK_EstacionesModelos_PK_Codigo_Origen]
           ,[FK_ContratosADHOC_PK_Codigo_Origen]
           ,[FK_CatalogoErrores_PK_Codigo_Origen]
           ,[Comentarios]
           ,[DescripcionAdicionalError]
           ,[FK_EstacionesModelos_PK_Codigo_Solucion]
           ,[FK_ContratosADHOC_PK_Codigo_Solucion]
           ,[FK_CatalogoErrores_PK_Codigo_Solucion]
           ,[FechaCierre]
           ,[FechaReferencia]
           ,[FechaEnvio]
           ,[FechaLimiteResolucion]
           ,[FK_Estaciones_PK_Codigo_Origen]
           ,[FK_Estaciones_PK_Codigo_Solucion]
           ,[FK_Contratistas_PK_Codigo_Origen]
           ,[FK_Contratistas_PK_Codigo_Solucion]
           ,[IncidenciaEnviada]
           ,[IncidenciaCierreEnviado]
           ,[FechaEnvioCierre]
           ,[FK_CausasFallos_PK_Codigo_Solucion]
           ,[ProcedenciaCierre]
           ,[CodigoErrorIVR]
           ,[FechaCancelacion]
           ,[MotivoCancelacion]
           ,[FechaRevisita]
           ,[MotivoRevisita]
           ,[IVRCreacionTelefono]
           ,[IVRCierreTelefono]
           ,[ForzarIncidenciaEnvio]
           ,[ForzarIncidenciaEnvioCierre]
           ,[FechaLimiteResolucionOriginal]
           ,[IntegracionCodigoCierre]
           ,[IntegracionCodigoApertura]
           ,[FechaIntegracionCierre]
           ,[ConformeEstacionCierre]
           ,[Aux1]
           ,[Aux2]
           ,[DescripcionAdicionalCierreEstacion]
           ,[FechaIntegracionApertura]
           ,[noComprobarIncidenciasPermitidasIVROrigen]
           ,[noComprobarIncidenciasPermitidasWebOrigen]
           ,[noComprobarIncidenciasPermitidasMovilidadOrigen]
           ,[noComprobarIncidenciasPermitidasIVRSolucion]
           ,[noComprobarIncidenciasPermitidasWebSolucion]
           ,[noComprobarIncidenciasPermitidasMovilidadSolucion]
           ,[noComprobarHorariosActivosOrigen]
           ,[noComprobarHorariosActivosSolucion]
           ,[IdentificacionConformeEstacionCierre]
           ,[FK_IncidenciasEstados_PK_Codigo_Proximo]
           ,[comentariosPrivados]
           ,[provieneIVR]
           ,[cierreIVR] 
			,numeroReaperturas
			,aux3
			,aux4,UsuarioReapertura,FechaReapertura
	from inserted

END

/****** Object:  Trigger [dbo].[TR_EstacionesModelos]    Script Date: 14/11/2016 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TR_EstacionesModelos]

ON [dbo].[EstacionesModelos]

AFTER INSERT,UPDATE
AS
BEGIN

    SET NOCOUNT ON;
	INSERT INTO AdvancedArtemisDB_HIST.dbo.[EstacionesModelosControlCambios]
           ([PK_Codigo]
           ,[PK_Codigo_EstacionesModelos]
           ,[FK_Estaciones_PK_Codigo]
           ,[FK_CatalogoModelos_PK_Codigo]
           ,[NumeroOrden]
           ,[Descripcion]
           ,[NumeroSerie]
           ,[FechaInstalacion]
           ,[Denominacion]
           ,[CodigoSAP]
           ,[LimiteGarantia]
           ,[FK_EstacionesModelosEstados_PK_Codigo]
           ,[CodigoEstacionModelo]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[Comentarios]
           ,[FK_TiposMantenimientos_PK_Codigo]
           ,[IncidenciasPermitidasMovilidad]
           ,[ComentariosPrivados]
           ,[provieneCarga],[UsuarioModificacion],[FechaModificacion],[UsuarioBaja],[FechaBaja])
	SELECT datediff(ms,convert(char,getdate(),112),getdate())
           ,[PK_Codigo]
           ,[FK_Estaciones_PK_Codigo]
           ,[FK_CatalogoModelos_PK_Codigo]
           ,[NumeroOrden]
           ,[Descripcion]
           ,[NumeroSerie]
           ,[FechaInstalacion]
           ,[Denominacion]
           ,[CodigoSAP]
           ,[LimiteGarantia]
           ,[FK_EstacionesModelosEstados_PK_Codigo]
           ,[CodigoEstacionModelo]
           ,[IncidenciasPermitidoIVR]
           ,[IncidenciasPermitidoManual]
           ,[Comentarios]
           ,[FK_TiposMantenimientos_PK_Codigo]
           ,[IncidenciasPermitidasMovilidad]
           ,[ComentariosPrivados]
           ,[provieneCarga],[UsuarioModificacion],[FechaModificacion],[UsuarioBaja],[FechaBaja]
  	from inserted

END

/* admin - modificar controldecambios estaciones para tipo y código */

select distinct estacionescontrolcambios.usuariomodificacion as usuario, 
        estacionescontrolcambios.fechamodificacion as fecha, 
        tiposestaciones.nombre as valor 
from estacionescontrolcambios  
inner join tiposestaciones on estacionescontrolcambios.fk_tiposestaciones_pk_codigo=tiposestaciones.pk_codigo 
where estacionescontrolcambios.pk_codigo_estaciones=? 
order by estacionescontrolcambios.fechamodificacion asc 


select distinct estacionescontrolcambios.usuariomodificacion as usuario, 
        estacionescontrolcambios.fechamodificacion as fecha, 
        estacionescontrolcambios.codigoestacion as valor 
from estacionescontrolcambios  
where estacionescontrolcambios.pk_codigo_estaciones=? 
order by estacionescontrolcambios.fechamodificacion asc 
