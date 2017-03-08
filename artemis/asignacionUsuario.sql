
declare @usuarioLogin nvarchar(200)
declare @usuarioPkCodigo bigint
declare @identidadEstacion bit
declare @identidadContratista bit
declare @identidadPersonalDisa bit
declare @t1 datetime;

set @usuarioLogin = 'monica.barrios';

SET @t1 = CURRENT_TIMESTAMP;
	delete from UsuariosAsignacionEstaciones where fk_usuarios_login = @usuarioLogin ;
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

SET @t1 = CURRENT_TIMESTAMP;
	delete from UsuariosAsignacionEquipamientos where fk_usuarios_login = @usuarioLogin ;
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

SET @t1 = CURRENT_TIMESTAMP;
	delete from UsuariosAsignacionContratos where fk_usuarios_login = @usuarioLogin ;
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

SET @t1 = CURRENT_TIMESTAMP;
	delete from UsuariosAsignacionContratistas where fk_usuarios_login = @usuarioLogin ;
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

SET @t1 = CURRENT_TIMESTAMP;
	delete from UsuariosAsignacionContratosAdhoc where fk_usuarios_login = @usuarioLogin ;
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

SET @t1 = CURRENT_TIMESTAMP;

select @usuarioPkCodigo       = (select pk_Codigo from usuarios where [login]=@usuarioLogin);
select @identidadEstacion     = (select estacion from usuarios where [login]=@usuarioLogin);
select @identidadContratista  = (select contratista from usuarios where [login]=@usuarioLogin);
select @identidadPersonalDisa = (select personalDisa from usuarios where [login]=@usuarioLogin);
SELECT 'ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

if @identidadEstacion = 1
begin
SET @t1 = CURRENT_TIMESTAMP;

	insert into UsuariosAsignacionEstaciones (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estaciones_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionpkcodigo 
		from VW_AA_AsignacionEstaciones_Usuarios_Estacion where usuariologin = @usuarioLogin and estacionpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996
	insert into UsuariosAsignacionEquipamientos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estacionesmodelos_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionmodelopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Estacion where usuariologin = @usuarioLogin and estacionmodelopkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratistas (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratistas_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratistapkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Estacion where usuariologin = @usuarioLogin and contratistapkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratos_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Estacion where usuariologin = @usuarioLogin and contratopkcodigo <> -9998
		union
		select @usuarioPkCodigo, @usuarioLogin,-9998
	insert into UsuariosAsignacionContratosAdhoc (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratosadhoc_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratoadhocpkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Estacion where usuariologin = @usuarioLogin and contratoadhocpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996 
SELECT 'estacion ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;
select CURRENT_TIMESTAMP;
select @t1;
end

if @identidadContratista = 1
begin
SET @t1 = CURRENT_TIMESTAMP;

	insert into UsuariosAsignacionEstaciones (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estaciones_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionpkcodigo 
		from VW_AA_AsignacionEstaciones_Usuarios_Contratista where usuariologin = @usuarioLogin and estacionpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996
	insert into UsuariosAsignacionEquipamientos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estacionesmodelos_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionmodelopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Contratista where usuariologin = @usuarioLogin and estacionmodelopkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratistas (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratistas_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratistapkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Contratista where usuariologin = @usuarioLogin and contratistapkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratos_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Contratista where usuariologin = @usuarioLogin and contratopkcodigo <> -9998
		union
		select @usuarioPkCodigo, @usuarioLogin,-9998
	insert into UsuariosAsignacionContratosAdhoc (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratosadhoc_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratoadhocpkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_Contratista where usuariologin = @usuarioLogin and contratoadhocpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996 
SELECT 'contratista ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;

end

if @identidadPersonalDisa = 1
begin
SET @t1 = CURRENT_TIMESTAMP;

	insert into UsuariosAsignacionEstaciones (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estaciones_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionpkcodigo 
		from VW_AA_AsignacionEstaciones_Usuarios_PersonalDisa where usuariologin = @usuarioLogin and estacionpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996
	insert into UsuariosAsignacionEquipamientos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_estacionesmodelos_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, estacionmodelopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_PersonalDisa where usuariologin = @usuarioLogin and estacionmodelopkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratistas (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratistas_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratistapkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_PersonalDisa where usuariologin = @usuarioLogin and contratistapkcodigo <> -999
		union
		select @usuarioPkCodigo, @usuarioLogin,-999
	insert into UsuariosAsignacionContratos (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratos_pkCodigo) 
		select distinct @usuarioPkCodigo, @usuarioLogin, contratopkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_PersonalDisa where usuariologin = @usuarioLogin and contratopkcodigo <> -9998
		union
		select @usuarioPkCodigo, @usuarioLogin,-9998
	insert into UsuariosAsignacionContratosAdhoc (fk_usuarios_pkCodigo, fk_usuarios_login, fk_contratosadhoc_pkCodigo)
		select distinct @usuarioPkCodigo, @usuarioLogin, contratoadhocpkcodigo 
		from VW_AA_AsignacionEquipamientos_Usuarios_PersonalDisa where usuariologin = @usuarioLogin and contratoadhocpkcodigo <>-9996
		union
		select @usuarioPkCodigo, @usuarioLogin,-9996 
SELECT 'personaldisa ms: '+cast(DATEDIFF(millisecond,@t1,CURRENT_TIMESTAMP) as nvarchar) AS elapsed_ms;
select CURRENT_TIMESTAMP;
select @t1;

end


