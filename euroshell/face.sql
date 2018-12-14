select * from cus_cards
where pan_id='7002219001115880019'
;

select * from cus_cards where cus_code = '70212000'; 
select * from cus_customer where cus_ccode = '70212000';
--acct_id = 000111588 código cliente euroshell
--corp_acct_id código sap
--cus_ccode código sap
where vrn2 like '%monterreina%';

(select top 1 acct_id from CSC.dbo.cus_cards
	where pan_id='7002219001115880019'
) as id_cliente


--código euroshell nuevo: ES000111588