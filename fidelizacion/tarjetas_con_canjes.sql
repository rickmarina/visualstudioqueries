/*
Tarjetas que han canjeado  en una o varias estaciones  en un periodo y  total de puntos canjeados 
*/
if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_CLUBSMART)) { 
    tabla = "TodosCanjesClubSmart";
} else if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_TUCLUBDISA)) { 
    tabla = "TodosCanjesTCD";
}
select codeshell, estacion, sum(tarjetas) as tarjetas, sum(ptos_canje) as ptos_canje
from (

select 
isnull((select top 1 COD_ESTABL from EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = c_venta ),'-') as codeshell,
isnull((select top 1 descripcion from EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = c_venta ),'-') as estacion,
sum(saldo_prev-SALDO_POST) as ptos_canje,  
count(distinct cl_tarjeta) as tarjetas  
from TodosCanjesClubSmart  
where fecha between '20160101' and '20161231'  
and e_operacion = 'R'  and C_RESULTADO = '000'  
and saldo_prev <> saldo_post
group by c_venta 

) as sq1
group by codeshell, estacion


--Otras aproximaciones:


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


query.append("select c_venta,  ");
query.append("EstacionesClubSmart.COD_ESTABL as codeshell, EstacionesClubSmart.DESCRIPCION as estacion, ");
query.append("sum(saldo_prev-SALDO_POST) as ptos_canje,  ");
query.append("count(distinct cl_tarjeta) as tarjetas  ");
query.append("from TodosCanjesClubSmart  ");
query.append("inner join EstacionesClubSmart on EstacionesClubSmart.CL_EMPRESA = TodosCanjesClubSmart.CL_EMPRESA and EstacionesClubSmart.CL_CENTRO = TodosCanjesClubSmart.C_VENTA ");
query.append("where t_operacion = 'C'  ");
query.append("and fecha between '20170101' and '20170201'  ");
query.append("and e_operacion = 'R'  ");
query.append("and C_RESULTADO = '000'  ");
query.append("group by c_venta , EstacionesClubSmart.COD_ESTABL, EstacionesClubSmart.DESCRIPCION ");


