SELECT to_char(movimiento_mov.mov_fecha,'YYYYMMDD') AS FECHA,  
        cliente_cli.cli_id_ext                       AS codcliente,  
        CASE WHEN (cli_razon_social IS NULL ) 
            THEN concat(CASE WHEN cli_apellido1 IS NULL THEN '' ELSE concat(cli_apellido1 , ' ') END ,  
                        CASE WHEN cli_apellido2 IS NULL THEN '' ELSE concat(cli_apellido2 , ' ') END ,  
                        CASE WHEN cli_nombre    IS NULL THEN '' ELSE cli_nombre END) 
            ELSE cli_razon_social END AS CLIENTE, 
        productos_bandera_pba.prg_descripcion  AS articulo,    
        SUM(CASE WHEN movimiento_mov.top_val in ('D') THEN movimiento_detalle_mde.cantidad * - 1     ELSE movimiento_detalle_mde.cantidad END)      AS LITROS,  
        SUM(CASE WHEN movimiento_mov.top_val in ('D') THEN movimiento_detalle_mde.precio_total * - 1 ELSE movimiento_detalle_mde.precio_total END)  AS IMPORTE,    
        provincia_prov.prov_nombre       AS provincia   
FROM movimiento_mov   
        INNER JOIN movimiento_detalle_mde ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id  
        INNER JOIN cliente_cli            ON cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext  
        INNER JOIN producto_pro           ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext  
        INNER JOIN tarjeta_crd            ON tarjeta_crd.crd_pan=movimiento_mov.mov_pan  
        INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext 
        INNER JOIN productos_bandera_pba ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code 
        LEFT OUTER JOIN provincia_prov         ON provincia_prov.prov_id = comercio_com.prov_id 
where movimiento_mov.top_val in ('V','D') AND MOV_ANULADO = 0 AND left(tarjeta_crd.crd_pan,3) = '972' 
AND  (cliente_cli.cli_id_ext = '2000008068')
AND  (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') >= '20160801'
AND (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') <= '20160831'
GROUP BY to_char(movimiento_mov.mov_fecha,'YYYYMMDD'), productos_bandera_pba.prg_descripcion, cliente_cli.cli_id_ext, 3, provincia_prov.prov_nombre