select pk_codigo, referencia, FechaCreacion, FechaReapertura, numeroReaperturas 
, (SELECT top 1 max(fechaReapertura) from AdvancedArtemisDB__HIST.dbo.IncidenciasControlCambios where referencia collate Modern_Spanish_CI_AS = i.referencia and FechaReapertura is not null)
from incidencias as i
where FechaReapertura is null and
numeroReaperturas > 0
order by FechaCreacion desc

--update incidencias 
--set fechaReapertura = (SELECT top 1 max(fechaReapertura) from AdvancedArtemisDB__HIST.dbo.IncidenciasControlCambios where referencia collate Modern_Spanish_CI_AS = incidencias.referencia and FechaReapertura is not null) 
--where FechaReapertura is null and numeroReaperturas >