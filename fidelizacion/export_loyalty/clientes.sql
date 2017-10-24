USE [CF_DISA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_LOY_Clientes]
AS
SELECT        
CL_CLIENTE,
RAZON_SOCIAL,
NOMBRE,
APELLIDO1,
APELLIDO2,
FECH_NAC,
DOCID,
TEL_FIJO,
TEL_MOVIL,
CP,
LOCALIDAD,
PROVINCIA,
SEXO,
ESTADO_CIVIL,
NUM_HIJOS,
TIPO_VEHICULO,
TIPO_COMBUS,
KILOMETROS,
CANAL_CAPTACION,
CODIGO_CAPTADOR,
CL_COLECTIVO,
FECH_ALTA,
CL_EMPRESA_HAB,
CL_CENTRO_HAB,
DATOS_COMPLETOS,
BIENVENIDA,
EMAIL,
REPOSTAJE_HAB,
PAIS,
ENVIO_PUBLICIDAD,
CL_REGLA_COD
FROM            dbo.TCF40
WHERE        (CL_CLIENTE IN
                (SELECT DISTINCT CL_CLIENTE
                FROM            dbo.TCF41
                WHERE        (cl_tarjeta like '700421%' or cl_tarjeta like '972400077%')))



GO


