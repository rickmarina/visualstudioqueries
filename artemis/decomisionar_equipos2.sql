
insert into EstacionesModelosEstadosHistorial (FK_EstacionesModelos_PK_Codigo, FK_EstacionesModelosEstados_PK_Codigo, fecha, usuario)
select PK_Codigo, 2, GETDATE(), 'ARTEMIS'
from estacionesmodelos 
where FK_CatalogoModelos_PK_Codigo=2595
and FK_EstacionesModelosEstados_PK_Codigo <> 2

update estacionesmodelos set FK_EstacionesModelosEstados_PK_Codigo=2 
where FK_CatalogoModelos_PK_Codigo=2595
and FK_EstacionesModelosEstados_PK_Codigo <> 2