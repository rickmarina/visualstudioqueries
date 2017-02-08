/* Altas WEB Fidelización - detalle de clientes */

select distinct  tcf93.CL_CLIENTE,  
tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2, 
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA, 
tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, 
case when len(tcf93.fecha) = 8 then 
CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103)  else '' end as fechapuntos,  
tcf93.observaciones, 
(select top 1 cl_tarjeta from tcf41 where tcf41.cl_cliente = tcf93.cl_cliente ) as tarjeta, 
case when len(tcf40.fech_alta) = 8 then 
CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103)  else '' end as fecha_alta 
from tcf93 
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente 
where patindex('100 puntos de bienvenida campaña<%> regla<%> + %WEB%',tcf93.OBSERVACIONES) > 0 
--query = filtrarQueryListaNegra(informe, query, "TCF40
if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_CLUBSMART)) { 
    and patindex('100 puntos de bienvenida campaña<000001>%',tcf93.OBSERVACIONES) > 0 
} else if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_TUCLUBDISA)) { 
    and patindex('100 puntos de bienvenida campaña<000006>%',tcf93.OBSERVACIONES) > 0 
} 		
and tcf93.FECHA between "+BBDDUtils.parseDateForCF(informe.getFecha1())+" and "+BBDDUtils.parseDateForCF(informe.getFecha2())+"  		
 union  
select distinct  tcf93.CL_CLIENTE,  
tcf40.nombre,tcf40.APELLIDO1,tcf40.APELLIDO2, 
tcf40.DIRECCION,tcf40.CP,tcf40.LOCALIDAD,tcf40.PROVINCIA, 
tcf40.TEL_FIJO,tcf40.TEL_MOVIL, tcf40.email, 
case when len(tcf93.fecha) = 8 then 
CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf93.fecha), 112),103)  else '' end as fechapuntos,  
tcf93.observaciones, 
tcf93.CL_TARJETA as tarjeta, 
case when len(tcf40.fech_alta) = 8 then 
CONVERT(varchar(20), CONVERT(date, CONVERT(varchar(8), tcf40.fech_alta), 112),103)  else '' end as fecha_alta 
from tcf93 
inner join tcf40 on tcf93.CL_CLIENTE = tcf40.cl_cliente 
where tcf93.observaciones = 'PUNTOS BIENVENIDA WEB CLIENTES'  
--query = filtrarQueryListaNegra(informe, query, "TCF40");
if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_CLUBSMART)) { 
    and left(tcf93.cl_tarjeta,6)='700421'  
} else if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_TUCLUBDISA)) { 
    and left(tcf93.cl_tarjeta,9)='972400077'  
} 		
and tcf93.FECHA between "+BBDDUtils.parseDateForCF(informe.getFecha1())+" and "+BBDDUtils.parseDateForCF(informe.getFecha2())+"  