
delete from rolespermisos where FK_Permisos_PK_Codigo = 175

insert into RolesPermisos 
select distinct fk_roles_pk_codigo, 175
from usuariosroles where fk_usuarios_login in (
	select login
	from Usuarios where estacion=1
) and FK_Roles_PK_Codigo not in (14,15,26)