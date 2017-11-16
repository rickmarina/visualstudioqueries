--fecha actual formato yyyymmdd
select convert(nvarchar,dateadd([day],-1,getdate()),112) as fecha

-- Tarjetas Shell Clubsmart que hayan acumulado puntos un día 
-- y en ese mismo día hayan canjeado cualquiera de los regalos de la tabla de abajo

select convert(nvarchar,dateadd([day],-1,getdate()),112) as fecha, cl_tarjeta, totalCanjes from (
select CL_TARJETA, 
(
	SELECT count(*) 
	from tcf14fi    
	inner join tcf49 ON tcf14fi.FECHA = tcf49.FECHA_MOV AND tcf14fi.N_VENTA = tcf49.N_VENTA 
	AND tcf14fi.C_VENTA = tcf49.CL_CENTRO 
	AND tcf14fi.CL_EMPRESA = tcf49.CL_EMPRESA AND tcf14fi.P_VENTA = tcf49.CL_TPV  
	where tcf14fi.T_OPERACION='C' 
	and tcf14fi.E_OPERACION = 'R' and tcf14fi.C_RESULTADO='000'  
	and tcf14fi.cl_Tarjeta = trx.cl_tarjeta 
	and tcf14fi.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
	and cl_regalo in ( select cl_regalo collate Latin1_General_CI_AI from zzz_angrybirds_promo_regalos )
) as totalCanjes 
from tcf14fi as trx where E_OPERACION = 'R' and C_RESULTADO='000'     
and T_OPERACION = 'M' 
and trx.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and (LEFT(CL_TARJETA, 6) = '700421') 
) as sq1 
where totalCanjes > 0 

-- Tarjetas Shell Clubsmart que hayan canjeado cualquier artículo de la tabla de abajo 
-- y no tengan operaciones de acumulación en ese mismo.
select convert(nvarchar,dateadd([day],-1,getdate()),112) as fecha, cl_tarjeta, totalAcum 
from (
SELECT CL_TARJETA,
(	
	select count(*) from tcf14fi where tcf14fi.E_OPERACION = 'R' and tcf14fi.C_RESULTADO='000'     
and tcf14fi.T_OPERACION = 'M'  and tcf14fi.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and tcf14fi.CL_TARJETA = trx.CL_TARJETA
) as totalAcum
from tcf14fi AS trx   
inner join tcf49 ON trx.FECHA = tcf49.FECHA_MOV AND trx.N_VENTA = tcf49.N_VENTA AND trx.C_VENTA = tcf49.CL_CENTRO AND 
		   trx.CL_EMPRESA = tcf49.CL_EMPRESA AND trx.P_VENTA = tcf49.CL_TPV  
where T_OPERACION='C' 
and (LEFT(trx.CL_TARJETA, 6) = '700421') 
and trx.E_OPERACION = 'R' and trx.C_RESULTADO='000'  
and trx.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and cl_regalo in ( select cl_regalo collate Latin1_General_CI_AI from zzz_angrybirds_promo_regalos )
) as sq1
where totalAcum = 0

-- Tarjetas TCD que hayan acumulado puntos un día 
-- y en ese mismo día hayan canjeado cualquiera de los regalos de la tabla de abajo.
select convert(nvarchar,dateadd([day],-1,getdate()),112) as fecha, cl_tarjeta, totalCanjes from (
select CL_TARJETA, 
(
	SELECT count(*) 
	from tcf14fi    
	inner join tcf49 ON tcf14fi.FECHA = tcf49.FECHA_MOV AND tcf14fi.N_VENTA = tcf49.N_VENTA 
	AND tcf14fi.C_VENTA = tcf49.CL_CENTRO 
	AND tcf14fi.CL_EMPRESA = tcf49.CL_EMPRESA AND tcf14fi.P_VENTA = tcf49.CL_TPV  
	where tcf14fi.T_OPERACION='C' 
	and tcf14fi.E_OPERACION = 'R' and tcf14fi.C_RESULTADO='000'  
	and tcf14fi.cl_Tarjeta = trx.cl_tarjeta 
	and tcf14fi.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
	and cl_regalo in ( select cl_regalo collate Latin1_General_CI_AI from zzz_angrybirds_promo_regalos )
) as totalCanjes 
from tcf14fi as trx where E_OPERACION = 'R' and C_RESULTADO='000'     
and T_OPERACION = 'M' 
and trx.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and (LEFT(CL_TARJETA, 9) = '972400077')
) as sq1 
where totalCanjes > 0 

-- Tarjetas TCD que hayan canjeado cualquier artículo de la tabla de abajo 
-- y no tengan operaciones de acumulación en ese mismo.
select convert(nvarchar,dateadd([day],-1,getdate()),112) as fecha, cl_tarjeta, totalAcum 
from (
SELECT CL_TARJETA,
(	
	select count(*) from tcf14fi where tcf14fi.E_OPERACION = 'R' and tcf14fi.C_RESULTADO='000'     
and tcf14fi.T_OPERACION = 'M'  and tcf14fi.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and tcf14fi.CL_TARJETA = trx.CL_TARJETA
) as totalAcum
from tcf14fi AS trx   
inner join tcf49 ON trx.FECHA = tcf49.FECHA_MOV AND trx.N_VENTA = tcf49.N_VENTA AND trx.C_VENTA = tcf49.CL_CENTRO AND 
		   trx.CL_EMPRESA = tcf49.CL_EMPRESA AND trx.P_VENTA = tcf49.CL_TPV  
where T_OPERACION='C' 
and (LEFT(CL_TARJETA, 9) = '972400077')
and trx.E_OPERACION = 'R' and trx.C_RESULTADO='000'  
and trx.fecha = convert(nvarchar,dateadd([day],-1,getdate()),112)
and cl_regalo in ( select cl_regalo collate Latin1_General_CI_AI from zzz_angrybirds_promo_regalos )
) as sq1
where totalAcum = 0


select * from tcf48 where cl_arti in (
select cl_regalo collate Latin1_General_CI_AI from zzz_angrybirds_promo_regalos )

