
insert into V4_IndicadoresEstaciones (fk_estaciones_pkCodigo, fk_v4_indicadores_pkCodigo,activadoShell, activadoCAP,anyo,periodo)
select estaciones.pkcodigo, v4_indicadores.pkcodigo, 1, 1, '2018', 'Q2'
 from Estaciones  
cross join v4_indicadores
where estaciones.pkcodigo not in (
select fk_estaciones_pkcodigo from [dbo].[V4_IndicadoresEstaciones] where anyo='2018' and periodo='Q2')
and fk_estadosEstaciones_pkcodigo = 1


select * from v4_indicadores
 --20 to 35
select * from V4_IndicadoresEstaciones

insert into V4_IndicadoresEstaciones (fk_estaciones_pkCodigo, fk_v4_indicadores_pkCodigo,activadoShell, activadoCAP,anyo,periodo)
select estaciones.pkCodigo, V4_Indicadores.pkCodigo, 1,1, '2018','Q3' 
from Estaciones 
cross join v4_indicadores 
where fk_estadosEstaciones_pkCodigo = 1 
and estaciones.pkCodigo not in (
select distinct fk_estaciones_pkCodigo from V4_IndicadoresEstaciones
where anyo = 2018 and periodo = 'Q3'
)

--eliminar las estaciones NO OPERATIVAS copiadas de periodos anteriores con indicadores. 

delete from V4_IndicadoresEstaciones 
where fk_estaciones_pkcodigo in (
select pkCodigo from estaciones 
where pkCodigo in (
select distinct fk_estaciones_pkCodigo from V4_IndicadoresEstaciones
where anyo = 2018 and periodo = 'Q3'
) and fk_estadosEstaciones_pkCodigo <> 1
) and anyo = 2018 and periodo = 'Q3'