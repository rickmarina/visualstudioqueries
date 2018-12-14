--Seleccionar todas las tarjetas para analizar en este informe
--tarjetas que han operado en el periodo de promo 20160901 a 20170108 (preguntar periodo de análisis)
delete from ZZZ_tarjetasCBS_angry
insert into ZZZ_tarjetasCBS_angry
select distinct cl_tarjeta
from TodasTrxClubSmart_Micro 
where fecha between '20160901' and '20170108'

delete from ZZZ_tarjetasTCD_angry
insert into ZZZ_tarjetasTCD_angry
select distinct cl_tarjeta
from [dbo].[TodasTrxTuClubDISA_Micro]
where fecha between '20160901' and '20170108'
--252942


--periodos de análisis
'20160607' and '20180315'

'20171026' and '20180315' as YTD
'20170607' and '20171025' as PREVIO_YTD --140 days
'20161026' and '20170315' as LYTD
'20160607' and '20161025' as PREVIO_LYTD

select ZZZ_tarjetasCBS_angry.cl_tarjeta, 
SUM(CASE WHEN CL_REGCAL NOT IN (29, 3) THEN 1 ELSE 0 END) AS N_TRX, 
SUM(CASE WHEN CL_REGCAL NOT IN (29, 3) THEN UNIDADES END) AS VOLUMEN 
FROM TodasTrxClubSmart_Angry 
inner join ZZZ_tarjetasCBS_angry on ZZZ_tarjetasCBS_angry.cl_tarjeta = TodasTrxClubSmart_Angry.cl_tarjeta
group by ZZZ_tarjetasCBS_angry.cl_tarjeta

--Resultados para CBS Angry
select ZZZ_tarjetasCBS_angry.cl_tarjeta, 
sum(case when fecha between '20171026' and '20180315' then 1 end) as TRX_YTD,
cast(sum(case when fecha between '20171026' and '20180315' then unidades end) as money) as VOLUMEN_YTD,

isnull(sum(case when fecha between '20170607' and '20171025' then 1 end),0) as TRX_PREVIO_YTD,
cast(isnull(sum(case when fecha between '20170607' and '20171025' then unidades end),0) as money) as VOLUMEN_PREVIO_YTD,

isnull(sum(case when fecha between '20161026' and '20170315' then 1 end),0) as TRX_LYTD,
cast(isnull(sum(case when fecha between '20161026' and '20170315' then unidades end),0) as money) as VOLUMEN_LYTD,

isnull(sum(case when fecha between '20160607' and '20161025' then 1 end),0) as TRX_PREVIO_LYTD,
cast(isnull(sum(case when fecha between '20160607' and '20161025' then unidades end),0) as money) as VOLUMEN_PREVIO_LYTD
FROM TodasTrxClubSmart_Angry 
inner join ZZZ_tarjetasCBS_angry on ZZZ_tarjetasCBS_angry.cl_tarjeta = TodasTrxClubSmart_Angry.cl_tarjeta 
group by ZZZ_tarjetasCBS_angry.cl_tarjeta 
--311.180


--Resultados para TCD Angry

select ZZZ_tarjetasTCD_angry.cl_tarjeta, 
sum(case when fecha between '20171026' and '20180315' then 1 end) as TRX_YTD,
cast(sum(case when fecha between '20171026' and '20180315' then unidades end) as money) as VOLUMEN_YTD,

isnull(sum(case when fecha between '20170607' and '20171025' then 1 end),0) as TRX_PREVIO_YTD,
cast(isnull(sum(case when fecha between '20170607' and '20171025' then unidades end),0) as money) as VOLUMEN_PREVIO_YTD,

isnull(sum(case when fecha between '20161026' and '20170315' then 1 end),0) as TRX_LYTD,
cast(isnull(sum(case when fecha between '20161026' and '20170315' then unidades end),0) as money) as VOLUMEN_LYTD,

isnull(sum(case when fecha between '20160607' and '20161025' then 1 end),0) as TRX_PREVIO_LYTD,
cast(isnull(sum(case when fecha between '20160607' and '20161025' then unidades end),0) as money) as VOLUMEN_PREVIO_LYTD
FROM TodasTrxTCD_Angry 
inner join ZZZ_tarjetasTCD_angry on ZZZ_tarjetasTCD_angry.cl_tarjeta = TodasTrxTCD_Angry.cl_tarjeta 
group by ZZZ_tarjetasTCD_angry.cl_tarjeta 



-- Productos 
AND (TCF67.CL_ARTI IN ('121','122','126','127','130','133','421','422','426','427','430','433','483') ) 
-- Quitar transacciones de promo
 CL_REGCAL NOT IN (29, 3)

