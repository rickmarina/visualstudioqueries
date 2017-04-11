/* objetivos:
Objetivo indicador E 24
Objetivo indicador F 23
Objetivo indicador G 25
Objetivo indicador H 26
Objetivo indicador J 28
Objetivo indicador K 29
Objetivo indicador L 30
Objetivo indicador O 31
Objetivo indicador P 32
Objetivo indicador Q 22
*/

select count(*) from PMTDR_V_2.dbo.usuarios --670
select * from (
select pkcodigo, 24 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorE,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 23 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorF,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 25 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorG,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 26 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorH,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 28 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorJ,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 29 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorK,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 30 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorL,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 31 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorO,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 32 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorP,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios union
select pkcodigo, 22 as fk_v4_indicadores_pkcodigo, isnull(ObjetivoIndicadorQ,0) as objetivoParticular from PMTDR_V_2.dbo.usuarios
) as sq1 
where objetivoParticular > 0

select * from PMTDR_V_4.[dbo].[V4_UsuariosObjetivosParticulares]

select count(*) from PMTDR_V_4.dbo.Usuarios --670

