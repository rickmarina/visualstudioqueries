/* Litros clientes CREDITO */

select producto_pro.pro_id_ext as cod_producto, 
       productos_bandera_pba.prg_descripcion as producto, 
       CASE WHEN colectivo_col.col_nemo IS NULL THEN '------' ELSE colectivo_col.col_nemo END AS COD_COLECTIVO, 
       CASE WHEN colectivo_col.col_descripcion IS NULL THEN 'Sin colectivo' ELSE colectivo_col.col_descripcion END AS COLECTIVO, 
       SUM(CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.cantidad * - 1 ELSE movimiento_detalle_mde.cantidad END) AS LITROS, 
       SUM(CASE WHEN movimiento_mov.top_val = 'D' THEN (movimiento_detalle_mde.precio_total ) * -1 ELSE movimiento_detalle_mde.precio_total  END) AS IMPORTE 
from movimiento_mov 
     inner join movimiento_detalle_mde on movimiento_detalle_mde.mov_id=movimiento_mov.mov_id 
     inner join producto_pro on producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext 
     inner join cliente_cli on cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext 
     INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext 
     INNER JOIN productos_bandera_pba ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code 
     left join colectivo_col on cliente_cli.col_id=colectivo_col.col_id 
where  movimiento_mov.top_val in ('V','D') and mov_anulado=0 
      AND left(movimiento_mov.mov_pan,3) = '972' 
      and LEFT(right(comercio_com.com_id_ext,4), 1) IN ('1', '4') 
      and movimiento_mov.mov_fecha Between '2016-12-01'::date and '2016-12-31'::date
      and movimiento_detalle_mde.mov_fecha Between '2016-12-01'::date and '2016-12-31'::date
GROUP BY producto_pro.pro_id_ext, productos_bandera_pba.prg_descripcion, colectivo_col.col_nemo, colectivo_col.col_descripcion 
ORDER BY producto_pro.pro_id_ext, colectivo_col.col_nemo
