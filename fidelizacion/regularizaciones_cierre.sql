select motivo, num_transacc, total_puntos 
from (

select 
case  
when  tcf93.observaciones in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta')  
then tcf93.observaciones else tcf93.motivo  
end as motivo, 
COUNT(TCF93.ID_MOV) AS NUM_TRANSACC,  
SUM(PUNTOS) AS TOTAL_PUNTOS  
FROM tcf93  
where (LEFT(TCF93.FECHA, 6) = '201711')  
GROUP BY 
case  
when  tcf93.observaciones in ('Regalo 200 puntos por recomendar a amigo','Regalo 50 puntos por modificar datos de la tarjeta','Regalo 50 puntos por registro de tarjeta')  
then tcf93.observaciones else tcf93.motivo end 
) as sq1
where motivo not in (
    'Agrupación de puntos',
    'Puntos de bienvenida',
    'PUNTOS OTORGADOS POR CABRERA',
    'PUNTOS OTORGADOS POR CICAR',
    'Regularización por traspaso'
)