--generar copia de clientes en bak
delete from clientes_bak;

insert into clientes_bak ([codEuroshell]
      ,[codSAP]
      ,[nombre]
      ,[eess_codEuroshell]
      ,[eess_nombre]
      ,[producto_id]
      ,[descuentom3]
      ,[valido_desde]
      ,[valido_hasta])
select [codEuroshell]
      ,[codSAP]
      ,[nombre]
      ,[eess_codEuroshell]
      ,[eess_nombre]
      ,[producto_id]
      ,[descuentom3]
      ,[valido_desde]
      ,[valido_hasta]
FROM [DESCUENTOS].[dbo].[Clientes];


-- ************ Notas para la hora de excel *******************
--j1: 
--insert into clientes (codEuroshell, codSAP, nombre, eess_codEuroshell, eess_nombre, producto_id, descuentom3, valido_desde, valido_hasta) values (
--formula j2:
--=$J$1&"'"&A2&"','"&B2&"','"&C2&"','"&D2&"','"&E2&"','"&F2&"',"&SUSTITUIR(G2;",";".")&",'"&AÑO(H2)&"-"&MES(H2)&"-"&DIA(H2)&"','"&AÑO(I2)&"-"&MES(I2)&"-"&DIA(I2)&
-- ************************************************************

--borrar los clientes actuales
delete from clientes;

--insetar los nuevos clientes
--inserts generados en el excel... aquí

--actualizar los códigos euroshell
update clientes set codEuroshell = right('00000'+codEuroshell,9)
