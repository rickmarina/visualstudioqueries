if (!StringUtils.isEmpty(mesesInactividad)) {
			if (Integer.parseInt(mesesInactividad) > 0) {
				Date fechaHaceMeses = DateUtils.addMonths(new Date(), Integer.parseInt(mesesInactividad) * -1);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				query.append("AND (TCF42.FECHA_ULT_OPER <= " + formatter.format(fechaHaceMeses) + ") ");
			}
		}
		if (!StringUtils.isEmpty(mesesActividad)) {
			if (Integer.parseInt(mesesActividad) > 0) {
				Date fechaHaceMeses = DateUtils.addMonths(new Date(), Integer.parseInt(mesesActividad) * -1);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				query.append("AND (TCF42.FECHA_ULT_OPER >= " + formatter.format(fechaHaceMeses) + ") ");
			}
		}
		if (saldoClientes.equals(InformesDisaUseCase.KEY_CLIENTES_SALDO_POSITIVO)) {
			query.append(" and (tcf42.SALDO_PUNTOS > 0) ");
		}
        if (clientesIncluir.equals(InformesDisaUseCase.KEY_CLIENTES_CON_EMAIL)) {
			query.append(" and (tcf40.email like '%@%.%')  ");
		} else if (clientesIncluir.equals(InformesDisaUseCase.KEY_CLIENTES_CON_MOVIL_SIN_EMAIL)) {
			query.append(" and len(tcf40.tel_movil)>0  and not (tcf40.email like '%@%.%')  ");
		} else if (clientesIncluir.equals(InformesDisaUseCase.KEY_CLIENTES_CON_CP_SIN_MOVIL_EMAIL)) {
			query.append(" and (tcf40.provincia <> '') ");
			query.append(" and (tcf40.localidad <> '') ");
			query.append(" and (tcf40.cp <> '') ");
			query.append(" and (tcf40.direccion <> '') ");
			query.append(" and not (tcf40.email like '%@%.%')  ");
			query.append(" and len(tcf40.tel_movil)=0 ");
		}