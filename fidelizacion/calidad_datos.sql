/* Calidad de datos - ClubSmart Clientes más de 2 años sin operar */

USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-2 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.ID_CUENTA, TCF42.CL_CLIENTE, TCF41.CL_TARJETA, TCF42.FECHA_ULT_OPER, TCF42.SALDO_PUNTOS, TCF40.NOMBRE, 
                      TCF40.APELLIDO1, TCF40.APELLIDO2, TCF40.DOCID, TCF40.CL_CENTRO_HAB
FROM         TCF42 INNER JOIN
                      TCF41 ON TCF42.ID_CUENTA = TCF41.ID_CUENTA AND TCF42.CL_CLIENTE = TCF41.CL_CLIENTE INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
WHERE     (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null) 
AND (TCF41.FECHA_ULT_OPER < @fecha or tcf41.fecha_ult_oper = '' or tcf41.fecha_ult_oper is null) 
AND (TCF40.FECH_ALTA <= @fecha) 
AND (LEFT(TCF41.CL_TARJETA, 6) = '700421') 
AND (TCF41.ESTADO IN ('1', '2')) 
AND (TCF42.ESTADO = '1')
AND (TCF40.NOMBRE IS NOT NULL)
ORDER BY TCF41.CL_TARJETA

/* Calidad de datos - TCD Clientes más de 2 años sin operar  */

USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-2 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.ID_CUENTA, TCF42.CL_CLIENTE, TCF41.CL_TARJETA, TCF42.FECHA_ULT_OPER, TCF42.SALDO_PUNTOS, TCF40.NOMBRE, 
                      TCF40.APELLIDO1, TCF40.APELLIDO2, TCF40.DOCID, TCF40.CL_CENTRO_HAB
FROM         TCF42 INNER JOIN
                      TCF41 ON TCF42.ID_CUENTA = TCF41.ID_CUENTA AND TCF42.CL_CLIENTE = TCF41.CL_CLIENTE INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
WHERE     (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null)  
AND (TCF41.FECHA_ULT_OPER < @fecha or tcf41.fecha_ult_oper = '' or tcf41.fecha_ult_oper is null) 
AND (TCF40.FECH_ALTA <= @fecha) 
AND (LEFT(TCF41.CL_TARJETA, 9) = '972400077') 
AND (TCF41.ESTADO IN ('1', '2')) 
AND (TCF42.ESTADO = '1')
AND (TCF40.NOMBRE IS NOT NULL)
ORDER BY TCF41.CL_TARJETA