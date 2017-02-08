SELECT distinct tarjeta_crd.crd_matricula                    AS MATRICULA 
FROM movimiento_mov        
--INNER JOIN movimiento_detalle_mde ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id       
INNER JOIN cliente_cli            ON cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext       
--INNER JOIN producto_pro           ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext       
INNER JOIN tarjeta_crd            ON tarjeta_crd.crd_pan=movimiento_mov.mov_pan       
--INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext      
--INNER JOIN productos_bandera_pba ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code      
--LEFT OUTER JOIN provincia_prov         ON provincia_prov.prov_id = comercio_com.prov_id      
--LEFT OUTER JOIN descuento_des          ON descuento_des.DES_ID = movimiento_detalle_mde.DES_ID 
where movimiento_mov.top_val IN ('V','D')       
and mov_anulado=0       
and (movimiento_mov.mov_fecha BETWEEN '1-1-2017' and '31-1-2017')       
--and (movimiento_detalle_mde.mov_fecha BETWEEN '1-1-2017' and '31-1-2017')       
and cliente_cli.cli_id_ext IN   ('4000001002')  
order by tarjeta_crd.crd_matricula  