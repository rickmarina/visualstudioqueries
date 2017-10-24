-- Shell ClubSmart
select count(*),
sum(case when (2017 - sq1.anyo) < 18 then 1 else 0 end) as '-18',
sum(case when (2017 - sq1.anyo) between 18 and 24 then 1 else 0 end) as '18_24',
sum(case when (2017 - sq1.anyo) between 25 and 34 then 1 else 0 end) as '25_34',
sum(case when (2017 - sq1.anyo) between 35 and 60 then 1 else 0 end) as '35_60',
sum(case when (2017 - sq1.anyo) > 60 then 1 else 0 end) as '+60'
from (
select distinct trx.cl_cliente, left(tcf40.fech_nac,4) as anyo
from TodasTrxClubSmart_Micro as trx
inner join tcf40 on tcf40.CL_CLIENTE = trx.CL_CLIENTE
inner join tcf42 on tcf42.CL_CLIENTE = trx.CL_CLIENTE
where 
tcf40.FECH_NAC is not null and tcf40.FECH_NAC <> '' and left(tcf40.fech_nac,4) <> '1900'
and FECHA between '20160101' and '20161231'
and tcf42.SALDO_PUNTOS > 0
) as sq1


-- Tu Club DISA
select count(*),
sum(case when (2017 - sq1.anyo) < 18 then 1 else 0 end) as '-18',
sum(case when (2017 - sq1.anyo) between 18 and 24 then 1 else 0 end) as '18_24',
sum(case when (2017 - sq1.anyo) between 25 and 34 then 1 else 0 end) as '25_34',
sum(case when (2017 - sq1.anyo) between 35 and 60 then 1 else 0 end) as '35_60',
sum(case when (2017 - sq1.anyo) > 60 then 1 else 0 end) as '+60'
from (
select distinct trx.cl_cliente, left(tcf40.fech_nac,4) as anyo
from TodasTrxTuClubDISA_Micro as trx
inner join tcf40 on tcf40.CL_CLIENTE = trx.CL_CLIENTE
inner join tcf42 on tcf42.CL_CLIENTE = trx.CL_CLIENTE
where 
tcf40.FECH_NAC is not null and tcf40.FECH_NAC <> '' and left(tcf40.fech_nac,4) <> '1900'
and FECHA between '20160101' and '20161231'
and tcf42.SALDO_PUNTOS > 0
) as sq1


