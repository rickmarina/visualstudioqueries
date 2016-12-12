

sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Clientes" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\clientes.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_TransaccionesFI" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones.dat"
sqlcmd -d CF_DISA -Q "SELECT * FROM VW_DQ_Transacciones_Desglose" -S SIECISAPRO01 -U US_CF_GYT -P Gytki01 -f 65001 -s"$&_&$" -W -o ".\transacciones_desglose.dat"


pause