/* 
Tabla de canjes (tcf49) (junio 2015 – junio 2017):
    - Enviaremos la tabla de canjes del periodo indicado. 
*/


CREATE VIEW VW_LOY_Canjes
AS
SELECT        TOP (100) ID_MOV, FECHA_MOV, HORA_MOV, TIPO_MOV, CL_REGALO, UNIDADES, CL_EMPRESA, 
CL_CENTRO, CL_TPV, N_VENTA, HISTORICO, COMENTARIO, CL_CAMPA, REF_REGALO, PUNTOS, 
                         IMP_CANJEO
FROM            CF_DISA_HIST.dbo.tcf49_h
where
cf_disa_hist.dbo.tcf49_h.fecha_mov >= '20150601' 
and cf_disa_hist.dbo.tcf49_h.fecha_mov <= '20170601' 