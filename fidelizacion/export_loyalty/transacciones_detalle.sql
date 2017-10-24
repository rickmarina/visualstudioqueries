/* 
Tabla de transacciones de dos años del histórico (junio 2015 – junio 2017):
    - Enviaremos la tabla de transacciones y la tabla de transacciones detalle cuyos registros tenga la fecha dentro 
    del periodo indicado. 
*/

CREATE VIEW VW_LOY_TransaccionesDetalle
AS
select *                                           
from cf_disa_hist.dbo.tcf67_h                      
where cf_disa_hist.dbo.tcf67_h.fecha >= '20150601' 
and cf_disa_hist.dbo.tcf67_h.fecha <= '20170601'   