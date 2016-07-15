--origen de transacciones
select *
 from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'


-- 1. Tenemos que enviar estas mismas, con identificador distinto (R1-IDMOVCONT) e importe negativo. CIM VIEJO 08ES0ITZ
-- (261 registros)
insert into [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R1-'+idmovcont, cim, fecha, hora, CodProd, -1 * cast(lit as decimal(6,2)) , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'


-- 2. 2. Tenemos que enviar estas mismas con identificador distinto (R2-IDMOVCONT) e importe igual (en positivo). CIM NUEVO 08ES140Y
insert into [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo] (FK_RegistroComunicaciones_Id,idmovcont, cim, fecha, hora, codprod, lit, nif, matricula, codigoerror, descripcionerror, c_venta)
select FK_RegistroComunicaciones_Id, 'R2-'+idmovcont, '08ES140Y', fecha, hora, CodProd, lit , nif, matricula, codigoerror, descripcionerror, c_venta
from suministrosenviados
where nif = 'B64356579' and cim = '08ES0ITZ' and fecha >= '201510'

-- pasar las transacciones de la tabla temporal a SuministrosNoEnviados
insert into [dbo].[SuministrosNoEnviados] ([FK_RegistroComunicaciones_Id],[IdMovCont],[CIM],[C_VENTA],[Fecha],[Hora],[CodProd],[Lit],[NIF],[Matricula])
select [FK_RegistroComunicaciones_Id], [IdMovCont], [CIM], [C_VENTA], [Fecha],[Hora],[CodProd], [Lit],[NIF],[Matricula]
from [dbo].[ZZZ_Arreglo_B64356579_CIMErroneo]
