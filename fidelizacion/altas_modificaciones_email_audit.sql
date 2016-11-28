/* Informe: auditoría altas y modificaciones email */
select isnull(eess,'-') as codeess,
isnull((select top 1 descripcion from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = eess),'-') as estacion,
sum(case when tipo = 'MODIFICACION' then 1 else 0 end) as modificaciones, 
sum(case when tipo = 'ALTA' then 1 else 0 end) as altas
from clientesAuditoria
where fecha between '22/8/2016 00:00:00' and '24/8/2016 23:59:59'
group by eess

/* detallado por usuario */
select * ,isnull((select top 1 descripcion from CF_DISA.dbo.EstacionesClubSmart where cl_centro collate Modern_Spanish_CI_AS = eess),'-') as estacion
from clientesauditoria
where fecha between '1/9/2016 00:00:00' and '30/9/2016 23:59:59'
order by fecha