/* Informe 3 Ingenico: Redenciones mensuales DETALLE */

select vale_val.val_id as CHEQUE, 
            VAL_IMPORTE as IMP, 
            VAL_ESTADO as ESTADO, 
            movimiento_mov.top_val as top_val, 
            to_char(VCA_FEC_CADUCIDAD,'DD/MM/YYYY') as FECHA_CADUC,  
            to_char(movimiento_mov.mov_fecha,'DD/MM/YYYY') as FECHA_COBRO,  
            to_char(movimiento_mov.mov_fecha,'HH24:MI:SS') as HORA,  
            left(movimiento_mov.com_id_ext,8) as EMPRESA, 
            right(movimiento_mov.com_id_ext,4) as COD, 
            dco_cod_ers as codeuroshell, 
            comercio_com.nombre as ESTACION,  
            agrupacion_agr.agr_codigo as agrupacion, 
            movimiento_mov.mov_anulado, 
            case when vale_campana_vca.aux_idcamp <> '' then vale_campana_vca.aux_idcamp else vale_campana_vca.vca_id::char(50) end as tirada, 
            vale_campana_vca.vca_nombre_camp as nombrecamp, 
            vale_campana_vca.vca_cuenta as cuenta, 
            empresa_emp.emp_cif as cif, 
            comercio_com.bnd_code as bandera,
            vale_campana_vca.vca_dinero as dinero 
            from VALE_CAMPANA_VCA 
            inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
            left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
            left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
            left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
            left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
            left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
            WHERE     (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') BETWEEN '20161101' AND '20161130') 
            AND VAL_ESTADO=1 and top_val = 'VV' 
            and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD') 
           -- AND agrupacion_agr.agr_codigo "+ WebUserControlSociedades.sqlSelectedTCF04() + @" 
            and (mov_anulado=0 or mov_anulado is null) and (mov_id_anulado=0 or mov_id_anulado is null) 
            and (val_estado <> 2) 
            and (vale_val.val_id = '399281121600200019')
            ORDER BY COD, FECHA_COBRO 