-- Vista TCD
CREATE VIEW [dbo].[TodasTrxTCD_Angry]
AS
SELECT     C_VENTA, T_OPERACION, E_OPERACION, TCF14FI.FECHA, HORA, ID_CUENTA, CL_CLIENTE, CL_TARJETA, C_RESULTADO   , UNIDADES   , CL_REGCAL                
    FROM         dbo.TCF14FI
    INNER JOIN TCF67 ON TCF14FI.FECHA = TCF67.FECHA AND TCF14FI.N_VENTA = TCF67.N_VENTA AND TCF14FI.C_VENTA = TCF67.CL_CENTRO AND 
    TCF14FI.CL_EMPRESA = TCF67.CL_EMPRESA AND TCF14FI.P_VENTA = TCF67.CL_TPV 
    WHERE     (LEFT(CL_TARJETA, 9) = '972400077')
    and TCF14FI.fecha between '20150501' and '20170108'
    and T_OPERACION='M' and C_RESULTADO='000' and E_OPERACION='R'
    and CL_ARTI IN ('121','122','126','127','130','133','421','422','426','427','430','433','483')
    and CL_REGCAL NOT IN (29, 3)
UNION
SELECT     C_VENTA, T_OPERACION, E_OPERACION, CF_DISA_HIST.dbo.TCF16FI_H.FECHA, HORA, ID_CUENTA, CL_CLIENTE, CL_TARJETA, C_RESULTADO , UNIDADES, CL_REGCAL
    FROM         CF_DISA_HIST.dbo.TCF16FI_H
    INNER JOIN CF_DISA_HIST.dbo.TCF67_H ON CF_DISA_HIST.dbo.TCF16FI_H.FECHA = CF_DISA_HIST.dbo.TCF67_H.FECHA AND CF_DISA_HIST.dbo.TCF16FI_H.N_VENTA = CF_DISA_HIST.dbo.TCF67_H.N_VENTA 
    AND CF_DISA_HIST.dbo.TCF16FI_H.C_VENTA = CF_DISA_HIST.dbo.TCF67_H.CL_CENTRO AND 
    CF_DISA_HIST.dbo.TCF16FI_H.CL_EMPRESA = CF_DISA_HIST.dbo.TCF67_H.CL_EMPRESA AND CF_DISA_HIST.dbo.TCF16FI_H.P_VENTA = CF_DISA_HIST.dbo.TCF67_H.CL_TPV 
    WHERE     (LEFT(CL_TARJETA, 9) = '972400077')
    and CF_DISA_HIST.dbo.TCF16FI_H.fecha between '20150501' and '20170108'
    and T_OPERACION='M' and C_RESULTADO='000' and E_OPERACION='R'
    and CL_ARTI IN ('121','122','126','127','130','133','421','422','426','427','430','433','483')
    and CL_REGCAL NOT IN (29, 3)


-- Vista CBS
CREATE VIEW [dbo].[TodasTrxClubSmart_Angry]
AS
SELECT     C_VENTA, T_OPERACION, E_OPERACION, TCF14FI.FECHA, HORA, ID_CUENTA, CL_CLIENTE, CL_TARJETA, C_RESULTADO   , UNIDADES   , CL_REGCAL                
    FROM         dbo.TCF14FI
    INNER JOIN TCF67 ON TCF14FI.FECHA = TCF67.FECHA AND TCF14FI.N_VENTA = TCF67.N_VENTA AND TCF14FI.C_VENTA = TCF67.CL_CENTRO AND 
    TCF14FI.CL_EMPRESA = TCF67.CL_EMPRESA AND TCF14FI.P_VENTA = TCF67.CL_TPV 
    WHERE     (LEFT(CL_TARJETA, 6) = '700421')
    and TCF14FI.fecha between '20150501' and '20170108'
    and T_OPERACION='M' and C_RESULTADO='000' and E_OPERACION='R'
    and CL_ARTI IN ('121','122','126','127','130','133','421','422','426','427','430','433','483')
    and CL_REGCAL NOT IN (29, 3)
UNION
SELECT     C_VENTA, T_OPERACION, E_OPERACION, CF_DISA_HIST.dbo.TCF16FI_H.FECHA, HORA, ID_CUENTA, CL_CLIENTE, CL_TARJETA, C_RESULTADO , UNIDADES, CL_REGCAL
    FROM         CF_DISA_HIST.dbo.TCF16FI_H
    INNER JOIN CF_DISA_HIST.dbo.TCF67_H ON CF_DISA_HIST.dbo.TCF16FI_H.FECHA = CF_DISA_HIST.dbo.TCF67_H.FECHA AND CF_DISA_HIST.dbo.TCF16FI_H.N_VENTA = CF_DISA_HIST.dbo.TCF67_H.N_VENTA 
    AND CF_DISA_HIST.dbo.TCF16FI_H.C_VENTA = CF_DISA_HIST.dbo.TCF67_H.CL_CENTRO AND 
    CF_DISA_HIST.dbo.TCF16FI_H.CL_EMPRESA = CF_DISA_HIST.dbo.TCF67_H.CL_EMPRESA AND CF_DISA_HIST.dbo.TCF16FI_H.P_VENTA = CF_DISA_HIST.dbo.TCF67_H.CL_TPV 
    WHERE     (LEFT(CL_TARJETA, 6) = '700421')
    and CF_DISA_HIST.dbo.TCF16FI_H.fecha between '20150501' and '20170108'
    and T_OPERACION='M' and C_RESULTADO='000' and E_OPERACION='R'
    and CL_ARTI IN ('121','122','126','127','130','133','421','422','426','427','430','433','483')
    and CL_REGCAL NOT IN (29, 3)

