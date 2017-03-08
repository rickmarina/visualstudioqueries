SELECT to_char(movimiento_mov.mov_fecha,'YYYYMMDD') AS FECHA,         
right(comercio_com.com_id_ext,4) AS codestacion, comercio_com.nombre AS estacion,          
productos_bandera_pba.prg_descripcion      AS articulo,           
SUM(CASE WHEN movimiento_mov.top_val in ('DB') THEN movimiento_detalle_mde.cantidad * - 1     ELSE movimiento_detalle_mde.cantidad END)      AS LITROS,
SUM(CASE WHEN movimiento_mov.top_val in ('DB') THEN movimiento_detalle_mde.precio_total * - 1 ELSE movimiento_detalle_mde.precio_total END)  AS IMPORTE,
provincia_prov.prov_nombre AS provincia,          
cliente_cli.cli_id_ext AS codcliente,         
CASE WHEN (cli_razon_social IS NULL ) THEN concat(CASE WHEN cli_apellido1 IS NULL THEN '' ELSE concat(cli_apellido1 , ' ') END ,
CASE WHEN cli_apellido2 IS NULL THEN '' ELSE concat(cli_apellido2 , ' ') END ,                          
CASE WHEN cli_nombre    IS NULL THEN '' ELSE cli_nombre END)             ELSE cli_razon_social END AS CLIENTE 
FROM movimiento_mov        
INNER JOIN movimiento_detalle_mde ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id       
INNER JOIN cliente_cli            ON cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext       
INNER JOIN producto_pro           ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext       
INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext      
INNER JOIN productos_bandera_pba ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code      
LEFT OUTER JOIN provincia_prov         ON provincia_prov.prov_id = comercio_com.prov_id 
where LEFT(right(comercio_com.com_id_ext,4), 1) IN ('1', '4')       
AND left(movimiento_mov.mov_pan  ,3) = '772'       
and movimiento_mov.top_val in ('B','DB')       
AND MOV_ANULADO = 0  AND  (right(comercio_com.com_id_ext,4) = '4089')  
AND  (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') >= '20170301')  
and  (to_char(movimiento_detalle_mde.mov_fecha,'YYYYMMDD') >= '20170301')  
AND  (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') <= '20170302')  
and  (to_char(movimiento_detalle_mde.mov_fecha,'YYYYMMDD') <= '20170302') 
GROUP BY right(comercio_com.com_id_ext,4), comercio_com.nombre, 
to_char(movimiento_mov.mov_fecha,'YYYYMMDD'), productos_bandera_pba.prg_descripcion 
,provincia_prov.prov_nombre, cliente_cli.cli_id_ext, 9  
ORDER BY comercio_com.nombre, 1 DESC, productos_bandera_pba.prg_descripcion  
and  (movimiento_mov.mov_fecha between '2016-01-01'::date and '2017-03-02'::date)
and  (movimiento_detalle_mde.mov_fecha between '2016-01-01'::date and '2017-03-02'::date)
query.append(" and  (movimiento_mov.mov_fecha between '"+fechaI+"'::date and '"+fechaF+"'::date) ");
query.append(" and  (movimiento_detalle_mde.mov_fecha between '"+fechaI+"'::date and '"+fechaF+"'::date) ");