alter table incidencias add pasaRevisita bit null
go
update incidencias set pasaRevisita = 1
where incidencias.PK_Codigo in (select FK_Incidencias_PK_Codigo
from IncidenciasEstadosHistorial
where FK_IncidenciasEstados_PK_Codigo = 7
)
