/* Script pruebas */

--comprobadores
select * from contratosADHOC where pk_codigo = 275 --55
select * from ContratosADHOCEstacionesModelos where FK_ContratosADHOC_PK_Codigo=275
select * from contratosADHOCControlCambios

--Consulta: ContratosADHOC que han cambiado el número total de equipamientos, respecto al control de cambios
select contratosADHOC.*
from contratosADHOC 
where numeroEquipamientos <> (
select top 1 numeroEquipamientos from contratosADHOCControlCambios 
where contratosADHOC.pk_Codigo = contratosADHOCControlCambios.PK_Codigo_ContratosADHOC 
and datediff([minute],contratosADHOCControlCambios.fechaMovimiento, getdate()) <180
order by pk_codigo desc
)

--Sentencias de pruebas
delete from ContratosADHOCEstacionesModelos where FK_ContratosADHOC_PK_Codigo=275 and FK_EstacionesModelos_PK_Codigo=27141
update contratosADHOC set nombre = 'PLES_ADHOC' where pk_codigo = 275

insert into ContratosADHOCEstacionesModelos (FK_ContratosADHOC_PK_Codigo,FK_EstacionesModelos_PK_Codigo) values (275,27141)
update contratosADHOC set nombre = 'PLES_ADHOC' where pk_codigo = 275

delete from ContratosADHOCEstacionesModelos where FK_ContratosADHOC_PK_Codigo=275 and FK_EstacionesModelos_PK_Codigo in(27526,27527,27528,27529)
update contratosADHOC set nombre = 'PLES_ADHOC' where pk_codigo = 275

-- Inicializador del campo numeroEquipamientos
update ContratosADHOC set NumeroEquipamientos = isnull( 
	(select count(*) from ContratosADHOCEstacionesModelos where FK_ContratosADHOC_PK_Codigo=ContratosADHOC.pk_codigo)
,0) 

/* Tabla espejo contratosADHOC */

USE [AdvancedArtemisDB_FORM]
GO

/****** Object:  Table [dbo].[ContratosADHOCControlCambios]    Script Date: 12/04/2016 17:28:00 ******/
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
	[ComentariosPrivados] [nvarchar](max) NULL,
	[NumeroEquipamientos] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[ContratosADHOCControlCambios] ADD  CONSTRAINT [DF_ContratosADHOCControlCambios_FechaMovimiento]  DEFAULT (getdate()) FOR [FechaMovimiento]
GO

/* Trigger en ContratosADHOC */

USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  Trigger [dbo].[updateNumeroEquipamientos]    Script Date: 12/04/2016 15:54:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[updateNumeroEquipamientos]
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

	INSERT INTO [dbo].[ContratosADHOCControlCambios]
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
