select FK_Estaciones_PK_Codigo, NombreFichero, EstacionesDocumentos.Nombre, Descripcion, FechaValidoHasta, estaciones.Email
from EstacionesDocumentos
inner join estaciones on estaciones.PK_Codigo = EstacionesDocumentos.FK_Estaciones_PK_Codigo
where FechaValidoHasta is not null
and getdate() between DATEADD([month],-2,FechaValidoHasta) and FechaValidoHasta
and borrado = 0