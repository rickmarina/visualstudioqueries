/*
Informe: 
-          Clientes cuya primera operación se encuentra en el periodo seleccionado.
 
Filtros: 
-          Tipo de tarjeta
-          Fecha inicio
-          Fecha fin
-          Lista negra
 
Datos de salida:
-          Código de cliente, Código de cuenta, Nº tarjeta, Código eshell estación asociada, Nombre de estación, fecha primera transacción.
*/
select tcf41.cl_cliente, tcf41.id_cuenta, tcf41.cl_tarjeta, tcf40.cl_centro_hab, 
isnull((select top 1 COD_ESTABL from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = cl_centro_hab and cl_empresa = CL_EMPRESA_HAB),'-') as codeshell,
isnull((select top 1 descripcion from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = cl_centro_hab and cl_empresa = CL_EMPRESA_HAB),'-') as estacion,
CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), fecha_prim_oper), 112),103) 
from tcf41
inner join tcf40 on tcf40.cl_cliente = tcf41.cl_cliente
where fecha_prim_oper between '201609091' and '20160930' 


query.append("select tcf41.cl_cliente, tcf41.id_cuenta, tcf41.cl_tarjeta, tcf40.cl_centro_hab,  ");
		query.append("isnull((select top 1 COD_ESTABL from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = cl_centro_hab and cl_empresa = CL_EMPRESA_HAB),'-') as codeshell, ");
		query.append("isnull((select top 1 descripcion from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = cl_centro_hab and cl_empresa = CL_EMPRESA_HAB),'-') as estacion, ");
		query.append("fecha_prim_oper ");
		query.append("from tcf41 ");
		query.append("inner join tcf40 on tcf40.cl_cliente = tcf41.cl_cliente ");
		query.append("where fecha_prim_oper between '"+fechaI+"' and '"+fechaF+"'  ");
		query = filtrarQueryTipoTarjeta(informe,query,"tcf41");
		query = filtrarQueryListaNegra(informe, query,"tcf41");
		query.append("order by fecha_prim_oper ");