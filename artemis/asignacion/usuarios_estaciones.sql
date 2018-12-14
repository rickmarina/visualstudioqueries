declare @usuarioLogin nvarchar(50)
declare @usuarioPkCodigo int
set @usuarioLogin = 'ingein0'
set @usuarioPkCodigo =1
insert into UsuariosAsignacionEstaciones (fk_usuarios_login, fk_usuarios_pkCodigo, fk_estaciones_pkCodigo) 
select v1.login, v1.userpk, v1.estacionpk from (
									select @usuarioLogin as login, @usuarioPkCodigo as userpk, FK_Estaciones_PK_Codigo as estacionpk from UsuariosEstaciones where fk_usuarios_login =  @usuarioLogin
									union 
									select @usuarioLogin, @usuarioPkCodigo, fk_estaciones_pk_codigo from [dbo].[VW_AA_Estaciones4GruposEstaciones] where GruposEstaciones_PK_Codigo in (select FK_GrupoEstaciones_PK_Codigo from UsuariosGruposEstaciones where FK_Usuarios_Login = @usuarioLogin			)
								) as v1
inner join ( --inner de contratistas 
	select distinct @usuarioLogin as login, @usuarioPkCodigo as userpk, v.estacionpkcodigo as estacionpk
	from [VW_Equipamientos4ContratosADHOC] as v
	inner join usuarioscontratistas as uc on uc.FK_Contratistas_PK_Codigo = v.contratistapkcodigo and uc.FK_Usuarios_Login = @usuarioLogin
) as vcc on vcc.estacionpk = v1.estacionpk
inner join ( --inner de contratos 
	select distinct @usuarioLogin as login, @usuarioPkCodigo as userpk , estacionpkcodigo  as estacionpk
	from [VW_Equipamientos4ContratosADHOC] as v
	inner join UsuariosContratistasContratos as ucc on ucc.Fk_Contratos_PK_Codigo = v.contratopkcodigo and ucc.FK_Usuarios_Login = @usuarioLogin
) as vcontratos on vcontratos.estacionpk = v1.estacionpk
inner join ( --inner de tipos de equipos 
	select distinct @usuarioLogin as login, @usuarioPkCodigo as userpk, v.estacionpkcodigo as estacionpk
	from UsuariosGruposTiposEquipos 
	inner join GruposTiposEquiposTiposEquipos as gtete on UsuariosGruposTiposEquipos.FK_GrupoTiposEquipos_PK_Codigo = gtete.FK_GruposTiposEquipos_PK_Codigo
	and UsuariosGruposTiposEquipos.FK_Usuarios_Login  = @usuarioLogin
	inner join [VW_Equipamientos4ContratosADHOC] as v on v.catalogotiposequipospkcodigo = FK_CatalogoTiposEquipos_PK_Codigo
) as vequipos on vequipos.estacionpk = v1.estacionpk
