SELECT TCF67.CL_EMPRESA AS COD_EMPRESA_CF,
	     TCF67.CL_CENTRO AS COD_CENTRO_CF,
       TCF11.COD_ESTABL AS COD_EESS,
       TCF04.DESCRIPCION AS NOMBRE_EESS,
       SUM(CASE WHEN NOT(DREGLA LIKE '%EXTRA%') THEN TCF67.UNIDADES ELSE 0 END) AS TOTAL_LITROS,
       SUM(CASE WHEN NOT(DREGLA LIKE '%EXTRA%') THEN TCF67.PUNTOS ELSE 0 END) AS TOTAL_PUNTOS_x_VOLUMEN,
       SUM(CASE WHEN DREGLA LIKE '%EXTRA%' THEN TCF67.PUNTOS ELSE 0 END) AS TOTAL_PUNTOS_PROMOCION,
       SUM(TCF67.PUNTOS) AS TOTAL_GENERAL,
       SUM(CASE WHEN NOT(DREGLA LIKE '%EXTRA%') THEN 1 ELSE 0 END) AS NUM_OPER,
       COUNT(DISTINCT TCF14FI.CL_TARJETA) AS TARJETAS_ACTIVAS,
       SUM(CASE WHEN TCF40.FECH_ALTA LIKE '201804' THEN 1 ELSE 0 END) AS TARJETAS_NUEVAS
FROM TCF14FI
     INNER JOIN TCF40 ON TCF14FI.CL_CLIENTE = TCF40.CL_CLIENTE
     INNER JOIN TCF67 ON TCF67.FECHA=TCF14FI.FECHA AND TCF67.CL_EMPRESA=TCF14FI.CL_EMPRESA AND TCF67.CL_CENTRO=TCF14FI.C_VENTA
                         AND TCF67.CL_TPV=TCF14FI.P_VENTA AND TCF67.N_VENTA=TCF14FI.N_VENTA
     INNER JOIN TCF43 ON TCF67.AMB_REGCAL=TCF43.AMB_REGCAL AND TCF67.CL_REGCAL=TCF43.CL_REGCAL 
     INNER JOIN TCF11 ON TCF67.CL_EMPRESA=TCF11.CL_EMPRESA AND TCF67.CL_CENTRO=TCF11.CL_CENTRO AND TCF11.CL_CA='000001'
     INNER JOIN TCF04 ON TCF67.CL_EMPRESA=TCF04.CL_EMPRESA AND TCF67.CL_CENTRO=TCF04.CL_CENTRO 
WHERE (TCF14FI.T_OPERACION='M' AND TCF14FI.C_RESULTADO='000' AND TCF14FI.E_OPERACION='R') 
      AND (TCF67.FECHA LIKE '201804')
      AND NOT(TCF67.CL_EMPRESA IN ('00949999','00949998','00000001')) 
      AND (TCF67.CL_ARTI IN ('433','427','133','127','121','421','122','422','126','426','130','430','138','141','441','153')) 
GROUP BY TCF67.CL_EMPRESA, TCF67.CL_CENTRO, TCF04.DESCRIPCION, TCF11.COD_ESTABL
ORDER BY TCF67.CL_EMPRESA, TCF67.CL_CENTRO