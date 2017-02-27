select v2distribuidores.codigo, v2distribuidores.distribuidor, 

ifnull(sum(v2pago_comisiones.importeComision),0) + 
ifnull((select sum(importe) from v2distribuidor_regularizaciones where fkdistribuidor=v2distribuidores.pkcodigo and anyo=v2pago_comisiones.anyo and mes=v2pago_comisiones.mes),0) as totalComision,
ifnull((select sum(importeAlta+importeMensual-importeDescuento) from v2heos_consumos where fkdistribuidor = v2distribuidores.pkcodigo and mes=v2pago_comisiones.mes and anyo=v2pago_comisiones.anyo),0) as totalFacturacion, 
v2pago_comisiones.mes, v2pago_comisiones.anyo 
from v2pago_comisiones 
inner join v2distribuidores on v2distribuidores.pkCodigo = v2pago_comisiones.fkDistribuidor_pkCodigo 
where v2pago_comisiones.mes=12 and v2pago_comisiones.anyo=2016
and v2distribuidores.codigo = '275706'
group by v2distribuidores.codigo, v2distribuidores.distribuidor,v2pago_comisiones.mes, v2pago_comisiones.anyo 

