queryIngenico.append(" SELECT to_char(movimiento_mov.mov_fecha,'YYYYMMDD') AS FECHA,   ");
queryIngenico.append("        to_char(movimiento_mov.mov_fecha,'HH24MISS') AS HORA,   ");
queryIngenico.append("        comercio_com.nombre                          AS ESTACION_NOMBRE,    ");
queryIngenico.append("        productos_bandera_pba.prg_descripcion        AS DARTI,     ");
queryIngenico.append("        movimiento_mov.mov_kilometros                AS KILOMETROS,    ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.cantidad * - 1               ELSE movimiento_detalle_mde.cantidad END               AS UNIDADES_calc,    ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.precio_unitario * - 1        ELSE movimiento_detalle_mde.precio_unitario END        AS PRECIOUNIDAD_calc,    ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.precio_total * - 1           ELSE movimiento_detalle_mde.precio_total END           AS IMPORTE_calc,     ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_descuento_aplicado * - 1 ELSE movimiento_detalle_mde.mde_descuento_aplicado END AS DESCUENTO_calc,    ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_importe_descuento * - 1  ELSE movimiento_detalle_mde.mde_importe_descuento END  AS IMPORTE_DESC_calc,    ");
queryIngenico.append("        CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_precio_con_desc * - 1    ELSE movimiento_detalle_mde.mde_precio_con_desc END    AS PRECIO_CON_DTO_calc    ");
queryIngenico.append(" FROM movimiento_mov    ");
queryIngenico.append("      INNER JOIN movimiento_detalle_mde      ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id   ");
queryIngenico.append("      INNER JOIN producto_pro                ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext   ");
queryIngenico.append("      INNER JOIN tarjeta_crd                 ON tarjeta_crd.crd_pan=movimiento_mov.mov_pan   ");
queryIngenico.append("      INNER JOIN comercio_com                ON comercio_com.com_id_ext=movimiento_mov.com_id_ext  ");
queryIngenico.append("      INNER JOIN productos_bandera_pba       ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code  ");
queryIngenico.append(" where movimiento_mov.top_val IN ('V','D')  ");
queryIngenico.append("       and mov_anulado=0  ");
queryIngenico.append("       and (movimiento_mov.mov_fecha BETWEEN '1-1-2017' and '7-1-2017')  ");
queryIngenico.append("       and (movimiento_detalle_mde.mov_fecha BETWEEN '1-1-2017' and '7-1-2017')  ");
queryIngenico.append("       and movimiento_mov.cli_id_ext IN  ('2000003022')  ");
queryIngenico.append("       and trim(tarjeta_crd.crd_matricula) = '0912 DRJ'  ");
queryIngenico.append(" order by 1, 2, 3, 4  ");