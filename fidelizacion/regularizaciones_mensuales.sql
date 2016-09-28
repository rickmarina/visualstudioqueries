/* Regularizaciones mensuales - actualizado 20160728 */
declare @fecha as nvarchar(6)

set @fecha = '201606'

select isnull(TCF93.CL_EMPRESA,'-') AS COD_EMPRESA_CF, 
		isnull(TCF93.CL_CENTRO,'-') AS COD_CENTRO_CF, 
		isnull((select top 1 cod_establ from estacionesclubsmart where tcf93.CL_EMPRESA = EstacionesClubSmart.CL_EMPRESA and tcf93.CL_CENTRO = EstacionesClubSmart.CL_CENTRO),'-') as cod_eess,
		isnull((select top 1 DESCRIPCION from estacionesclubsmart where tcf93.CL_EMPRESA = EstacionesClubSmart.CL_EMPRESA and tcf93.CL_CENTRO = EstacionesClubSmart.CL_CENTRO),'-') AS NOMBRE_EESS, 
		case 
			when  tcf93.observaciones in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta') 
			then tcf93.observaciones else tcf93.motivo 
		end as motivo,
		COUNT(TCF93.ID_MOV) AS NUM_TRANSACC, 
		SUM(PUNTOS) AS TOTAL_PUNTOS 
FROM tcf93 
where (LEFT(TCF93.FECHA, 6) = @fecha) 
GROUP BY TCF93.CL_EMPRESA, TCF93.CL_CENTRO, 
case 
when  tcf93.observaciones in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta') 
then tcf93.observaciones else tcf93.motivo end
order by 4






/* Regularizaciones mensuales */
declare @fecha as nvarchar(6)

set @fecha = '201607'

SELECT TCF93.CL_EMPRESA AS COD_EMPRESA_CF, 
		TCF93.CL_CENTRO AS COD_CENTRO_CF, 
		TCF11.COD_ESTABL as COD_EESS, 
		TCF04.DESCRIPCION AS NOMBRE_EESS, 
		'Regularización manual' as MOTIVO, 
		COUNT(TCF93.ID_MOV) AS NUM_TRANSACC, 
		SUM(PUNTOS) AS TOTAL_PUNTOS 
FROM TCF11 
		INNER JOIN TCF04 ON TCF11.CL_EMPRESA = TCF04.CL_EMPRESA AND TCF11.CL_CENTRO = TCF04.CL_CENTRO 
		RIGHT OUTER JOIN TCF93 ON TCF04.CL_CENTRO = TCF93.CL_CENTRO AND TCF04.CL_EMPRESA = TCF93.CL_EMPRESA 
WHERE (TCF93.TIPO_MOV IN ('R')) AND (LEFT(TCF93.FECHA, 6) = @fecha) 
		AND (NOT (TCF93.CL_EMPRESA IN ('00949999', '00949998', '00000001'))) 
		AND TCF11.CL_CA='000001' 
        and tcf93.observaciones not in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta')
GROUP BY TCF93.CL_EMPRESA, TCF93.CL_CENTRO, TCF04.DESCRIPCION, TCF11.COD_ESTABL 
		UNION 
SELECT TCF93.CL_EMPRESA AS COD_EMPRESA_CF, 
		TCF93.CL_CENTRO AS COD_CENTRO_CF, 
		TCF11.COD_ESTABL as COD_EESS, 
		TCF04.DESCRIPCION AS NOMBRE_EESS, 
		tcf93.observaciones as MOTIVO, 
		COUNT(TCF93.ID_MOV) AS NUM_TRANSACC, 
		SUM(PUNTOS) AS TOTAL_PUNTOS 
FROM TCF11 
		INNER JOIN TCF04 ON TCF11.CL_EMPRESA = TCF04.CL_EMPRESA AND TCF11.CL_CENTRO = TCF04.CL_CENTRO 
		RIGHT OUTER JOIN TCF93 ON TCF04.CL_CENTRO = TCF93.CL_CENTRO AND TCF04.CL_EMPRESA = TCF93.CL_EMPRESA 
WHERE (TCF93.TIPO_MOV IN ('R')) AND (LEFT(TCF93.FECHA, 6) = @fecha) 
		AND TCF11.CL_CA='000001' 
        and tcf93.observaciones in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta')
GROUP BY TCF93.CL_EMPRESA, TCF93.CL_CENTRO, TCF04.DESCRIPCION, TCF11.COD_ESTABL, tcf93.observaciones
        UNION        
SELECT '-','-','-','-', 
		MOTIVO as MOTIVO, 
		COUNT(TCF93.ID_MOV) AS NUM_TRANSACC, 
		SUM(PUNTOS) AS TOTAL_PUNTOS 
FROM TCF93 
WHERE (CL_EMPRESA = '' OR CL_EMPRESA IS NULL) AND (LEFT(TCF93.FECHA, 6) = @fecha) 
GROUP BY MOTIVO, TIPO_MOV 
ORDER BY TCF04.DESCRIPCION 


query = filtrarQueryListaNegra(informe, query, "TCF93");
		query = filtrarQueryTipoTarjeta(informe, query, "TCF93");