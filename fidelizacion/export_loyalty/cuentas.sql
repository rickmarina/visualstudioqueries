
USE [CF_DISA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_LOY_Cuentas]
AS

select * from tcf42 where tipo_cuenta='FI'

GO