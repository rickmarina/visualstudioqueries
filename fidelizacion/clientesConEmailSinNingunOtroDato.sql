use CF_DISA;

/*Clientes CBS con email sin ningún otro dato */
select tcf41.cl_tarjeta, tcf40.*
from tcf40
	inner join tcf41 on tcf41.CL_CLIENTE = tcf40.CL_CLIENTE
where email like '%@%.%'
and left(tcf41.cl_tarjeta,6)='700421'
and left(tcf41.cl_tarjeta,6) = '972400'
and (TEL_FIJO = '' or TEL_FIJO is null)
and (TEL_MOVIL = '' or TEL_MOVIL is null)
and (PROVINCIA = '' or PROVINCIA is null)
and (LOCALIDAD = '' or LOCALIDAD is null)
and (DIRECCION = '' or DIRECCION is null)
and (CP = '' or CP is null)
and (nombre = '' or nombre is null)
and (APELLIDO1 = '' or APELLIDO1 is null)
and (APELLIDO2 = '' or APELLIDO2 is null)
and (tcf41.ESTADO = 1)



use CF_DISA;

/*Clientes CBS activos sin email sin ningún otro dato activos en los últimos 12 meses con saldo positivo */
select tcf41.cl_tarjeta, tcf42.fecha_ult_oper, tcf42.SALDO_PUNTOS, tcf40.CL_CLIENTE
from tcf40
	inner join tcf41 on tcf41.CL_CLIENTE = tcf40.CL_CLIENTE
	inner join tcf42 on tcf42.CL_CLIENTE = tcf40.cl_cliente
where (email = '' or email is null)
and left(tcf41.cl_tarjeta,6)='700421'
and (TEL_FIJO = '' or TEL_FIJO is null)
and (TEL_MOVIL = '' or TEL_MOVIL is null)
and (PROVINCIA = '' or PROVINCIA is null)
and (LOCALIDAD = '' or LOCALIDAD is null)
and (DIRECCION = '' or DIRECCION is null)
and (CP = '' or CP is null)
and (nombre = '' or nombre is null)
and (APELLIDO1 = '' or APELLIDO1 is null)
and (APELLIDO2 = '' or APELLIDO2 is null)
and tcf41.ESTADO = 1
and tcf42.estado in (1,2)
and tcf42.FECHA_ULT_OPER >= convert(char(8),DateAdd(yy,-1,getdate()),112)
and tcf42.saldo_puntos > 0

use CF_DISA;

/*Clientes TCD activos sin email sin ningún otro dato activos en los últimos 12 meses con saldo positivo */
select tcf41.cl_tarjeta, tcf42.fecha_ult_oper, tcf42.SALDO_PUNTOS, tcf40.CL_CLIENTE
from tcf40
	inner join tcf41 on tcf41.CL_CLIENTE = tcf40.CL_CLIENTE
	inner join tcf42 on tcf42.CL_CLIENTE = tcf40.cl_cliente
where (email = '' or email is null)
and left(tcf41.cl_tarjeta,6) = '972400'
and (TEL_FIJO = '' or TEL_FIJO is null)
and (TEL_MOVIL = '' or TEL_MOVIL is null)
and (PROVINCIA = '' or PROVINCIA is null)
and (LOCALIDAD = '' or LOCALIDAD is null)
and (DIRECCION = '' or DIRECCION is null)
and (CP = '' or CP is null)
and (nombre = '' or nombre is null)
and (APELLIDO1 = '' or APELLIDO1 is null)
and (APELLIDO2 = '' or APELLIDO2 is null)
and tcf41.ESTADO = 1
and tcf42.estado in (1,2)
and tcf42.FECHA_ULT_OPER >= convert(char(8),DateAdd(yy,-1,getdate()),112)
and tcf42.saldo_puntos > 0