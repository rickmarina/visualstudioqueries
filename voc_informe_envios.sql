/* VOC - informe de envíos */

select anyo, q, sum(total) from (

select year(fechaEnvio) as anyo, 
case 
	when month(fechaEnvio) in (1,2,3) then 'Q1' 
	when month(fechaEnvio) in (4,5,6) then 'Q2' 
	when month(fechaEnvio) in (7,8,9) then 'Q3' 
	when month(fechaEnvio) in (10,11,12) then 'Q4' 
end as Q,
count(*) as total
from [dbo].[TuOpinionImportaEnviosClientes]
group by year(fechaEnvio), month(fechaEnvio)

) as sq1
group by anyo,q
order by 1,2

/* Informe trimestral por eess y total de envío de correos */

select left(convert(nvarchar(50),fechaEnvio,112),6) as fechaEnvio, estacion_codigo, estacion_nombre, count(*) as emails
from 
[dbo].[TuOpinionImportaEnviosClientes]
where left(convert(nvarchar(50),fechaEnvio,112),6) between '201604' and '201606'
and left(cl_Tarjeta,6) = '700421'
and estado = 'ENVIADO'
group by left(convert(nvarchar(50),fechaEnvio,112),6), estacion_codigo, estacion_nombre
order by 1 