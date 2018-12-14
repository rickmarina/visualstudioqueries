select  
mov_id as id_transaccion,  
mov_fecha as fecha,  
mov_num_ope, 
mov_importe as importe,  
tipo_operacion,  
mov_pan as cod_qr,  
mov_precio_unitario as precio_litro,  
producto_disa as codigo_producto,  
producto_pro.pro_descripcion as producto,  
mov_cantidad as litros,  
mov_descuento_total as descuento_dado,  
mov_comercio as codigo_estacion_disa,  
dco_cod_ers as cod_euroshell,  
left(bnd_code,5) as bandera_eess,  
nombre_comercio as estacion,
emp_cif as cif,
emp_descripcion as sociedad,
agr_codigo as agrupacion
from movimientos_lidl  
inner join comercio_com on movimientos_lidl.mov_comercio = comercio_com.com_id_ext 
inner join producto_pro on producto_pro.pro_id_ext::integer = movimientos_lidl.producto_disa 
inner join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
inner join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id
inner join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id
where 
mov_fecha::date = (current_date - interval '1 month')::date 
and mov_id not in (select mov_id_anulado from movimientos_lidl 
where mov_fecha::date = (current_date - interval '1 month')::date and tipo_operacion='A') 
order by mov_fecha 

/*

Subtract one month from the current month, then "truncate" that to the beginning of that date. As you don't want to include rows from "this" month, you also need to add a condition for that

SELECT *
FROM Conference 
WHERE date_start >= date_trunc('month', current_date - interval '1' month)
  and date_start < date_trunc('month', current_date)

  */