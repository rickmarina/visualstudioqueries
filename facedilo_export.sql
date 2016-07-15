
select cct_fdatope as fechaApertura, 
tct_ticket.tct_fdatclo as fechaCierre,
cus_customer.cus_dname as instalacion,
act_acttyp.act_ddescription as accion,
acs_subtyp.acs_ddescription as subtipoaccion,
cau_cause.cau_dDescription as conductor,
dec_detcau.dec_dDescription as contratista,
case tct_ticket.tct_xresyesno 
	when '0' then 'Open'
	when '1' then 'Closed'
end as Resuelto,
tcu_ticcom.tcu_dcomment as comentarios
from cct_cuscon
inner join cus_customer on cus_customer.cus_ccode = cct_cuscon.cct_ccuscod
inner join tct_ticket   on tct_ticket.cct_nnumber = cct_cuscon.cct_nnumber 
inner join act_acttyp   on act_acttyp.act_ccode = tct_ticket.act_ccode
inner join acs_subtyp   on acs_subtyp.acs_ccode = tct_ticket.acs_ccode
inner join cau_cause    on cau_cause.cau_ccode = tct_ticket.cau_ccode
inner join dec_detcau   on dec_detcau.dec_cCode = tct_ticket.dec_ccode
inner join tcu_ticcom   on tcu_ticcom.cct_nnumber = tct_ticket.cct_nnumber
where cct_fdatope >= '2016-05-01'
order by 1 desc