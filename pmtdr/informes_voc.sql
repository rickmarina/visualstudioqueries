/* Informes VOC */			
select top 50 cast(FechaEnvio as date) as fecha,
count(*) as total,
SUM(case when estado='ENVIADO' THEN 1 else 0 end) as correctos,
SUM(case when estado='ERROR NO ENVIADO' THEN 1 else 0 end) as incorrectos 
from TuOpinionImportaEnviosClientes
group by cast(fechaenvio as date)
order by 1 desc


select top 50 cast(FechaEnvio as date) as fecha,
count(*) as total,
SUM(case when estado='ENVIADO' THEN 1 else 0 end) as correctos,
SUM(case when estado='ERROR NO ENVIADO' THEN 1 else 0 end) as incorrectos,
ISNULL(plataformasestaciones.nombre,'-') as plataformanombre
from TuOpinionImportaEnviosClientes
    inner join estaciones on estaciones.codigoshell=TuOpinionImportaEnviosClientes.estacion_codigo 
    left join plataformasestaciones on estaciones.fk_plataformasEstaciones_pkCodigo=plataformasestaciones.pkcodigo 
group by cast(fechaenvio as date), plataformasestaciones.nombre   
order by 1 desc, plataformasestaciones.nombre          



select TuOpinionImportaEnviosClientes.*,        plataformasestaciones.nombre as plataformanombre,        
estaciones.pkCodigo as pkCodigoEstacion,        estaciones.operador as estacionoperador 
from TuOpinionImportaEnviosClientes      
inner join estaciones on estaciones.codigoshell=TuOpinionImportaEnviosClientes.estacion_codigo      
left join plataformasestaciones on estaciones.fk_plataformasEstaciones_pkCodigo=plataformasestaciones.pkcodigo 
where 1 = 1  and TuOpinionImportaEnviosClientes.fechaEnvio >= '27-09-2016'  and TuOpinionImportaEnviosClientes.fechaEnvio <= '27-09-2016' 
order by TuOpinionImportaEnviosClientes.fechaEnvio desc 

/* informe trimestral por estación */

select codigo, opcoSiteId, 'Q3' as periodo, estacion_codigo, estacion_nombre, 
isnull(sum(case when estado = 'ENVIADO' THEN 1 end),0) as total_enviados,
isnull(sum(case when estado <> 'ENVIADO' THEN 1 end),0) as total_rechazados
from (

select estaciones.codigo, estaciones.opcoSiteId, TuOpinionImportaEnviosClientes.*,        plataformasestaciones.nombre as plataformanombre,        
estaciones.pkCodigo as pkCodigoEstacion,        estaciones.operador as estacionoperador 
from TuOpinionImportaEnviosClientes      
inner join estaciones on estaciones.codigoshell=TuOpinionImportaEnviosClientes.estacion_codigo      
left join plataformasestaciones on estaciones.fk_plataformasEstaciones_pkCodigo=plataformasestaciones.pkcodigo 
where fecha between '20160701' and '20160931'
) as sq1
group by estacion_codigo, estacion_nombre, codigo, opcoSiteId
