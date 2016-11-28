46ES0TES
46ES048B
B98605876


--origen de transacciones
select *
 from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'


-- 1. Tenemos que enviar estas mismas, con identificador distinto (R1-IDMOVCONT) e importe negativo. CIM VIEJO 08ES0ITZ
-- (261 registros)
insert into [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R1-'+idmovcont, cim, fecha, hora, CodProd, -1 * cast(lit as decimal(6,2)) , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'


-- 2. 2. Tenemos que enviar estas mismas con identificador distinto (R2-IDMOVCONT) e importe igual (en positivo). CIM NUEVO 08ES140Y
insert into [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R2-'+idmovcont, '08ES140Y', fecha, hora, CodProd, lit , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'

-- pasar las transacciones de la tabla temporal a SuministrosNoEnviados
insert into [dbo].[SuministrosNoEnviados] ([FK_RegistroComunicaciones_Id],[IdMovCont],[CIM],[C_VENTA],[Fecha],[Hora],[CodProd],[Lit],[NIF],[Matricula])
select [FK_RegistroComunicaciones_Id], [IdMovCont], [CIM], [C_VENTA], [Fecha],[Hora],[CodProd], [Lit],[NIF],[Matricula]
from [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo]

--origen de transacciones
select *
 from suministrosenviados
where nif = 'B98605876' 
and fecha >= '20150101'
and c_venta = 2254
-- 1. Tenemos que enviar estas mismas, con identificador distinto (R1-IDMOVCONT) e importe negativo. 
-- (195 registros)
insert into [dbo].[ZZZ_Arreglo_B98605876_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R3-'+idmovcont, cim, fecha, hora, CodProd, -1 * cast(lit as decimal(6,2)) , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B98605876' and fecha >= '20160101' and c_venta = 2254 and cim='46ES048B'
-- 2. 2. Tenemos que enviar estas mismas con identificador distinto (R2-IDMOVCONT) e importe igual (en positivo). CIM NUEVO 46ES0TES
insert into [dbo].[ZZZ_Arreglo_B98605876_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R2-'+idmovcont, '46ES0TES', fecha, hora, CodProd, lit , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B98605876' and fecha >= '20160101' and c_venta = 2254


-- pasar las transacciones de la tabla temporal a SuministrosNoEnviados
insert into [dbo].[SuministrosNoEnviados] ([FK_RegistroComunicaciones_Id],[IdMovCont],[CIM],[C_VENTA],[Fecha],[Hora],[CodProd],[Lit],[NIF],[Matricula])
select [FK_RegistroComunicaciones_Id], [IdMovCont], [CIM], [C_VENTA], [Fecha],[Hora],[CodProd], [Lit],[NIF],[Matricula]
from [dbo].[ZZZ_Arreglo_B98605876_CIMErroneo]


/* Para sucesivos envíos */
/* Crear tabla con el nuevo arreglo */
USE [Suministros]
GO

/****** Object:  Table [dbo].[ZZZ_Arreglo_B98605876_20161110]    Script Date: 10/11/2016 12:52:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ZZZ_Arreglo_B98605876_20161110](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_RegistroComunicaciones_Id] [int] NOT NULL,
	[IdMovCont] [char](21) NULL,
	[CIM] [char](8) NULL,
	[Fecha] [char](8) NULL,
	[Hora] [char](4) NULL,
	[CodProd] [char](3) NULL,
	[Lit] [char](10) NULL,
	[NIF] [char](16) NULL,
	[Matricula] [char](20) NULL,
	[CodigoError] [char](4) NULL,
	[DescripcionError] [char](500) NULL,
	[C_VENTA] [char](4) NULL,
 CONSTRAINT [PK_ZZZ_Arreglo_B98605876_20161110] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/* Insertar en la tabla nueva, los suministros a enviar */

USE [Suministros]
GO

INSERT INTO [dbo].[ZZZ_Arreglo_B98605876_20161110]
           ([FK_RegistroComunicaciones_Id]
           ,[IdMovCont]
           ,[CIM]
           ,[Fecha]
           ,[Hora]
           ,[CodProd]
           ,[Lit]
           ,[NIF]
           ,[Matricula]
           ,[CodigoError]
           ,[DescripcionError]
           ,[C_VENTA])
select 
           FK_RegistroComunicaciones_Id
           ,replace(IdMovCont,'R6','R7') as idmovcont
           ,CIM
           ,Fecha
           ,Hora
           ,CodProd
           ,Lit
           ,NIF
           ,Matricula
           ,CodigoError
           ,DescripcionError
           ,C_VENTA
from [dbo].[ZZZ_Arreglo_B98605876_CIMErroneo]
where left(idmovcont,2)= 'R6'
GO

-- pasar las transacciones de la tabla temporal a SuministrosNoEnviados
insert into [dbo].[SuministrosNoEnviados] ([FK_RegistroComunicaciones_Id],[IdMovCont],[CIM],[C_VENTA],[Fecha],[Hora],[CodProd],[Lit],[NIF],[Matricula])
select [FK_RegistroComunicaciones_Id], [IdMovCont], [CIM], [C_VENTA], [Fecha],[Hora],[CodProd], [Lit],[NIF],[Matricula]
from [dbo].[ZZZ_Arreglo_B98605876_20161110]
