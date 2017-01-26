/* Informe global INGENICO */

select vale_campana_vca.vca_id as tirada, 
    vale_campana_vca.vca_nombre_camp as nombrecamp, 
    vale_campana_vca.vca_cuenta as cuenta, 
    to_char(vale_campana_vca.vca_fec_creacion,'DD/MM/YYYY')  as fecha_emision, 
    to_char(vale_campana_vca.vca_fec_caducidad,'DD/MM/YYYY')  as fecha_cad, 
    min(vale_val.val_id) as CHEQUES_DESDE, 
    max(vale_val.val_id) as CHEQUES_HASTA, 
    --(select count(*) from vale_val where vca_id=vale_campana_vca.vca_id) as total_cheqs2, 
    count(vale_val.val_id) as TOTAL_CHEQS, 
    sum(VAL_IMPORTE) as TOTAL_IMPORTE, 
    sum(VAL_IMPORTE)/count(vale_val.val_id) as IMPORTE_MEDIO, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN 1 ELSE 0 END) AS REDIMIDOS, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN 1 ELSE 0 END) * 100 / count(*) as PER_REDIMIDOS, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN VAL_IMPORTE ELSE 0 END) AS IMPORTE_REDIMIDO, 
    case WHEN current_date > vale_campana_vca.vca_fec_caducidad THEN 'SI' ELSE 'NO' END AS FINALIZADO, 
    SUM(CASE WHEN VAL_ESTADO = '0' THEN 1 ELSE 0 END) AS PENDIENTES, 
    SUM(CASE WHEN VAL_ESTADO = '0' THEN 1 ELSE 0 END) * 100 / count(*) as PER_PENDIENTES, 
    SUM(CASE WHEN VAL_ESTADO = '0' THEN VAL_IMPORTE ELSE 0 END) AS IMPORTE_PENDIENTE 
from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    -- quitamos la relación con movimientos que estaba provocando duplicidad 
    -- left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    -- and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD') 
    -- left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    -- left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
    -- left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    -- and (mov_anulado=0 or mov_anulado is null) and (mov_id_anulado=0 or mov_id_anulado is null) 
    and (val_estado <> 2) 
group by vale_campana_vca.vca_id, vale_campana_vca.vca_nombre_camp, vale_campana_vca.vca_cuenta 

-- Comprobación:
-- xcheck. vca_id=805, 20.000 vales
