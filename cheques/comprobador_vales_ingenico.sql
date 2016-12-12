/* Comprobador de vales INGENICO */

select VCA_NOMBRE_CAMP as nombrecamp, 
case when vale_campana_vca.aux_idcamp <> '' then vale_campana_vca.aux_idcamp else vale_campana_vca.vca_id::char(50) end as tirada, 
VAL_IMPORTE as IMPORTE, 
VAL_ESTADO as ESTADO, 
to_char(VCA_FEC_CADUCIDAD,'DD/MM/YYYY') as FECHA_CADUC, 
vale_val.val_id as VALE, 
movimiento_mov.top_val as top_val, 
to_char(movimiento_mov.mov_fecha,'DD/MM/YYYY') as FECHA_COBRO, 
to_char(movimiento_mov.mov_fecha,'HH24:MI:SS') as HORA_COBRO, 
right(movimiento_mov.com_id_ext,4) as COD, 
dco_cod_ers as codeuroshell, 
left(movimiento_mov.com_id_ext,8) as EMPRESA, 
comercio_com.nombre as ESTACION, 
mov_anulado, vale_val.mov_id as valemov_id 
from VALE_CAMPANA_VCA 
inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
left outer join comercio_com on comercio_com.com_id_ext= movimiento_mov.com_id_ext  
left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
WHERE vale_val.val_id = '768821121700200090' 
and (mov_anulado=0 or mov_anulado is null) and (mov_id_anulado=0 or mov_id_anulado is null) 

--768821121700200090 pendiente
--430730121600999948 bloqueado


select VCA_NOMBRE_CAMP as nombrecamp, 
case when vale_campana_vca.aux_idcamp <> '' then vale_campana_vca.aux_idcamp else vale_campana_vca.vca_id::char(50) end as tirada, 
VAL_IMPORTE as IMPORTE, 
VAL_ESTADO as ESTADO, 
to_char(VCA_FEC_CADUCIDAD,'DD/MM/YYYY') as FECHA_CADUC, 
vale_val.val_id as VALE, 
movimiento_mov.top_val as top_val, 
to_char(movimiento_mov.mov_fecha,'DD/MM/YYYY') as FECHA_COBRO, 
to_char(movimiento_mov.mov_fecha,'HH24:MI:SS') as HORA_COBRO, 
right(movimiento_mov.com_id_ext,4) as COD, 
dco_cod_ers as codeuroshell, 
left(movimiento_mov.com_id_ext,8) as EMPRESA, 
comercio_com.nombre as ESTACION, 
mov_anulado, vale_val.mov_id as valemov_id 
from VALE_CAMPANA_VCA 
inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
left outer join comercio_com on comercio_com.com_id_ext= movimiento_mov.com_id_ext  
left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
WHERE vale_val.val_id = '430730121600999948' 
and (mov_anulado=0 or mov_anulado is null)


