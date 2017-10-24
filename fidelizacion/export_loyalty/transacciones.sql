/* 
Tabla de transacciones de dos años del histórico (junio 2015 – junio 2017):
    - Enviaremos la tabla de transacciones y la tabla de transacciones detalle cuyos registros tenga la fecha dentro 
    del periodo indicado. 
*/

CREATE VIEW VW_LOY_Transacciones
AS
select 
[CL_EMPRESA]      ,[C_VENTA]      ,[P_VENTA]      ,[N_VENTA]      
      ,[CL_OPERADOR]      ,[T_OPERACION]
      ,[T_AUTORIZACION]      ,[E_OPERACION]      ,[FECHA]      ,[HORA]      
      ,[T_SOPORTE]      ,[F_CAPTURA]
      ,[ID_CUENTA]      ,[CL_CLIENTE]      ,[CL_TARJETA]      
      ,[MEDIO_PAGO]     ,[IMPORTE]      ,[MONEDA]      ,[CL_EMPRESA_DOC]      
      ,[CL_DOCUMENTO]      ,[C_RESULTADO]            ,[NUM_AUT]
      ,[N_REFERENCIA]      ,[FECH_CAD]      ,[CL_CA]      
      ,[TIEMPO_RESPUESTA]      ,[COD_RES_CA]      ,[C_VENTA_ORI]
      ,[P_VENTA_ORI]      ,[N_VENTA_ORI]      ,[FECHA_ORI]      
      ,[N_REF_CLI]      ,[SALDO_PREV]      ,[SALDO_POST]
      ,[CL_CAMPA]      ,[CL_CAMPA_EXT]      ,[ACTIV_TARJETA]      
      ,[CUMPLE_CLIENTE]      ,[MOTIVO_ANUL]
      ,[BVENIDA_CLIENTE]      ,[PARTIC_CLIENTE]      ,[CL_SORTEO]      
      ,[IMPORTE_FIDEL]      ,[DESCUENTO]
      ,[NUM_PART_SORTEO]      ,[FECHA_PROCESO]      ,[HORA_PROCESO]      
      ,[TIPO_ACUM]      ,[SALDO_POST_DTO]   
      ,[VALE_DESCUENTO]      ,[PROMOCION]      
      ,[PUNTOS_PROMO]      ,[ID_CUENTA_RECEP]
from cf_disa_hist.dbo.tcf16fi_h
where (cl_tarjeta like '700421%' or cl_tarjeta like '972400077%')
and cf_disa_hist.dbo.tcf16fi_h.fecha >= '20150601' 
and cf_disa_hist.dbo.tcf16fi_h.fecha <= '20170601' 
and E_OPERACION = 'R'