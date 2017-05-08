
/*
 * WriteOff Detalle ClubSmart (con email sin blacklist)
 */
USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA, tcf41.cl_tarjeta, TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2,   
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,  
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB  
FROM         TCF42 INNER JOIN 
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE 
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null)  
AND (TCF40.FECH_ALTA <= @fecha) 
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,6) = '700421')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
-- Clientes con email
and (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegraemail) 

/*
 * WriteOff Detalle ClubSmart (con movil sin blacklist)
 */
USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA,  tcf41.cl_tarjeta,TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2,   
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,  
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB  
FROM         TCF42 INNER JOIN 
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE 
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null)  
AND (TCF40.FECH_ALTA <= @fecha) 
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,6) = '700421')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
--Clientes con movil sin email
and len(tcf40.tel_movil)>0  and not (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegrasms) 


/*
 * WriteOff Detalle ClubSmart (sin email sin movil sin blacklist)
 */

USE CF_DISA

declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA,  tcf41.cl_tarjeta,TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2,   
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,  
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB  
FROM         TCF42 INNER JOIN 
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE 
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null)  
AND (TCF40.FECH_ALTA <= @fecha) 
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,6) = '700421')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
--Clientes con movil sin email
and len(tcf40.tel_movil)=0  and not (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegrasms) 



/*
 * WriteOff Detalle TCD (con email sin blacklist)
 */
USE CF_DISA
declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA,  tcf41.cl_tarjeta,TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2, 
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB
FROM         TCF42 INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente					  
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null) 
AND (TCF40.FECH_ALTA <= @fecha)
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,9) = '972400077')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
-- Clientes con email
and (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegraemail) 


/*
 * WriteOff Detalle TCD (con movil sin blacklist)
 */

USE CF_DISA
declare @fecha as nvarchar(8)
select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA,  tcf41.cl_tarjeta,TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2, 
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB
FROM         TCF42 INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente					  
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null) 
AND (TCF40.FECH_ALTA <= @fecha)
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,9) = '972400077')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
--Clientes con movil sin email
and len(tcf40.tel_movil)>0  and not (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegrasms) 

/*
 * WriteOff Detalle TCD (con postal sin blacklist)
 */

USE CF_DISA
declare @fecha as nvarchar(8)

select @fecha = CAST(YEAR(GETDATE())-1 AS NVARCHAR(10)) + RIGHT('00' + CAST(MONTH(GETDATE()) AS NVARCHAR(10)), 2) + RIGHT('00' + CAST(DAY(GETDATE()) AS NVARCHAR(10)), 2)

SELECT     TCF42.CL_CLIENTE, TCF42.ID_CUENTA,  tcf41.cl_tarjeta,TCF42.SALDO_PUNTOS, TCF40.NOMBRE, TCF40.APELLIDO1, TCF40.APELLIDO2, 
TCF40.DOCID, TCF40.EMAIL, TCF40.TEL_MOVIL,
                      TCF42.FECHA_ULT_OPER, TCF40.FECH_ALTA, TCF40.CL_CENTRO_HAB
FROM         TCF42 INNER JOIN
                      TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE
					  inner join tcf41 on tcf41.id_cuenta = tcf42.id_cuenta and tcf41.cl_cliente = tcf42.cl_cliente					  
WHERE    (TCF42.FECHA_ULT_OPER < @fecha or tcf42.fecha_ult_oper = '' or tcf42.fecha_ult_oper is null) 
AND (TCF40.FECH_ALTA <= @fecha)
AND (TCF42.TIPO_CUENTA = 'FI') 
AND (TCF42.SALDO_PUNTOS > 0) 
and (left(tcf41.cl_tarjeta,9) = '972400077')
and (tcf42.estado = 1) 
and (Tcf41.estado in (1,2))
--Clientes sin movil sin email
and len(tcf40.tel_movil)=0  and not (tcf40.email like '%@%.%')  
and tcf40.cl_cliente COLLATE Modern_Spanish_CI_AS not in (select cl_cliente from [Clubsmart].[dbo].listanegracorreopostal) 
