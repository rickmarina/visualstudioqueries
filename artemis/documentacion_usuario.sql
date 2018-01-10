declare @upk as int

set @upk = 828
select EstacionesDocumentos.FechaCreacion,EstacionesDocumentos.Descripcion, TiposDocumentos.Nombre as tipodocumento
,gruposdocumentos.nombre as grupo, SubgruposDocumentos.Nombre as subgrupo
from EstacionesDocumentos 
inner join TiposDocumentos on TiposDocumentos.PK_Codigo = EstacionesDocumentos.FK_TiposDocumentos_PK_Codigo
inner join SubgruposDocumentos on SubgruposDocumentos.PK_Codigo = TiposDocumentos.FK_SubgruposDocumentos_PK_Codigo
inner join GruposDocumentos on GruposDocumentos.PK_Codigo = SubgruposDocumentos.FK_GruposDocumentos_PK_Codigo
where EstacionesDocumentos.usuarioCreacion = @upk
union
select ContratistasDocumentos.FechaCreacion,ContratistasDocumentos.Descripcion, TiposDocumentos.Nombre as tipodocumento
,gruposdocumentos.nombre as grupo, SubgruposDocumentos.Nombre as subgrupo 
from ContratistasDocumentos 
inner join TiposDocumentos on TiposDocumentos.PK_Codigo = ContratistasDocumentos.FK_TiposDocumentos_PK_Codigo
inner join SubgruposDocumentos on SubgruposDocumentos.PK_Codigo = TiposDocumentos.FK_SubgruposDocumentos_PK_Codigo
inner join GruposDocumentos on GruposDocumentos.PK_Codigo = SubgruposDocumentos.FK_GruposDocumentos_PK_Codigo
where ContratistasDocumentos.usuarioCreacion = @upk
union
select IncidenciasDocumentos.FechaCreacion,IncidenciasDocumentos.Descripcion, TiposDocumentos.Nombre as tipodocumento
,gruposdocumentos.nombre as grupo, SubgruposDocumentos.Nombre as subgrupo 
 from IncidenciasDocumentos 
inner join TiposDocumentos on TiposDocumentos.PK_Codigo = IncidenciasDocumentos.FK_TiposDocumentos_PK_Codigo
inner join SubgruposDocumentos on SubgruposDocumentos.PK_Codigo = TiposDocumentos.FK_SubgruposDocumentos_PK_Codigo
inner join GruposDocumentos on GruposDocumentos.PK_Codigo = SubgruposDocumentos.FK_GruposDocumentos_PK_Codigo
where IncidenciasDocumentos.usuarioCreacion = @upk
union
select MultiserviciosDocumentos.FechaCreacion,MultiserviciosDocumentos.Descripcion, TiposDocumentos.Nombre as tipodocumento
,gruposdocumentos.nombre as grupo, SubgruposDocumentos.Nombre as subgrupo 
from MultiserviciosDocumentos
inner join TiposDocumentos on TiposDocumentos.PK_Codigo = MultiserviciosDocumentos.FK_TiposDocumentos_PK_Codigo
inner join SubgruposDocumentos on SubgruposDocumentos.PK_Codigo = TiposDocumentos.FK_SubgruposDocumentos_PK_Codigo
inner join GruposDocumentos on GruposDocumentos.PK_Codigo = SubgruposDocumentos.FK_GruposDocumentos_PK_Codigo
where MultiserviciosDocumentos.usuarioCreacion = @upk