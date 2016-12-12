/* Script Daemon Quest 
      Periodo de extracción: Del 1 de octubre de 2014 al 31 de octubre de 2016
      Sacamos tabla clientes que hayan tenido activa alguna tarjeta de TCD. 
      Sacamos el transaccional filtrado por tarjetas TCD últimos 24 meses.
      En cuanto a la tabla de desglose de puntos, ya que no filtra por tarjeta ni cliente,
      deberíamos sacar los dos últimos años directamente.
*/

--clientes (aprox 94k)
select *
from tcf40 
where cl_cliente in (
select distinct CL_CLIENTE from tcf41 
where left(cl_tarjeta,9) = '972400077'
and nombre_usu <> 'DATOS NO CARGADOS'
)


-- transacciones cabecera TCD
select * from tcf14fi 
where left(cl_tarjeta,9) = '972400077'
and tcf14fi.fecha >= '20141001' and tcf14fi.fecha <= '20161031' and E_OPERACION = 'R'
union
select 
[CL_EMPRESA]      ,[C_VENTA]      ,[P_VENTA]      ,[N_VENTA]      ,[CL_OPERADOR]      ,[T_OPERACION]
      ,[T_AUTORIZACION]      ,[E_OPERACION]      ,[FECHA]      ,[HORA]      ,[T_SOPORTE]      ,[F_CAPTURA]
      ,[ID_CUENTA]      ,[CL_CLIENTE]      ,[CL_TARJETA]      ,[MEDIO_PAGO]      ,[IMPORTE]
      ,[MONEDA]      ,[CL_EMPRESA_DOC]      ,[CL_DOCUMENTO]      ,[C_RESULTADO]      ,[NUM_AUT]
      ,[N_REFERENCIA]      ,[FECH_CAD]      ,[CL_CA]      ,[TIEMPO_RESPUESTA]      ,[COD_RES_CA]      ,[C_VENTA_ORI]
      ,[P_VENTA_ORI]      ,[N_VENTA_ORI]      ,[FECHA_ORI]      ,[N_REF_CLI]      ,[SALDO_PREV]      ,[SALDO_POST]
      ,[CL_CAMPA]      ,[CL_CAMPA_EXT]      ,[ACTIV_TARJETA]      ,[CUMPLE_CLIENTE]      ,[MOTIVO_ANUL]
      ,[BVENIDA_CLIENTE]      ,[PARTIC_CLIENTE]      ,[CL_SORTEO]      ,[IMPORTE_FIDEL]      ,[DESCUENTO]
      ,[NUM_PART_SORTEO]      ,[FECHA_PROCESO]      ,[HORA_PROCESO]      ,[TIPO_ACUM]      ,[SALDO_POST_DTO]
      ,[VALE_DESCUENTO]      ,[PROMOCION]      ,[PUNTOS_PROMO]      ,[ID_CUENTA_RECEP]
from cf_disa_hist.dbo.tcf16fi_h
where left(cl_tarjeta,9) = '972400077'
and cf_disa_hist.dbo.tcf16fi_h.fecha >= '20141001' and cf_disa_hist.dbo.tcf16fi_h.fecha <= '20161031' and E_OPERACION = 'R'


--transacciones desglose de puntos 
select * from tcf67 
where tcf67.fecha >= '20141001' and tcf67.fecha <= '20161031'
union
select * from cf_disa_hist.dbo.tcf67_h
where cf_disa_hist.dbo.tcf67_h.fecha >= '20141001' and cf_disa_hist.dbo.tcf67_h.fecha <= '20161031'


--Script Daemon Quest BCP 20161128 

sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Clientes" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\clientes.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_TransaccionesFI" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Transacciones_Desglose" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones_desglose.dat"

pause
