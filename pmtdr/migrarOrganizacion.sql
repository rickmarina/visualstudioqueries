/* Migrar ogranización de usuarios */


delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_Encargados]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_Encargados]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_Encargados]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_Estaciones]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_Estaciones]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_Estaciones]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesRegionales]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesRegionales]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_JefesRegionales]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesVentas]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesVentas]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_JefesVentas]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesZona]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_JefesZona]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_JefesZona]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_Multiencargados_Encargados]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_Multiencargados_Encargados]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_Multiencargados_Encargados]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_Multiencargados_Estaciones]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_Multiencargados_Estaciones]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_Multiencargados_Estaciones]

delete from PMTDR_V_4.[dbo].[Organizacion_Usuarios_Vendedores]
insert into PMTDR_V_4.[dbo].[Organizacion_Usuarios_Vendedores]
select * from PMTDR_V_2.[dbo].[Organizacion_Usuarios_Vendedores]