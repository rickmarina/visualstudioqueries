/* Resultado promociones de ficheros Writeoff */

/*
delete from [dbo].[ZZZ_SCS_EMAIL]

delete from [dbo].[ZZZ_SCS_SMS]

delete from [dbo].[ZZZ_tcd_EMAIL]

delete from [dbo].[ZZZ_TCD_SMS]

*/

/* eficacia email, movil scbsma */ --435
declare @fecha as nvarchar(50)

set @fecha = '20160801'

select count(*) as scs_email
from [dbo].[ZZZ_SCS_EMAIL]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_SCS_EMAIL].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

select count(*) as scs_sms
from [dbo].[ZZZ_SCS_SMS]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_SCS_SMS].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

/* eficacia email, movil tcd */
select count(*) as tcd_email
from [dbo].[ZZZ_tcd_EMAIL]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_tcd_EMAIL].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

select count(*) as tcd_movil
from [dbo].[ZZZ_tcd_SMS]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_tcd_SMS].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha