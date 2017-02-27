/* Informe altas web / DITE */

select distinct  'WEB' as medio, tcf93.CL_CLIENTE, tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2, 
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA, tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, 
case when len(tcf93.fecha) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103) else '' end as fechapuntos, 
tcf93.observaciones, (select top 1 cl_tarjeta from tcf41 where tcf41.cl_cliente = tcf93.cl_cliente ) as tarjeta, 
case when len(tcf40.fech_alta) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103) else '' end as fecha_alta,
isnull(EstacionesClubSmart_ACTIVAS.COD_ESTABL,'') as codeess, isnull(EstacionesClubSmart_ACTIVAS.DESCRIPCION,'') as estacion
from tcf93 
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente 
left outer join EstacionesClubSmart_ACTIVAS on estacionesClubSmart_ACTIVAS.cl_centro = tcf40.CL_CENTRO_HAB and EstacionesClubSmart_ACTIVAS.CL_EMPRESA = tcf40.CL_EMPRESA_HAB
where patindex('100 puntos de bienvenida campaña<%> regla<%> + %WEB%',tcf93.OBSERVACIONES) > 0 
and tcf93.FECHA between 20170201 and 20170214   



select * from (
select distinct  'WEB' as medio, tcf93.CL_CLIENTE, tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2, tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA, 
tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, 
case when len(tcf93.fecha) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103) else '' end as fechapuntos, 
tcf93.observaciones, 
(select top 1 cl_tarjeta from tcf41 where tcf41.cl_cliente = tcf93.cl_cliente ) as tarjeta, 
case when len(tcf40.fech_alta) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103) else '' end as fecha_alta, 
isnull(EstacionesClubSmart_ACTIVAS.COD_ESTABL,'') as codeess, isnull(EstacionesClubSmart_ACTIVAS.DESCRIPCION,'') as estacion 
from tcf93 inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente 
left outer join EstacionesClubSmart_ACTIVAS on estacionesClubSmart_ACTIVAS.cl_centro = tcf40.CL_CENTRO_HAB and EstacionesClubSmart_ACTIVAS.CL_EMPRESA = tcf40.CL_EMPRESA_HAB 
where patindex('100 puntos de bienvenida campaña<%> regla<%> + %WEB%',tcf93.OBSERVACIONES) > 0 
--and patindex('100 puntos de bienvenida campaña<000001>%',tcf93.OBSERVACIONES) > 0 
and tcf93.FECHA between 20160901 and 20170108   
) as sq1
--where left(tarjeta,6) = '700421'
where left(tarjeta,39)='972400077'


union 

select distinct  'WEB' as medio, tcf93.CL_CLIENTE, tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2, 
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA, tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, 
case when len(tcf93.fecha) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103) else '' end as fechapuntos, 
tcf93.observaciones, tcf93.CL_TARJETA as tarjeta, 
case when len(tcf40.fech_alta) = 8 then CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103) else '' end as fecha_alta,
isnull(EstacionesClubSmart_ACTIVAS.COD_ESTABL,'') as codeess, isnull(EstacionesClubSmart_ACTIVAS.DESCRIPCION,'') as estacion
from tcf93 
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente 
left outer join EstacionesClubSmart_ACTIVAS on estacionesClubSmart_ACTIVAS.cl_centro = tcf40.CL_CENTRO_HAB and EstacionesClubSmart_ACTIVAS.CL_EMPRESA = tcf40.CL_EMPRESA_HAB
where tcf93.observaciones = 'PUNTOS BIENVENIDA WEB CLIENTES'  
and tcf93.FECHA between 20170201 and 20170214
   
union

select distinct  'DITE' as medio, tcf93.CL_CLIENTE,   tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2,  
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA,  tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email,  
case when len(tcf93.fecha) = 8 then  CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103)  else '' end as fechapuntos,   
tcf93.observaciones,  tcf93.CL_TARJETA as tarjeta,  
case when len(tcf40.fech_alta) = 8 then  CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103)  else '' end as fecha_alta,
isnull(EstacionesClubSmart_ACTIVAS.COD_ESTABL,'') as codeess, isnull(EstacionesClubSmart_ACTIVAS.DESCRIPCION,'') as estacion  
from tcf93  
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente  
left outer join EstacionesClubSmart_ACTIVAS on estacionesClubSmart_ACTIVAS.cl_centro = tcf40.CL_CENTRO_HAB and EstacionesClubSmart_ACTIVAS.CL_EMPRESA = tcf40.CL_EMPRESA_HAB
where tcf93.observaciones = 'PUNTOS BIENVENIDA'   
and cl_usuario = 'CSC1' 
and tcf93.FECHA between 20170201 and 20170214   

