
/* INFORME 1: Comprobar 1o varios cheques */            
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
    mov_anulado 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    left outer join comercio_com on comercio_com.com_id_ext= movimiento_mov.com_id_ext  
    left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
    WHERE vale_val.val_id = '101502121600100070'             
    
/* INFORME 2: Redenciones por campaña */
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
    vale_campana_vca.vca_cuenta as cuenta 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
    WHERE     --vale_campana_vca.vca_id ='" + DropDownListCamapanas.SelectedValue + "' 
    --AND agrupacion_agr.agr_codigo " + WebUserControlSociedades.sqlSelectedTCF04());
    ORDER BY COD, FECHA_COBRO             


/* INFORME 3: Redenciones mensuales DETALLE */
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
    WHERE      mov_pan = '101502121600100070' 
    AND VAL_ESTADO=1 and top_val = 'VV' 
    and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD')
    ORDER BY COD, FECHA_COBRO 

/* INFORME 4: Redenciones por mes (agrupado por CIF) */ 
select COUNT(CHEQUE) AS CHEQUES, SUM(imp) As imp_total, cif, razon, agrupacion FROM ( 
    select distinct 
    vale_val.val_id as CHEQUE, 
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
    case when vale_campana_vca.aux_idcamp <> '' then vale_campana_vca.aux_idcamp else vale_campana_vca.vca_id::char(50) end as tirada, 
    vale_campana_vca.vca_nombre_camp as nombrecamp, 
    vale_campana_vca.vca_cuenta, 
    empresa_emp.emp_cif as cif, 
    comercio_com.bnd_code as bandera, 
    vale_campana_vca.vca_dinero as dinero, 
    empresa_emp.emp_descripcion as razon 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    left outer join detalle_comercio_dco on comercio_com.com_id = detalle_comercio_dco.com_id 
    left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
    left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    WHERE     (to_char(movimiento_mov.mov_fecha,'YYYYMMDD') BETWEEN '" + fechaI + @"' AND '" + fechaF + @"') 
    and val_estado=1 and top_val = 'VV' 
    and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD') 
    AND agrupacion_agr.agr_codigo " + WebUserControlSociedades.sqlSelectedTCF04() + " 
    and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD')
    ) as sq1 
    group by cif, razon, agrupacion 
order by cif 

/* INFORME 5: Redenciones por año (importes mensuales) */
select sum(total) as total, anyo, mes from ( 
    select sum(VAL_IMPORTE) as total, 
    to_char(movimiento_mov.mov_fecha,'YYYY') as anyo,  
    to_char(movimiento_mov.mov_fecha,'MM') as mes 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar) 
    left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
    left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    WHERE     (to_char(movimiento_mov.mov_fecha,'YYYY') = '"+anyo+@"') 
    and val_estado=1 and top_val = 'VV' 
    AND agrupacion_agr.agr_codigo " + WebUserControlSociedades.sqlSelectedTCF04() + @" 
    and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD')
    group by movimiento_mov.mov_fecha 
    ) as q1 
    group by anyo, mes 
order by mes            

/* INFORME GLOBAL: */
select vale_campana_vca.vca_id as tirada, 
    vale_campana_vca.vca_nombre_camp as nombrecamp, 
    vale_campana_vca.vca_cuenta as cuenta, 
    to_char(vale_campana_vca.vca_fec_creacion,'DD/MM/YYYY')  as fecha_emision, 
    to_char(vale_campana_vca.vca_fec_caducidad,'DD/MM/YYYY')  as fecha_cad, 
    min(vale_val.val_id) as CHEQUES_DESDE, 
    max(vale_val.val_id) as CHEQUES_HASTA, 
    count(vale_val.val_id) as TOTAL_CHEQS, 
    sum(VAL_IMPORTE) as TOTAL_IMPORTE, 
    sum(VAL_IMPORTE)/count(vale_val.val_id) as IMPORTE_MEDIO, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN 1 ELSE 0 END) AS REDIMIDOS, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN 1 ELSE 0 END) * 100 / count(*) as PER_REDIMIDOS, 
    SUM(CASE WHEN VAL_ESTADO = '1' THEN VAL_IMPORTE ELSE 0 END) AS IMPORTE_REDIMIDO, 
    case WHEN current_date > vale_campana_vca.vca_fec_caducidad THEN 'SI' ELSE 'NO' END AS FINALIZADO,
    SUM(CASE WHEN VAL_ESTADO = '0' THEN 1 ELSE 0 END) AS PENDIENTES, 
    SUM(CASE WHEN VAL_ESTADO = '0' THEN 1 ELSE 0 END) * 100 / count(*) as PER_PENDIENTES, 
    SUM(CASE WHEN VAL_ESTADO = '0' THEN VAL_IMPORTE ELSE 0 END) AS IMPORTE_PENDIENTE 
    from VALE_CAMPANA_VCA 
    inner join VALE_VAL on VALE_CAMPANA_VCA.VCA_ID = VALE_VAL.VCA_ID 
    left outer join movimiento_mov on movimiento_mov.mov_pan = cast(vale_val.val_id AS varchar)  and movimiento_mov.mov_id not in (select mov_id_anulado from movimiento_mov where top_val = 'VD') 
    left outer join comercio_com on comercio_com.com_id_ext=movimiento_mov.com_id_ext  
    left outer join empresa_emp on empresa_emp.emp_id = comercio_com.emp_id 
    left outer join agrupacion_agr on agrupacion_agr.agr_id = comercio_com.agr_id 
    group by vale_campana_vca.vca_id, vale_campana_vca.vca_nombre_camp, vale_campana_vca.vca_cuenta 