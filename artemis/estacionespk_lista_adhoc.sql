select fk_contratosADHOC_PK_Codigo, 
       STUFF( 
       (select distinct ',' + cast(FK_Estaciones_PK_Codigo  as varchar)
       from contratosADhocEstacionesModelos 
       inner join estacionesmodelos on estacionesmodelos.pk_codigo = contratosADhocEstacionesModelos.FK_EstacionesModelos_PK_Codigo
       where contratosADhocEstacionesModelos.fk_contratosADHOC_PK_Codigo = ca.fk_contratosADHOC_PK_Codigo
       FOR XML PATH('')
       ) , 1, 1, '') as estacionesseleccionadas
       from dbo.ContratosADHOCEstacionesModelos as ca
       group by fk_contratosADHOC_PK_Codigo


USE [AdvancedArtemisDB_FORM]
GO

/****** Object:  View [dbo].[VW_EstacionesIndividuales_ContratoADHOC]    Script Date: 07/02/2017 10:16:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_EstacionesIndividuales_ContratoADHOC]
AS
select fk_contratosADHOC_PK_Codigo, 
       STUFF( 
       (select distinct ',' + cast(FK_Estaciones_PK_Codigo  as varchar)
       from contratosADhocEstacionesModelos 
       inner join estacionesmodelos on estacionesmodelos.pk_codigo = contratosADhocEstacionesModelos.FK_EstacionesModelos_PK_Codigo
       where contratosADhocEstacionesModelos.fk_contratosADHOC_PK_Codigo = ca.fk_contratosADHOC_PK_Codigo
       FOR XML PATH('')
       ) , 1, 1, '') as estacionesseleccionadas
       from dbo.ContratosADHOCEstacionesModelos as ca
       group by fk_contratosADHOC_PK_Codigo


GO

--consulta
alter table contratosadhoc disable trigger updateNumeroEquipamientos
update contratosadhoc set EstacionesIndividualesSeleccionadas = (
select top 1 estacionesseleccionadas from vw_estacionesindividuales_contratoadhoc where fk_contratosadhoc_pk_codigo = contratosadhoc.PK_Codigo
)
alter table contratosadhoc enable trigger updateNumeroEquipamientos