/* Clientes que llevan más de 3 años sin canjear */

SELECT    TCF42.ID_CUENTA, TCF42.CL_CLIENTE, TCF41.CL_TARJETA, TCF42.SALDO_PUNTOS, 
		tcf40.tipo_docid, tcf40.docid, tcf40.nombre, tcf40.apellido1, tcf40.apellido2, tcf40.sexo, tcf40.email, tcf40.tel_movil,  
		tcf40.direccion, tcf40.cp, tcf40.localidad, tcf40.provincia 
		FROM         TCF42 INNER JOIN 
		TCF40 ON TCF42.CL_CLIENTE = TCF40.CL_CLIENTE 
		inner join 
		tcf41 on tcf42.CL_CLIENTE = TCF41.CL_CLIENTE 
		WHERE     
		(TCF42.TIPO_CUENTA = 'FI')   
		and (TCF40.FECH_ALTA < convert(char(10),dateadd(year,-3,getdate()),112)) 
		AND (TCF42.SALDO_PUNTOS > 0)   
		AND (TCF41.ESTADO in (1,2))  
		and (tcf42.ESTADO = 1)  
        --quieran recibir notif. email
        and TCF40.CL_CLIENTE not in  (select cl_cliente  COLLATE Modern_Spanish_CI_AS from clubsmart_v_2.dbo.listanegraemail) 
        AND LEFT(TCF41.CL_TARJETA,6) = '700421' 
        -- AND LEFT(TCF41.CL_TARJETA,9) = '972400077' 
		AND (TCF42.ID_CUENTA NOT IN  
		(SELECT     DISTINCT ID_CUENTA  
		if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_CLUBSMART)) { 
			FROM          TodosCanjesClubSmart  
        } else if (informe.getCampoTipoTarjeta().equals(InformesDisaUseCase.KEY_TIPO_TARJETA_TUCLUBDISA)) { 
        	FROM          TodosCanjesTCD  
        } else {
        	
        }
		WHERE fecha >= convert(char(10),dateadd(year,-3,getdate()),112)  
		GROUP BY ID_CUENTA))  