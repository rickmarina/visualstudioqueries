
/* Totalizador de tarjetas activas */
declare @fechaini as nvarchar(50)
declare @fechafin as nvarchar(50)

SET @fechaini = '20160301'
SET @fechafin = '20160331'

select CASE WHEN centro IS NULL THEN 'SIN_ASIGNAR' ELSE centro END as centroUltimaTrx,        
ISNULL((select top 1 cod_establ from estacionesClubSmart where cl_centro = centro),'') as codEESS,        
ISNULL((select top 1 descripcion from estacionesClubSmart where cl_centro = centro),'') as Estacion,
count(*) as tarjetasActivas
from (       

select cl_cliente, cl_tarjeta,
(select top 1 C_VENTA from tcf14fi as trx where trx.cl_tarjeta = sq1.cl_tarjeta and (trx.c_resultado = '000') AND (trx.FECHA = sq1.fechamax)) as centro
from (
SELECT distinct TodasTrxTuClubDISA_Micro.cl_cliente, TodasTrxTuClubDISA_Micro.cl_tarjeta, max(TodasTrxTuClubDISA_Micro.fecha) as fechamax         
from TodasTrxTuClubDISA_Micro
--[dbo].[TodasTrxClubSmart_Micro]
WHERE (TodasTrxTuClubDISA_Micro.c_resultado = '000')       
AND TodasTrxTuClubDISA_Micro.FECHA >= @fechaini 
and TodasTrxTuClubDISA_Micro.FECHA <= @fechafin  
--AND LEFT(TCF14FI.CL_TARJETA,6) = '700421' 
AND left(TodasTrxTuClubDISA_Micro.cl_tarjeta,9) = '972400077'
group by TodasTrxTuClubDISA_Micro.cl_cliente, TodasTrxTuClubDISA_Micro.cl_tarjeta

) as sq1

) as sq2
group by centro  