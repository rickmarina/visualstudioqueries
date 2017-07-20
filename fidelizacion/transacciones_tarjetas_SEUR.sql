/* Tarjetas SEUR
* puntos y volumen de las transacciones a partir de una fecha */


select tcf14fi.CL_TARJETA, sum(tcf67.puntos) as puntos, sum(tcf67.unidades) as vol 
from zzz_tarjetasCBS 
inner join tcf14fi on left(tcf14fi.cl_tarjeta,16) = zzz_tarjetasCBS.cl_tarjeta collate SQL_Latin1_General_CP1_CI_AI 
inner join tcf67 on tcf67.FECHA = tcf14fi.FECHA 
AND  tcf67.CL_EMPRESA = tcf14fi.CL_EMPRESA 
AND tcf67.CL_CENTRO = tcf14fi.C_VENTA  
AND tcf67.CL_TPV = tcf14fi.P_VENTA  
AND  tcf67.N_VENTA = tcf14fi.N_VENTA  
where tcf14fi.T_OPERACION = 'M' and tcf14fi.C_RESULTADO = '000' and tcf14fi.E_OPERACION = 'R' 
and tcf14fi.FECHA >= '20170417'
group by tcf14fi.CL_TARJETA