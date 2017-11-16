/* 
Script exportación datos fidelización LOYALTY 

Tabla de clientes
Tabla de cuentas
Tabla de tarjetas
Tabla de transacciones de dos años (tanto 14fi, 16fi_h, tcf67).
Tabla de canjes (tcf49)
Datos del  Histórico, junio 2015 – junio 2017

Te envío este correo como propuesta formal para la construcción de un script que exporte los datos 
requeridos por DISA para su envío a la empresa LOYALIA.
Los datos se extraerán de la réplica de Conexflow alojada en DISA. 
Se extraerán datos de las siguientes tablas y bajo el criterio indicado a continuación: 

Tabla de clientes: 
    - Todos los campos de esta tabla de clientes cuyos registros tengan relacionada 
    una tarjeta clubsmart o tu club disa. 
Tabla de cuentas:
    - Todos los campos de esta tabla cuyos registros tengan tipo de cuenta = FI (Fidelización).
Tabla de tarjetas:
    - Todos los campos de esta tabla y registros cuya tarjeta sea ClubSmart o Tu Club DISA. 
Tabla de transacciones de dos años del histórico (junio 2015 – junio 2017):
    - Enviaremos la tabla de transacciones y la tabla de transacciones detalle cuyos registros tenga la fecha dentro 
    del periodo indicado. 
Tabla de canjes (tcf49) (junio 2015 – junio 2017):
    - Enviaremos la tabla de canjes del periodo indicado.
    
Tal y como hemos realizado en otras ocasiones, por ejemplo con deloitte, 
cada exportación generará un fichero de texto plano (dat) compuesto por los campos concatenados 
usando el literal "$&_&$".

*/

sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_Clientes" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\clientes.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_Cuentas" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\cuentas.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_Tarjetas" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\tarjetas.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_Transacciones" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\transacciones.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_TransaccionesDetalle" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\transacciones_detalle.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_LOY_Canjes" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o "z:\LOY\canjes.dat"



pause