

/* Shell ClubSmart */
select zzzscs.*, tcf42.FECHA_ULT_OPER,
case when tcf42.FECHA_ULT_OPER >= '20170109' then 'SI' else 'NO' end as operado
from [dbo].[ZZZ_ActividadNuevosClientes_SCS] as zzzscs
inner join tcf42 on tcf42.CL_CLIENTE = zzzscs.cl_cliente

update [ZZZ_ActividadNuevosClientes_SCS]
set operado = (case when tcf42.FECHA_ULT_OPER >= '20170109' then 1 else 0 end)
from [ZZZ_ActividadNuevosClientes_SCS]
inner join tcf42 on tcf42.CL_CLIENTE = [ZZZ_ActividadNuevosClientes_SCS].cl_cliente

select * from [ZZZ_ActividadNuevosClientes_SCS]


/* TCD */
select * from [dbo].[ZZZ_ActividadNuevosClientes_TCD]
where operado = 1

select zzzscs.*, tcf42.FECHA_ULT_OPER,
case when tcf42.FECHA_ULT_OPER >= '20170109' then 'SI' else 'NO' end as operado
from [dbo].[ZZZ_ActividadNuevosClientes_TCD] as zzzscs
inner join tcf42 on tcf42.CL_CLIENTE = zzzscs.cl_cliente


update [ZZZ_ActividadNuevosClientes_TCD]
set operado = (case when tcf42.FECHA_ULT_OPER >= '20170109' then 1 else 0 end)
from [ZZZ_ActividadNuevosClientes_TCD]
inner join tcf42 on tcf42.CL_CLIENTE = [ZZZ_ActividadNuevosClientes_TCD].cl_cliente



/* Resultados finales */
select cl_cliente, cl_tarjeta, nombre, apellido1, apellido2, email, movil,
case when operado = 1 then 'SI' else 'NO' end as operado
from [dbo].[ZZZ_ActividadNuevosClientes_SCS] as zzzscs

select cl_cliente, cl_tarjeta, nombre, apellido1, apellido2, email, movil,
case when operado = 1 then 'SI' else 'NO' end as operado
from [dbo].[ZZZ_ActividadNuevosClientes_TCD] as zzztcd







