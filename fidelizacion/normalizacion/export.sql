/* consulta exportar datos para normalización de datos */

Select tcf40.cl_cliente, NOMBRE, APELLIDO1, APELLIDO2, EMAIL, TEL_MOVIL, DIRECCION, CP, LOCALIDAD, PROVINCIA
from tcf40
inner join tcf41 on tcf40.cl_cliente = tcf41.cl_cliente
where (cl_Tarjeta like '700421%' or cl_Tarjeta like '972400077%')
and (CHECKSUM(isnull(nombre,'')+isnull(APELLIDO1,'')+isnull(APELLIDO2,'')+isnull(EMAIL,'')+isnull(TEL_MOVIL,'')+isnull(DIRECCION,'')+isnull(CP,'')
+isnull(LOCALIDAD,'')+isnull(PROVINCIA,'')) <> 0
)


/* consulta exportar datos para normalización de datos - borrando duplicados */

select distinct * from (
Select tcf40.cl_cliente, NOMBRE, APELLIDO1, APELLIDO2, EMAIL, TEL_MOVIL, DIRECCION, CP, LOCALIDAD, PROVINCIA
from tcf40
inner join tcf41 on tcf40.cl_cliente = tcf41.cl_cliente
where (cl_Tarjeta like '700421%' or cl_Tarjeta like '972400077%')
and (CHECKSUM(isnull(nombre,'')+isnull(APELLIDO1,'')+isnull(APELLIDO2,'')+isnull(EMAIL,'')+isnull(TEL_MOVIL,'')+isnull(DIRECCION,'')+isnull(CP,'')
+isnull(LOCALIDAD,'')+isnull(PROVINCIA,'')) <> 0
) 
) as sq1