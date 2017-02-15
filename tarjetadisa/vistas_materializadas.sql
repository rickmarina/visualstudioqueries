--vistas materializadas 

InformeConsumosClientes:
    - Filtro fechas movimiento detalle

Informe Consumos Colectivos Detalle:
    - Revisar formato fechas ok
    - Posible mejora ok

Informe Consumos Colectivos:
    - Revisar formato fechas ok
    - Posible mejora ok 

Informe Consumos Estaciones: 
    - Tiene el filtro de fechas mov. detalle 
    - Parece correcto
    - Consulta compleja, revisar más adelante !

Informe evolución clientes: 
    - vistas materializadas:
        - crédito: mv_gyt_cliente_credito
        - contado: mv_gyt_cliente_contado
        - contado empresas: mv_gyt_cliente_contado

Informe evolución estaciones: 
    - Falta filtrar por movimiento detalle (3 queries) ok
    - Mejoría sensible al modificar la consulta. 

Informe litros de clientes:  
    - Vistas materializadas: 
        - vw_gyt_clientes_operaciones_credito 
        - vw_gyt_clientes_operaciones_contado 
        - vw_gyt_clientes_operaciones_contado_empresa 

Informe movimientos clubdia: 
    - Vistas materializadas: 
        - movimientos_clubdia

Informe cliente operaciones: 
    - Consulta enviada para materializar
    - Falta filtrar por periodo en el detalle de movimiento consulta limites ok

Informe control de consumos:
    - Verificar formato de fecha, aplicar to_char

Informe lista blanca tarjetas crédito:
    - Vista materializada:
        mv_gyt_crd_cli_importe

Informe ministerio: 
    - Vista materializada: 
        vw_gyt_ptd_001_ministerio5dire 
        vw_gyt_ptd_001_ministerio5diat 
        vw_gyt_ptd_001_ministerio4dire 
        vw_gyt_ptd_001_ministerio4diat 

Informes tarjetas activas:
    - Parece correcto. 

Informe tarjetas activas:
    - Parece correcto.

OPTIMIZACION DE PRODUCTOS Y PRODUCTOS BANDERA, para tener en la misma tabla cod_producto_ext , bandera y descripción