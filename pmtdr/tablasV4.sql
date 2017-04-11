USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_EstacionesDatosCargados]    Script Date: 05/04/2017 12:36:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_EstacionesDatosCargados](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_estaciones_pkCodigo] [bigint] NOT NULL,
	[fk_v4_indicadores_pkCodigo] [bigint] NOT NULL,
	[mes] [int] NULL,
	[periodo] [nvarchar](2) NOT NULL,
	[anyo] [int] NOT NULL,
	[valorActual] [float] NULL,
	[valorObjetivo] [float] NULL,
 CONSTRAINT [PK_V4_EstacionesDatosCargados] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_EstacionesDatosGenerados]    Script Date: 05/04/2017 12:36:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_EstacionesDatosGenerados](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_estaciones_pkCodigo] [bigint] NOT NULL,
	[mes] [int] NULL,
	[periodo] [nvarchar](2) NOT NULL,
	[anyo] [int] NOT NULL,
	[tipoPeriodo] [nvarchar](50) NOT NULL,
	[resultadoPonderado] [float] NULL,
	[sumaPesos] [float] NULL,
 CONSTRAINT [PK_V4_EstacionesDatosGenerados] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_EstacionesDatosGeneradosDetalle]    Script Date: 05/04/2017 12:37:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_EstacionesDatosGeneradosDetalle](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_v4_estaciones_datos_generados_pkCodigo] [bigint] NOT NULL,
	[fk_v4_indicadores_pkCodigo] [bigint] NULL,
	[valorActual] [float] NULL,
	[valorObjetivo] [float] NULL,
	[resultadoNavegador] [float] NULL,
	[peso] [float] NULL,
	[resultadoPonderado] [float] NULL,
 CONSTRAINT [PK_V4_EstacionesDatosGeneradosDetalle] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_Indicadores]    Script Date: 05/04/2017 12:37:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_Indicadores](
	[pkCodigo] [bigint] NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[descripcion] [nvarchar](250) NULL,
	[letra] [nvarchar](50) NOT NULL,
	[peso] [int] NOT NULL,
	[anyoInicio] [int] NOT NULL,
	[anyoFin] [int] NOT NULL,
	[visible] [bit] NOT NULL,
	[ext1] [nvarchar](50) NULL,
	[ext2] [nvarchar](50) NULL,
	[ext3] [nvarchar](50) NULL,
 CONSTRAINT [PK_V4_Indicadores] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[V4_Indicadores] ADD  CONSTRAINT [DF_V4_Indicadores_visible]  DEFAULT ((1)) FOR [visible]
GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_IndicadoresEstaciones]    Script Date: 05/04/2017 12:37:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_IndicadoresEstaciones](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_estaciones_pkCodigo] [bigint] NOT NULL,
	[fk_v4_indicadores_pkCodigo] [bigint] NOT NULL,
	[activadoShell] [bit] NULL,
	[activadoCAP] [bit] NULL,
	[anyo] [int] NOT NULL,
	[periodo] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_V4_IndicadoresEstaciones] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[V4_IndicadoresEstaciones] ADD  CONSTRAINT [DF_V4_IndicadoresEstaciones_activadoShell]  DEFAULT ((0)) FOR [activadoShell]
GO

ALTER TABLE [dbo].[V4_IndicadoresEstaciones] ADD  CONSTRAINT [DF_V4_IndicadoresEstaciones_activadoCAP]  DEFAULT ((0)) FOR [activadoCAP]
GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_UsuariosDatosGenerados]    Script Date: 05/04/2017 12:37:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_UsuariosDatosGenerados](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_usuarios_pkCodigo] [bigint] NULL,
	[mes] [int] NULL,
	[periodo] [nvarchar](2) NULL,
	[anyo] [int] NULL,
	[tipoPeriodo] [nvarchar](50) NULL,
	[resultadoPonderado] [float] NULL,
	[sumaPesos] [float] NULL,
 CONSTRAINT [PK_V4_UsuariosDatosGenerados] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_UsuariosDatosGeneradosDetalle]    Script Date: 05/04/2017 12:37:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_UsuariosDatosGeneradosDetalle](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_v4_usuarios_datos_generados_pkCodigo] [bigint] NULL,
	[fk_v4_indicadores_pkCodigo] [bigint] NULL,
	[valorActual] [float] NULL,
	[valorObjetivo] [float] NULL,
	[resultadoNavegador] [float] NULL,
	[peso] [float] NULL,
	[resultadoPonderado] [float] NULL,
 CONSTRAINT [PK_V4_UsuariosDatosGeneradosDetalle] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [PMTDR_V_4]
GO

/****** Object:  Table [dbo].[V4_UsuariosObjetivosParticulares]    Script Date: 05/04/2017 12:38:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[V4_UsuariosObjetivosParticulares](
	[pkCodigo] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_usuarios_pkCodigo] [bigint] NOT NULL,
	[fk_v4_indicadores_pkCodigo] [bigint] NOT NULL,
	[objetivoParticular] [float] NOT NULL,
 CONSTRAINT [PK_V4_UsuariosObjetivosParticulares] PRIMARY KEY CLUSTERED 
(
	[pkCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

