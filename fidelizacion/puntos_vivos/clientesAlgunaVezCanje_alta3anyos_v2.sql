/* Clientes que alguna vez han canjeado 
   pero que llevan más de 3 años sin canje CBSMA */
USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-3 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

/* 	QUERY 1 */

SELECT 
SUM(CASE WHEN CL_CENTRO_HAB in ('1002','1080','1081','1083') THEN SALDO_PUNTOS END) as 'PTOS_CEUTA',
SUM(CASE WHEN CL_CENTRO_HAB in ('1039','1040','1041','1042','1043','1044','1045') THEN SALDO_PUNTOS END) as 'PTOS_MELILLA',
SUM(CASE WHEN left(CL_CENTRO_HAB,1) not in ('1','4') THEN SALDO_PUNTOS END) as 'PTOS_PENINSULA',
SUM(CASE WHEN left(CL_CENTRO_HAB,1) in ('1','4') and CL_CENTRO_HAB not in ('1002','1080','1081','1083','1039','1040','1041','1042','1043','1044','1045') THEN SALDO_PUNTOS END) as 'PTOS_CANARIAS',
SUM(CASE WHEN CL_CENTRO_HAB is null OR CL_CENTRO_HAB = '' THEN SALDO_PUNTOS END) as 'PTOS_SINEESS_ASIGNADA'
FROM (
	SELECT     TCF42.ID_CUENTA, tcf42.FECHA_ULT_CANJEO AS ULT_CANJE,  
						  TCF42.SALDO_PUNTOS, TCF40.CL_CENTRO_HAB
	FROM       TCF42 INNER JOIN
						  TCF40 ON tcf42.CL_CLIENTE = TCF40.CL_CLIENTE
						  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
	WHERE (LEFT(tcf41.cl_tarjeta,6) = '700421')
	 and (tcf42.estado = 1) 
	and (Tcf41.estado in (1,2))
	GROUP BY TCF42.ID_CUENTA, tcf42.FECHA_ULT_CANJEO, TCF42.SALDO_PUNTOS, TCF40.CL_CENTRO_HAB
) AS Vquery
WHERE ULT_CANJE < @fecha 


/* Tu club DISA */

/* 	QUERY 2 */

SELECT 
SUM(CASE WHEN CL_CENTRO_HAB in ('1002','1080','1081','1083') THEN SALDO_PUNTOS END) as 'PTOS_CEUTA',
SUM(CASE WHEN CL_CENTRO_HAB in ('1039','1040','1041','1042','1043','1044','1045') THEN SALDO_PUNTOS END) as 'PTOS_MELILLA',
SUM(CASE WHEN left(CL_CENTRO_HAB,1) not in ('1','4') THEN SALDO_PUNTOS END) as 'PTOS_PENINSULA',
SUM(CASE WHEN left(CL_CENTRO_HAB,1) in ('1','4') and CL_CENTRO_HAB not in ('1002','1080','1081','1083','1039','1040','1041','1042','1043','1044','1045') THEN SALDO_PUNTOS END) as 'PTOS_CANARIAS',
SUM(CASE WHEN CL_CENTRO_HAB is null OR CL_CENTRO_HAB = '' THEN SALDO_PUNTOS END) as 'PTOS_SINEESS_ASIGNADA'
FROM (
    	SELECT     TCF42.ID_CUENTA, tcf42.FECHA_ULT_CANJEO AS ULT_CANJE,  
						  TCF42.SALDO_PUNTOS, TCF40.CL_CENTRO_HAB
	FROM       TCF42 INNER JOIN
						  TCF40 ON tcf42.CL_CLIENTE = TCF40.CL_CLIENTE
						  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
	WHERE left(tcf41.cl_tarjeta,9) = '972400077' 
	 and (tcf42.estado = 1) 
	and (Tcf41.estado in (1,2))
	GROUP BY TCF42.ID_CUENTA, tcf42.FECHA_ULT_CANJEO, TCF42.SALDO_PUNTOS, TCF40.CL_CENTRO_HAB

) AS Vquery
WHERE ULT_CANJE < @fecha 