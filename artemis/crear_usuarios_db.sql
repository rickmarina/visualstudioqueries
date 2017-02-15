use advancedArtemisDB_FORM
go
begin try
drop user [advancedartemis-reports]
drop user [advancedartemis-schedulers]
end try
begin catch 
end catch 

create user [advancedartemis-reports] for login [advancedartemis-reports]
exec sp_addrolemember 'db_owner','advancedartemis-reports'
go

create user [advancedartemis-schedulers] for login [advancedartemis-schedulers]
exec sp_addrolemember 'db_owner','advancedartemis-schedulers'
go




