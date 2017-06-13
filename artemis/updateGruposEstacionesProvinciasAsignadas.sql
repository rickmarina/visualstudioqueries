update gruposEstaciones
set tieneProvinciasAsignadas = (

	select case when count(*) = 0 then 0 else 1 end as total from [dbo].[GruposEstacionesComunidadesAutonomasProvincias]
	where gruposEstaciones.PK_Codigo = GruposEstacionesComunidadesAutonomasProvincias.FK_GruposEstaciones_PK_Codigo
	) 
