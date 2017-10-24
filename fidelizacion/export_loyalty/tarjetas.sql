CREATE VIEW VW_LOY_Tarjetas
AS

select *
from tcf41 
where  (cl_tarjeta like '700421%' or cl_tarjeta like '972400077%')