USE [PMTDR_V_2]
GO

--Falta el concatenado en todas las consultas

--AFR1 S2 Fidelización - falta mapping código de estación euroshell
delete from [dbo].[AFR_1_S2_Descuentos_FI_Oferta_Clubdia_Mapfre]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select nombre_descuento, fecha, hora, minuto, segundo, importe, cantidad, '0000','CONCATENADO' from  [dbo].[AFR_1_S2_Descuentos_FI_Oferta_Clubdia_Mapfre]

--AFR2 S2 Fidelización - falta mapping código de estación euroshell
delete from [dbo].[AFR_2_S2_Descuentos_Makro_TDC_CBS_Cheques]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select nombre_descuento, fecha, hora, minuto, segundo, importe, cantidad, '0000','CONCATENADO' from [dbo].[AFR_2_S2_Descuentos_Makro_TDC_CBS_Cheques]

delete from [dbo].[AFR_3_QLIKVIEW_Descuentos_CLUBDIA_MAPFRE]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select origen_transaccion, fecha, hora, minuto, segundo, importe, cantidad, cod_euroshell,'CONCATENADO' from [dbo].[AFR_3_QLIKVIEW_Descuentos_CLUBDIA_MAPFRE]

--AFR4 SAP - falta mapping código de estación euroshell se está grabando el código de comercio
delete from [dbo].[AFR_4_SAP_Descuentos_ING]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta ING', fecha, hora, minuto, segundo, importe, 0, codigo_comercio,'CONCATENADO' from [dbo].[AFR_4_SAP_Descuentos_ING]

delete from [dbo].[AFR_5_CF_Descuentos_Euroshell]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta erS', fecha, hora, minuto, segundo, importe_total, unidades, cod_euroshell,'CONCATENADO' from [dbo].[AFR_5_CF_Descuentos_Euroshell]

delete from [dbo].[AFR_6_INGENICO_Descuentos_MiEstacionShell]
INSERT INTO [dbo].[AFR_Resultados] ([nombreDescuento],[fecha],[hora],[minuto],[segundo],[importeTrx],[litros],[cod_eshell_estacion],[concatenado])
select 'Tarjeta erS', fecha, hora, minuto, segundo, mov_importe, litros, cod_euroshell,'CONCATENADO' from [dbo].[AFR_6_INGENICO_Descuentos_MiEstacionShell]