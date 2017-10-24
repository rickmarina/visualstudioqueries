/*********************VISTA CONTRATISTA****************************************/
USE [AdvancedArtemisDB_FORM]
GO

delete from contratistas where esMANDIRE = 1

INSERT INTO [dbo].[Contratistas]
           ([CodigoContratista]           ,[Nombre]           ,[CIF]
           ,[Direccion]           ,[CP]           ,[Localidad]
		   ,[ReferenciaExterna] 
           ,[Telefono]           ,[FAX]           ,[Email]
           ,[Comentarios]           ,[ConfirmacionPorFax]           ,[ConfirmacionPorEmail]
           ,[FK_ContratistasEstados_PK_Codigo]
           ,[FK_Paises_PK_Codigo]           ,[FK_Provincias_PK_Codigo]           ,[FK_ComunidadesAutonomas_PK_Codigo]
		   ,IVRCode
           ,[TelefonoMovil]
           ,[EmailEnvioInformesProgramados]
           ,[Multiservicio]
           ,[EmailEnvioMultiservicio]
           ,[ConfirmacionPorSms]
           ,[TelefonoMovilMultiservicio]
           ,[recibirEmailComentariosEESS]           ,[recibirEmailComentariosPersonalTecDisa]
           ,[esMANDIRE])
SELECT  
CID, --ID
(NOF + '   -   (' + CON + ')' + '  -  ' +
(case 	when (Provincia = '38') then 'Santa Cruz de Tenerife'
		when (Provincia = '35') then 'Las Palmas' 
		when (Provincia is null ) then 'Todas las provincias' end)) as nombre, --NOMBRE DEL CONTRATISTA + ACRÓNIMO
NULL as CIF,--EL CIF ESTARÁ EN BLANCO
NULL as Direccion, --DIRECCION
NULL as CP, --CP
NULL as Localidad, --LOCALIDAD
CON as ReferenciaExtena,
NULL as telefono,
NULL as fax,
email as email,
contacto.nombre + ': ' + contacto.email as Comentarios,  --COMENTARIOS PÚBLICOS
0 as confirmacionPorFAX, --CONFIRMACIÓN POR FAX DESACTIVADA
1 as confirmacionPorEMAIL, --CONFIRMACIÓN POR EMAIL ACTIVADA
1 as EstadoPK, --ESTADO DEL CONTRATISTA  --'OPERATIVO' as Estado, --ESTADO DEL CONTRATISTA
1 as paispk, 
case 
	 when (Provincia = '38') then 41 --'Santa Cruz de Tenerife'  
	 when (Provincia = '35') then 26 --'Las Palmas' 
	 else 41
end as provinciapk,  
7 as comunidadpk, 
NULL as ivrcode,
mobile as telefono_movil, 
EMAIL as EmailEnvioInformesProgramados, --EMAIL 
1 as multiservicio, -- EL CAMPO ES MULTISERVICIO ESTARÁ MARCADA EN TODOS LOS CASOS 
EMAIL as Email_envios_avisos_multiservicio, --EMAIL --CONCATENAR CON ; 
0 as confirmacionPorSMS, --CONFIRMACIÓN POR SMS DESACTIVADA 
MOBILE as Teléfono_movil_envio_avisos_multiservicio, --TELEFÓNO MOVIL 
0 as recibirEmailComentariosEESS, -- EL CAMPO RECIBIR EMAIL CON COMENTARIOS DE EESS EN INCIDENCIAS ESTARÁ DESMARCADO 
0 as recibirEmailComentariosPersonalTecDisa, -- EL CAMPO RECIBIR EMAIL CON COMENTARIOS DE PERSONAL TEC. DISA EN INCIDENCIAS ESTARÁ DESMARCADO 
1 as esMANDIRE 
FROM MAN_DIRE.dbo.CONTRATAS 
inner join MAN_DIRE.dbo.CONTACTO on MAN_DIRE.dbo.CONTRATAS.IDCONT = MAN_DIRE.dbo.CONTACTO.CID 
where 
(contacto.nombre <> 'lmacias' and CONTACTO.Nombre <> 'cgomez' and CONTACTO.Nombre <> 'Félix Yanes Marrero' 
and contacto.nombre <> 'ECANSA' and CONTACTO.Nombre <> 'ADMINISTRACIÓN FULLGAS') 
order by contacto.nombre