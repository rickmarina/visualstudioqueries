
select distinct [TuOpinionImportaBajas].email , tcf40.CL_CLIENTE, tcf42.ID_CUENTA , tcf42.FECHA_ULT_OPER
from [dbo].[TuOpinionImportaBajas]
inner join CF_DISA.dbo.tcf40 on [TuOpinionImportaBajas].email = CF_DISA.dbo.tcf40.EMAIL
inner join CF_DISA.dbo.tcf42 on CF_DISA.dbo.tcf42.CL_CLIENTE = CF_DISA.dbo.tcf40.CL_CLIENTE
where motivo is null
and fecha_ult_oper >= '20160909'

--clientes dados de baja sin motivo que han operado última semana





--export fraude simple 
select
semana, 
( select nombre from estaciones where pkcodigo = AFR_Resultados.fkestacion) as estacion,
cod_eshell_estacion, 
year(fecha) as anyo, month(fecha) as mes, 
nombreDescuento as descuento, 
( select nombreCompleto from Usuarios where pkcodigo = AFR_Resultados.fkusuariojefezona ) as jefezona,
importeTrx,descuentoTrx,
'' as fecha_comunicacion,'' as llamada_tel,'' as mail, '' as causa,'' as acciones_tomadas, '' as comentarios
from afr_resultados
where concatenado in (

		select concatenado from (
		select distinct concatenado, nombreDescuento 
		from afr_resultados
		where fecha between '01-01-2016' and '31-12-2016'
		and tipoCarga not in (3)
		) as sq1
		group by concatenado
		having count(*) > 1

)
order by concatenado 

-- export fichero de seguimiento 

select
semana, 
( select nombre from estaciones where pkcodigo = afr1.fkestacion) as estacion,
cod_eshell_estacion, 
year(fecha) as anyo, month(fecha) as mes, 
--nombreDescuento as descuento, 
STUFF((SELECT ', ' + nombreDescuento FROM afr_resultados as afr2 where afr1.concatenado = afr2.concatenado FOR XML PATH('')),1,1,'') as descuentos,
count(*) as errores,
( select nombreCompleto from Usuarios where pkcodigo = afr1.fkusuariojefezona ) as jefezona,
sum(importeTrx) as importeTrx,
sum(descuentoTrx) as descuentoTrx,
'' as fecha_comunicacion,'' as llamada_tel,'' as mail, '' as causa,'' as acciones_tomadas, '' as comentarios
from afr_resultados as afr1
where concatenado in (
		select concatenado from (
		select distinct concatenado, nombreDescuento 
		from afr_resultados
		where fecha between '01-01-2016' and '31-12-2016'
		and tipoCarga not in (3)
		) as sq1
		group by concatenado
		having count(*) > 1
)
group by semana, cod_eshell_estacion, year(fecha), month(fecha), fkestacion, concatenado, fkusuariojefezona
order by concatenado 