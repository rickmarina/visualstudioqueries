SELECT right(comercio_com.com_id_ext,4)         AS codestacion, 
		       comercio_com.nombre                      AS estacion,   
		       to_char(movimiento_mov.mov_fecha,'YYYY') AS ANYO,  
		       to_char(movimiento_mov.mov_fecha,'MM')   AS MES,  
		       productos_bandera_pba.prg_descripcion    AS articulo,    
		       SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.cantidad * - 1     ELSE movimiento_detalle_mde.cantidad END)      AS LITROS  
		FROM movimiento_mov   
		     INNER JOIN movimiento_detalle_mde ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id  
		     INNER JOIN producto_pro           ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext  
		     INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext 
		     INNER JOIN productos_bandera_pba ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code 
		where top_val IN ('V','D','B','DB') and mov_anulado=0 and LEFT(right(comercio_com.com_id_ext,4), 1) IN ('1', '4') 
		      and to_char(movimiento_mov.mov_fecha,'YYYYMMDD') >= '20150801' 
		      AND left(movimiento_mov.mov_pan,3) in ('972','772','882') 
		GROUP BY 4, 5, 1, 2, 3 