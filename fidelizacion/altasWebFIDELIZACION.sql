/* Altas WEB Fidelización - detalle de clientes */

select distinct  tcf93.CL_CLIENTE,   
tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2,
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA,
tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, tcf93.fecha, tcf93.observaciones,
(select top 1 cl_tarjeta from tcf41 where tcf41.cl_cliente = tcf93.cl_cliente ) as tarjeta
from tcf93
--inner join tcf41 on tcf93.CL_CLIENTE = tcf41.CL_CLIENTE
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente
where patindex('100 puntos de bienvenida campaña<%> regla<%> + %WEB%',tcf93.OBSERVACIONES) > 0
--tipo tarjeta 
--and patindex('100 puntos de bienvenida campaña<000001>%',tcf93.OBSERVACIONES) > 0 --cbsma
and patindex('100 puntos de bienvenida campaña<000006>%',tcf93.OBSERVACIONES) > 0 --tcd
and tcf93.FECHA between '20160301' and '20160331' 


