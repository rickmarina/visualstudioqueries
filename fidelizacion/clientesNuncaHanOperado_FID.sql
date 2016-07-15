select tcf42.ID_CUENTA, tcf41.cl_tarjeta, 
tcf42.FECHA_ULT_OPER, tcf42.SALDO_PUNTOS,
tcf40.nombre, tcf40.APELLIDO1, tcf40.APELLIDO2, tcf40.DIRECCION, tcf40.LOCALIDAD, tcf40.PROVINCIA, tcf40.cp, tcf40.DOCID, tcf40.TEL_MOVIL, tcf40.EMAIL
from tcf42
	inner join tcf41 on tcf42.cl_cliente = tcf41.CL_CLIENTE and tcf42.ID_CUENTA = tcf41.ID_CUENTA 
	inner join tcf40 on tcf42.cl_cliente = tcf40.CL_CLIENTE
where tcf42.fecha_ult_oper is null
and left(tcf41.cl_tarjeta,6) = '972400'
and tcf42.estado = 1
and tcf41.estado = 1 
--con datos
and tcf40.nombre is not null
and tcf40.APELLIDO1 is not null
and tcf40.APELLIDO2 is not null
and tcf40.DIRECCION is not null
and tcf40.LOCALIDAD is not null
and tcf40.PROVINCIA is not null
and tcf40.cp is not null
and tcf40.DOCID is not null
and (tcf40.TEL_MOVIL <> '' or tcf40.EMAIL <> '')