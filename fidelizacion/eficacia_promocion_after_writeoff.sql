/* Resultado promociones de ficheros Writeoff */

/*
delete from [dbo].[ZZZ_SCS_EMAIL]

delete from [dbo].[ZZZ_SCS_SMS]

delete from [dbo].[ZZZ_tcd_EMAIL]

delete from [dbo].[ZZZ_TCD_SMS]

*/

select count(*) as scs_email from ZZZ_SCS_EMAIL
select count(*) as scs_sms from ZZZ_SCS_SMS

select count(*) as tcd_email from ZZZ_tcd_EMAIL
select count(*) as tcd_sms from ZZZ_TCD_SMS

/* eficacia email, movil scbsma */ --435
declare @fecha as nvarchar(50)

set @fecha = '20180606'

select count(*) as scs_email, (select count(*) as scs_email from ZZZ_SCS_EMAIL) as total
from [dbo].[ZZZ_SCS_EMAIL]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_SCS_EMAIL].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

select count(*) as scs_sms, (select count(*) as scs_sms from ZZZ_SCS_SMS) as total
from [dbo].[ZZZ_SCS_SMS]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_SCS_SMS].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

/* eficacia email, movil tcd */
select count(*) as tcd_email, (select count(*) as tcd_email from ZZZ_tcd_EMAIL) as total
from [dbo].[ZZZ_tcd_EMAIL]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_tcd_EMAIL].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha

select count(*) as tcd_movil, (select count(*) as tcd_sms from ZZZ_TCD_SMS) as total
from [dbo].[ZZZ_tcd_SMS]
inner join tcf42 on tcf42.ID_CUENTA = [ZZZ_tcd_SMS].id_cuenta collate SQL_Latin1_General_CP1_CI_AI
where tcf42.fecha_ult_oper >= @fecha