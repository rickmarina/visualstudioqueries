SELECT to_char(movimiento_mov.mov_fecha,'YYYYMMDD') AS FECHA,  
       to_char(movimiento_mov.mov_fecha,'HH24MISS') AS HORA,  
       comercio_com.nombre                          AS ESTACION_NOMBRE,   
       productos_bandera_pba.prg_descripcion        AS DARTI,    
       movimiento_mov.mov_kilometros                AS KILOMETROS,   
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.cantidad * - 1               ELSE movimiento_detalle_mde.cantidad END               AS UNIDADES_calc,   
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.precio_unitario * - 1        ELSE movimiento_detalle_mde.precio_unitario END        AS PRECIOUNIDAD_calc,   
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.precio_total * - 1           ELSE movimiento_detalle_mde.precio_total END           AS IMPORTE_calc,    
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_descuento_aplicado * - 1 ELSE movimiento_detalle_mde.mde_descuento_aplicado END AS DESCUENTO_calc,   
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_importe_descuento * - 1  ELSE movimiento_detalle_mde.mde_importe_descuento END  AS IMPORTE_DESC_calc,   
       CASE WHEN movimiento_mov.top_val = 'D' THEN movimiento_detalle_mde.mde_precio_con_desc * - 1    ELSE movimiento_detalle_mde.mde_precio_con_desc END    AS PRECIO_CON_DTO_calc   
FROM movimiento_mov   
     INNER JOIN movimiento_detalle_mde      ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id  
     --INNER JOIN cliente_cli                 ON cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext  
     INNER JOIN producto_pro                ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext  
     INNER JOIN tarjeta_crd                 ON tarjeta_crd.crd_pan=movimiento_mov.mov_pan  
     INNER JOIN comercio_com                ON comercio_com.com_id_ext=movimiento_mov.com_id_ext 
     INNER JOIN productos_bandera_pba       ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code 
     --LEFT OUTER JOIN provincia_prov         ON provincia_prov.prov_id = comercio_com.prov_id 
     --LEFT OUTER JOIN descuento_des          ON descuento_des.DES_ID = movimiento_detalle_mde.DES_ID 
where movimiento_mov.top_val IN ('V','D') 
      and mov_anulado=0 
      and (movimiento_mov.mov_fecha BETWEEN '1-1-2017' and '7-1-2017') 
      and (movimiento_detalle_mde.mov_fecha BETWEEN '1-1-2017' and '7-1-2017') 
      --and cliente_cli.cli_id_ext IN  ('2000003022')
      and movimiento_mov.cli_id_ext IN  ('2000003022') 
      and trim(tarjeta_crd.crd_matricula) = '0912 DRJ' 
order by 1, 2, 3, 4 