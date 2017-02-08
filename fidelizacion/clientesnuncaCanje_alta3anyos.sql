/* Clientes que nunca han realizado un canje 
   y llevan más de 3 años de alta en el programa CBSMA */

USE CF_DISA
declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-3 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)


/* 	QUERY 1 */

SELECT     
SUM(CASE WHEN TCF40.CL_CENTRO_HAB in ('1002','1080','1081','1083') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_CEUTA',
SUM(CASE WHEN TCF40.CL_CENTRO_HAB in ('1039','1040','1041','1042','1043','1044','1045') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_MELILLA',
SUM(CASE WHEN left(TCF40.CL_CENTRO_HAB,1) not in ('1','4') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_PENINSULA',
SUM(CASE WHEN left(TCF40.CL_CENTRO_HAB,1) in ('1','4') and TCF40.CL_CENTRO_HAB not in ('1002','1080','1081','1083','1039','1040','1041','1042','1043','1044','1045') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_CANARIAS',
SUM(CASE WHEN TCF40.CL_CENTRO_HAB is null OR TCF40.CL_CENTRO_HAB = '' THEN TCF42.SALDO_PUNTOS END) as 'PTOS_SINEESS_ASIGNADA'
FROM         TCF42 INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
		inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
WHERE    
(TCF40.FECH_ALTA < @fecha) 
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (LEFT(tcf41.cl_tarjeta,6) = '700421') 
AND (TCF42.SALDO_PUNTOS > 0) 
AND (TCF42.ID_CUENTA NOT IN
                          (SELECT     DISTINCT ID_CUENTA
                            FROM          TodosCanjesClubSmart
                            GROUP BY ID_CUENTA))
 and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))

 /*          TU CLUB DISA           */
 
 /* Clientes que nunca han realizado un canje 
   y llevan más de 3 años de alta en el programa TU CLUB DISA */



/* 	QUERY 2 */

SELECT     
SUM(CASE WHEN TCF40.CL_CENTRO_HAB in ('1002','1080','1081','1083') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_CEUTA',  
SUM(CASE WHEN TCF40.CL_CENTRO_HAB in ('1039','1040','1041','1042','1043','1044','1045') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_MELILLA', 
SUM(CASE WHEN left(TCF40.CL_CENTRO_HAB,1) not in ('1','4')  THEN TCF42.SALDO_PUNTOS END) as 'PTOS_PENINSULA', 
SUM(CASE WHEN left(TCF40.CL_CENTRO_HAB,1) in ('1','4') and TCF40.CL_CENTRO_HAB not in ('1002','1080','1081','1083','1039','1040','1041','1042','1043','1044','1045') THEN TCF42.SALDO_PUNTOS END) as 'PTOS_CANARIAS',
SUM(CASE WHEN TCF40.CL_CENTRO_HAB is null OR TCF40.CL_CENTRO_HAB = '' THEN TCF42.SALDO_PUNTOS END) as 'PTOS_SINEESS_ASIGNADA' 
FROM         TCF42 INNER JOIN 
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE 
			inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
WHERE    
(TCF40.FECH_ALTA < @fecha) 
AND (TCF42.TIPO_CUENTA = 'FI') 
AND left(tcf41.cl_tarjeta,9) = '972400077'
AND (TCF42.SALDO_PUNTOS > 0) 
AND (TCF42.ID_CUENTA NOT IN
                          (SELECT     DISTINCT ID_CUENTA
                            FROM          TodosCanjesTCD
                            GROUP BY ID_CUENTA))
							and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))