/* Informe 5: Redenciones por año, importes mensuales. */

select sum(total) as total, anyo, mes from ( 
    select sum(VAL_IMPORTE) as total, 
    to_char(movimiento_mov.mov_fecha,'YYYY') as anyo,  
    to_char(movimiento_mov.mov_fecha,'MM') as mes 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
    left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    WHERE     (to_char(movimiento_mov.mov_fecha,'YYYY') = '2016') 
    and val_estado=1 and top_val = 'VV' 
    AND agrupacion_agr.agr_codigo " + WebUserControlSociedades.sqlSelectedTCF04() + @" 
    and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD')  
    and (mov_anulado=0 or mov_anulado is null) and (mov_id_anulado=0 or mov_id_anulado is null) 
    and (val_estado <> 2) 
    group by movimiento_mov.mov_fecha 
) as q1 
group by anyo, mes 
order by mes 