select colectivo_col.col_nemo        as cl_colectivo, 
       colectivo_col.col_descripcion as colectivo, 
       cliente_cli.cli_id_ext        as cliente, 
       cliente_cli.cli_nombre        as nombre, 
       cliente_cli.cli_apellido1     as apellido1, 
       cliente_cli.cli_apellido2     as apellido2, 
       cliente_cli.cli_razon_social  as razon_social, 
       SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.cantidad * - 1       ELSE movimiento_detalle_mde.cantidad END)      AS TotalDeLitros, 
       SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN (movimiento_detalle_mde.precio_total ) * -1 ELSE movimiento_detalle_mde.precio_total  END) AS TotalImporte 
from movimiento_mov 
     inner join movimiento_detalle_mde on movimiento_detalle_mde.mov_id=movimiento_mov.mov_id 
     inner join producto_pro on producto_pro.pro_id_ext=movimiento_detalle_mde.pro_id_ext 
     inner join cliente_cli on cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext 
     left join colectivo_col on cliente_cli.col_id=colectivo_col.col_id 
where movimiento_mov.top_val in ('V','D','B','DB') AND MOV_ANULADO = 0 
      and  (movimiento_mov.mov_fecha >= '" + fechaInicio + " 00:00:00') 
      and  (movimiento_mov.mov_fecha <= '" + fechaFin + " 23:59:59') 
 and  (to_char(movimiento_detalle_mde.mov_fecha,'YYYYMMDD') >= '" + fechaInicio + "') 
 and  (to_char(movimiento_detalle_mde.mov_fecha,'YYYYMMDD') <= '" + fechaFin + "') 
--if (tipoCliente.equals("0")) {
          AND left(movimiento_mov.mov_pan,3) = '972' 
/*} else if (tipoCliente.equals("1")) {
          AND left(movimiento_mov.mov_pan,3) = '772' 
} else if (tipoCliente.equals("2")) {
          AND left(movimiento_mov.mov_pan,9) = '882400051' 
}*/
--if (!StringUtils.isEmpty(clColectivo)) {
--      and (colectivo_col.col_id = "+clColectivo+") 
--}
group by cliente_cli.cli_id_ext , cliente_cli.cli_nombre , cliente_cli.cli_apellido1 , cliente_cli.cli_apellido2, 
cliente_cli.cli_razon_social, colectivo_col.col_nemo , colectivo_col.col_descripcion 
