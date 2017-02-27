/*
Tarjetas que han canjeado  en una o varias estaciones  en un periodo y  total de puntos canjeados 
*/

select c_venta, 
EstacionesClubSmart.COD_ESTABL as codeshell, EstacionesClubSmart.DESCRIPCION as estacion,
sum(saldo_prev-SALDO_POST) as ptos_canje, 
count(distinct cl_tarjeta) as tarjetas 
from tcf14fi 
inner join EstacionesClubSmart on EstacionesClubSmart.CL_EMPRESA = tcf14fi.CL_EMPRESA and EstacionesClubSmart.CL_CENTRO = tcf14fi.C_VENTA
where t_operacion = 'C' 
and fecha between '20170101' and '20170201' 
and e_operacion = 'R' 
and C_RESULTADO = '000' 
group by c_venta , EstacionesClubSmart.COD_ESTABL, EstacionesClubSmart.DESCRIPCION

union 

select c_venta, 
EstacionesClubSmart.COD_ESTABL as codeshell, EstacionesClubSmart.DESCRIPCION as estacion,
sum(saldo_prev-SALDO_POST) as ptos_canje, 
count(distinct cl_tarjeta) as tarjetas 
from CF_DISA_HIST.dbo.tcf16fi_h as tcf14fi 
inner join EstacionesClubSmart on EstacionesClubSmart.CL_EMPRESA = tcf14fi.CL_EMPRESA and EstacionesClubSmart.CL_CENTRO = tcf14fi.C_VENTA
where t_operacion = 'C' 
and fecha between '20170101' and '20170201' 
and e_operacion = 'R' 
and C_RESULTADO = '000' 
group by c_venta , EstacionesClubSmart.COD_ESTABL, EstacionesClubSmart.DESCRIPCION
