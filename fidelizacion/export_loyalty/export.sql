/* Script exportación datos fidelización LOYALTY 


Tabla de clientes
Tabla de cuentas
Tabla de tarjetas
Tabla de transacciones de dos años (tanto 14fi, 16fi_h, tcf67) .
Tabla de canjes (tcf49) 

Datos del  Histórico, junio 2015 – junio 2017


Hola Pilar, 

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

El tiempo estimado para este trabajo sería de 3 días.

Un saludo,
Ricardo

*/



sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Clientes" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\clientes.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_TransaccionesFI" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Transacciones_Desglose" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones_desglose.dat"


pause