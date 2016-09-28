USE [PMTDR_V_2]
GO
/****** Object:  StoredProcedure [dbo].[SP_AFR]    Script Date: 18/08/2016 13:57:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_AFR] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Falta el concatenado en consultas de S2

	--CONCATENADO : codigo_euroshell+fecha(yyyymmdd)+hora+minuto+importe(2 decimales)
	--select cod_euroshell+convert(char(8),fecha,112)+right('00'+cast(hora as char),2)+right('00'+cast(minuto as char),2)+round(importe,2)
	--select round(15.663,2)

--AFR1 S2 Fidelización - falta mapping código de estación euroshell
--delete from [dbo].[AFR_1_S2_Descuentos_FI_Oferta_Clubdia_Mapfre]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select nombre_descuento, fecha, hora, minuto, segundo, importe, cantidad, '0000','CONCATENADO' from  [dbo].[AFR_1_S2_Descuentos_FI_Oferta_Clubdia_Mapfre]

--AFR2 S2 Fidelización - falta mapping código de estación euroshell
--delete from [dbo].[AFR_2_S2_Descuentos_Makro_TDC_CBS_Cheques]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select nombre_descuento, fecha, hora, minuto, segundo, importe, cantidad, '0000','CONCATENADO' from [dbo].[AFR_2_S2_Descuentos_Makro_TDC_CBS_Cheques]

--AFR3
--delete from [dbo].[AFR_3_QLIKVIEW_Descuentos_CLUBDIA_MAPFRE]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select origen_transaccion, fecha, hora, minuto, segundo, importe, cantidad, cod_euroshell,
cod_euroshell+convert(char(8),fecha,112)+right('00'+cast(hora as char),2)+right('00'+cast(minuto as char),2)+round(importe,2)
from [dbo].[AFR_3_QLIKVIEW_Descuentos_CLUBDIA_MAPFRE]

--AFR4 SAP - falta mapping código de estación euroshell se está grabando el código de comercio
--delete from [dbo].[AFR_4_SAP_Descuentos_ING]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta ING', fecha, hora, minuto, segundo, importe, 0, cod_euroshell,
cod_euroshell+convert(char(8),fecha,112)+right('00'+cast(hora as char),2)+right('00'+cast(minuto as char),2)+round(importe,2)
from [dbo].[AFR_4_SAP_Descuentos_ING]

--AFR5
--delete from [dbo].[AFR_5_CF_Descuentos_Euroshell]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta erS', fecha, hora, minuto, segundo, importe_total, unidades, cod_euroshell,
cod_euroshell+convert(char(8),fecha,112)+right('00'+cast(hora as char),2)+right('00'+cast(minuto as char),2)+round(importe_total,2) 
from [dbo].[AFR_5_CF_Descuentos_Euroshell]

--AFR6
--delete from [dbo].[AFR_6_INGENICO_Descuentos_MiEstacionShell]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta erS', fecha, hora, minuto, segundo, mov_importe, litros, cod_euroshell,
cod_euroshell+convert(char(8),fecha,112)+right('00'+cast(hora as char),2)+right('00'+cast(minuto as char),2)+round(mov_importe,2)
from [dbo].[AFR_6_INGENICO_Descuentos_MiEstacionShell]

END

GO

#region "pruebas"
#endregion

/* DATOS DE PRUEBAS */
INSERT INTO [dbo].[AFR_1_S2_Descuentos_FI_Oferta_Clubdia_Mapfre]
           ([albaran]
           ,[tickettpv]
           ,[producto]
           ,[fecha]
           ,[hora]
           ,[minuto]
           ,[segundo]
           ,[cod_almacen]
           ,[importe]
           ,[cantidad]
           ,[precio]
           ,[importe_bruto]
           ,[forma_pago]
           ,[descuento]
           ,[nombre_descuento]
           ,[precio_sin_descuento]
           ,[descuento_unitario])
     VALUES
           ('A4506/150000116238'
           ,'0767110021'
           ,'3 FuelSave Diesel'
           ,'04/05/2016'
           ,8
           ,37
           ,0
           ,4506
           ,29.7
           ,28.66795
           ,1.036
           ,30
           ,'313'
           ,0.3
           ,'MAPFRE TE CUIDAMOS'
           ,1.046
           ,0.01)
GO

USE [PMTDR_V_2]
GO

INSERT INTO [dbo].[AFR_2_S2_Descuentos_Makro_TDC_CBS_Cheques]
           (
           [fecha]
           ,[hora]
           ,[minuto]
           ,[segundo]
           ,[albaran]
           ,[ticket_tpv]
           ,[codigo_almacen]
           ,[num_linea]
           ,[cod_producto]
           ,[producto]
           ,[cantidad]
           ,[precio]
           ,[importe]
           ,[forma_pago]
           ,[descuento]
           ,[nombre_descuento]
           ,[nombre_estacion])
     VALUES
           (
           '04/05/2016'
           ,6
           ,36
           ,0
           ,'ALB1101/150000223031'
           ,'2667110044'
           ,'1101'
           ,'100'
           ,'3'
           ,'FuelSave Diesel'
           ,42.64881
           ,1.008
           ,42.00
           ,'309'
           ,5
           ,'CHEQUE GASOLINA'
           ,'NUESTRA SEÑORA DEL CARMEN')
GO

USE [PMTDR_V_2]
GO
INSERT INTO [dbo].[AFR_3_QLIKVIEW_Descuentos_CLUBDIA_MAPFRE]
           ([fecha]
           ,[hora]
           ,[minuto]
           ,[segundo]
           ,[nombre_estacion]
           ,[cod_euroshell]
           ,[codigo_sede]
           ,[comercio_ingenico]
           ,[cantidad]
           ,[descuento]
           ,[importe]
           ,[origen_transaccion]
           ,[clave_almacen]
           ,[id_transaccion]
           ,[plat])
     VALUES
           ('01/03/2016'
           ,0
           ,0
           ,0
           ,'A BAÑA'
           ,'1421'
           ,'90339'
           ,'1506200'
           ,29.73
           ,0.3
           ,29.7
           ,'Mapfre'
           ,'2335'
           ,'1302415516'
           ,'DODP')
GO
/* fin datos de pruebas */


/* resultado análisis */
select concatenado, count(*) as ntrax from (
select distinct concatenado, nombreDescuento 
from afr_resultados
where fecha between '01-01-2016' and '31-12-2016'
and tipoCarga not in (3)
) as sq1
group by concatenado
having count(*) > 1
