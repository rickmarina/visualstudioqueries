USE CF_DISA;

select tcf89.fecha, tcf89.hora, tcf89.cl_centro, estacionesclubsmart.COD_ESTABL as codEESS, EstacionesClubSmart.DESCRIPCION as estacion, tcf89.cl_regalo as regalosorteado,  
(select darti from tcf48 where tcf48.CL_ARTI = tcf89.CL_REGALO) as descripcionregalosorteado,   
tcf89.CL_TARJETA as tarjetapremiada   
,tcf49.FECHA_MOV as fechacanje, tcf49.HORA_MOV as horacanje,  
tcf49.CL_REGALO as regalocanjeado,   
(select darti from tcf48 where tcf48.CL_ARTI = tcf49.CL_REGALO) as descripcionregalocanjeado   
from tcf89 
INNER JOIN TCF14FI on tcf14fi.CL_TARJETA = tcf89.CL_TARJETA and tcf14fi.FECHA = tcf89.FECHA and tcf14fi.HORA >= tcf89.HORA and tcf14fi.CL_EMPRESA = tcf89.CL_EMPRESA and tcf14fi.C_VENTA = tcf89.CL_CENTRO
INNER JOIN TCF49 ON TCF49.FECHA_MOV = TCF14FI.FECHA AND TCF49.HORA_MOV = TCF14FI.HORA 
AND TCF49.CL_CENTRO = TCF14FI.C_VENTA AND TCF49.CL_EMPRESA = TCF14FI.CL_EMPRESA 
inner join estacionesClubsmart on EstacionesClubSmart.CL_CENTRO = tcf89.CL_CENTRO and EstacionesClubSmart.CL_EMPRESA = tcf89.CL_EMPRESA
where 
left(tcf89.fecha,6) = '201601'  	--filtro fechas  
and tcf89.cl_regalo = '69929' 		--código de regalo sorteado  
and tcf49.CL_REGALO = '' 			--código de regalo canjeado  
and TCF14FI.T_OPERACION = 'C'     	-- op canje
and TCF14FI.E_OPERACION = 'R'    	-- op resuelta


/* Posibilidad de averiguar la transacción que se ha premiado, volumen */
select tcf89.fecha, tcf89.hora, tcf89.cl_centro, 
estacionesclubsmart.COD_ESTABL as codEESS, 
EstacionesClubSmart.DESCRIPCION as estacion, 
tcf89.cl_regalo as regalosorteado,  
(select top 1 darti from tcf48 where tcf48.CL_ARTI = tcf89.CL_REGALO) as descripcionregalosorteado,   
tcf89.CL_TARJETA as tarjetapremiada   
,tcf49.FECHA_MOV as fechacanje, tcf49.HORA_MOV as horacanje,  
tcf49.CL_REGALO as regalocanjeado,   
(select top 1 darti from tcf48 where tcf48.CL_ARTI = tcf49.CL_REGALO) as descripcionregalocanjeado   
,tcf14fi.cl_empresa, tcf14fi.c_venta, tcf14fi.p_venta , tcf14fi.n_venta, tcf14fi.fecha, tcf14fi.hora,
(select top 1 unidades from tcf67 where tcf67.cl_empresa = tcf89.CL_EMPRESA and tcf67.CL_CENTRO = tcf89.CL_CENTRO and tcf67.CL_TPV = tcf89.CL_TPV and tcf67.N_VENTA = tcf89.N_VENTA and tcf67.fecha = tcf89.FECHA) as unidades
from tcf89 
INNER JOIN TCF14FI on tcf14fi.CL_TARJETA = tcf89.CL_TARJETA and tcf14fi.FECHA = tcf89.FECHA and tcf14fi.HORA >= tcf89.HORA and tcf14fi.CL_EMPRESA = tcf89.CL_EMPRESA and tcf14fi.C_VENTA = tcf89.CL_CENTRO
INNER JOIN TCF49 ON TCF49.FECHA_MOV = TCF14FI.FECHA AND TCF49.HORA_MOV = TCF14FI.HORA 
AND TCF49.CL_CENTRO = TCF14FI.C_VENTA AND TCF49.CL_EMPRESA = TCF14FI.CL_EMPRESA 
inner join estacionesClubsmart on EstacionesClubSmart.CL_CENTRO = tcf89.CL_CENTRO and EstacionesClubSmart.CL_EMPRESA = tcf89.CL_EMPRESA
where 
left(tcf89.fecha,6) >= '201601'  	--filtro fechas  
and tcf89.cl_regalo = '66060' 		--código de regalo sorteado  
--and tcf49.CL_REGALO = '' 			--código de regalo canjeado  
and TCF14FI.T_OPERACION = 'C'     	-- op canje
and TCF14FI.E_OPERACION = 'R'    	-- op resuelta
