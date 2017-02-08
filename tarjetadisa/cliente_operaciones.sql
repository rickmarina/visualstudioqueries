SELECT to_char(movimiento_mov.mov_fecha,'YYYYMMDD') AS FECHA,         
to_char(movimiento_mov.mov_fecha,'HH24MISS') AS HORA,         
movimiento_mov.acc_id_ext                    AS ID_CUENTA,         
cliente_cli.cli_id_ext                       AS CL_CLIENTE,         
movimiento_mov.mov_pan                       AS CL_TARJETA,         
productos_bandera_pba.prg_descripcion        AS DARTI,           
movimiento_mov.mov_id,        movimiento_mov.mov_fecha,        
CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.cantidad * - 1  ELSE movimiento_detalle_mde.cantidad END AS UNIDADES_calc,
CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.precio_unitario * - 1 ELSE movimiento_detalle_mde.precio_unitario END AS PRECIOUNIDAD_calc,
CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.precio_total * - 1 ELSE movimiento_detalle_mde.precio_total END AS IMPORTE_calc,
CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.mde_descuento_aplicado * - 1 ELSE movimiento_detalle_mde.mde_descuento_aplicado END  AS DESCUENTO_calc,          
CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.mde_importe_descuento * - 1  ELSE movimiento_detalle_mde.mde_importe_descuento END  AS IMPORTE_DESC_calc,
descuento_des.des_modo           AS MODO_DESC,
descuento_des.des_id_code        AS CL_DESCUENTO,
descuento_des.des_valor          AS PORCENTAJE_DESC,
tarjeta_crd.crd_matricula        AS MATRICULA,
tarjeta_crd.crd_nomb_usu         AS DATO_ADICIONAL,
movimiento_mov.mov_kilometros    AS KILOMETROS,
cliente_cli.cli_nombre           AS NOMBRE,cliente_cli.cli_apellido1 AS APELLIDO1,cliente_cli.cli_apellido2 AS APELLIDO2,
cliente_cli.cli_numero_documento AS DOCID,cliente_cli.cli_razon_social AS RAZON_SOCIAL,
comercio_com.nombre              AS ESTACION_NOMBRE,provincia_prov.prov_nombre AS ESTACION_LOCALIDAD,
comercio_com.cod_postal          AS ESTACION_CP,right(comercio_com.com_id_ext,4) AS ESTACION_CL_CENTRO 
FROM movimiento_mov        
INNER JOIN movimiento_detalle_mde ON movimiento_mov.mov_id=movimiento_detalle_mde.mov_id       
INNER JOIN cliente_cli            ON cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext       
INNER JOIN producto_pro           ON producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext       
INNER JOIN tarjeta_crd            ON tarjeta_crd.crd_pan=movimiento_mov.mov_pan       
INNER JOIN comercio_com           ON comercio_com.com_id_ext=movimiento_mov.com_id_ext      
INNER JOIN productos_bandera_pba  ON productos_bandera_pba.pro_id = producto_pro.pro_id and productos_bandera_pba.bnd_code = comercio_com.bnd_code      
LEFT OUTER JOIN provincia_prov    ON provincia_prov.prov_id = comercio_com.prov_id      
LEFT OUTER JOIN descuento_des     ON descuento_des.DES_ID = movimiento_detalle_mde.DES_ID 
where movimiento_mov.top_val IN ('V','D','B','DB') 
and mov_anulado=0       
and (movimiento_mov.mov_fecha BETWEEN ? and ?)       
and (movimiento_detalle_mde.mov_fecha BETWEEN ? and ?)  
and cliente_cli.cli_id_ext = ?  
  