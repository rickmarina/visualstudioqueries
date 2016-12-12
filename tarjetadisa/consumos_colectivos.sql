

select 
to_char(movimiento_mov.mov_fecha,'YYYYMM') as mes,
colectivo_col.col_nemo        as cl_colectivo, 
        colectivo_col.col_descripcion as colectivo, 
        des_descripcion as descuento,
       -- SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.mde_importe_descuento * - 1       ELSE movimiento_detalle_mde.cantidad END)      AS TotalDescuento
        SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN movimiento_detalle_mde.cantidad * - 1       ELSE movimiento_detalle_mde.cantidad END)      AS TotalDeLitros, 
        SUM(CASE WHEN movimiento_mov.top_val in ('D','DB') THEN (movimiento_detalle_mde.precio_total ) * -1 ELSE movimiento_detalle_mde.precio_total  END) AS TotalImporte 
from movimiento_mov 
        inner join movimiento_detalle_mde on movimiento_detalle_mde.mov_id=movimiento_mov.mov_id 
       
        inner join cliente_cli on cliente_cli.cli_id_ext=movimiento_mov.cli_id_ext  
        left join colectivo_col on cliente_cli.col_id=colectivo_col.col_id 
        LEFT OUTER JOIN descuento_des          ON descuento_des.DES_ID = movimiento_detalle_mde.DES_ID 
where movimiento_mov.top_val in ('V','D','B','DB') AND MOV_ANULADO = 0 
        and  (movimiento_mov.mov_fecha >= '1/1/2015 00:00:00') 
        and col_nemo 
in ('TELTAX','TLANZA','TMONTE','TPTORI','TSMATE','VETAXI','BUENAV','COLECT','ETAXLA','GONHER','TABCOG','TACOTE','TAGUIA','TAGUIM','TAICOD','TAISOR','TAMOJA','TASABA','TAXCHI','TAXCOR','TAXGRA','TAXGUI','TAXIAR','TAXICA','TAXICO','TAXIGI','TAXIGU','TAXIJA','TAXILA','TAXILP','TAXIMA','TAXIMI','TAXING','TAXIOL','TAXIPA','TAXIRE','TAXIRO','TAXISC','TAXITA','TAXITE','TAXIVE','TAXOLI','TAXORO','TAXTER','TAXURS','CTAXSC','TAXSUR','CTAXCA','DRIVER','TAXARM','TAXSAN')
group by to_char(movimiento_mov.mov_fecha,'YYYYMM'), des_descripcion, colectivo_col.col_nemo , colectivo_col.col_descripcion 
order by 1,2;