USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE centrohumanitario5.sp_ResumenIngresosDiarios (fecha1 datetime, fecha2 datetime)
BEGIN
  DECLARE xnombr varchar(500);
  DECLARE xDirec varchar(100);

  SET @xidmes = (SELECT
    IdMes
  FROM meses
  WHERE YEAR(fechames) = YEAR(fecha2) AND MONTH(fechames) = MONTH(fecha2)); (SELECT
    dtt.DescDeta,
    CASE
        WHEN @xidmes = dmc.IdMes THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(dtt.Importe)

  FROM detallemesescomprobante dmc
    INNER JOIN comprobante_venta_detalle cvd
      ON cvd.IdComprobanteVentaDetalle = dmc.IdComprobanteVentaDetalle
    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN detauntaprod detun
      ON detun.IdDetaUnTaProd = cvd.IdDetaUnTaProd
    INNER JOIN detalletasas dtt
      ON dtt.IdDetaUnTaProd = detun.IdDetaUnTaProd
    INNER JOIN detauntaprod detun2
      ON detun2.IdDetaUnTaProd = dtt.IdDetaUnTaProd2

  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 4) AND
  com.IdTipoComprobante = 1 AND
  LENGTH(com.NumComprobante) = 13 AND
  com.IdEstadoComprobante = 1 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2

  GROUP BY dtt.DescDeta,
           com.PorOficina)
  UNION ALL (SELECT
    'MENSUAL',
    CASE
        WHEN @xidmes = dmc.IdMes THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(centrohumanitario2.ctacte.MENSU)

  FROM detallemesescomprobante dmc
    INNER JOIN comprobante_venta_detalle cvd
      ON cvd.IdComprobanteVentaDetalle = dmc.IdComprobanteVentaDetalle
    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN centrohumanitario2.ctacte
      ON (centrohumanitario2.ctacte.IdPersona = com.Persona_IdPersona AND
      centrohumanitario2.ctacte.RECIBO = com.NumComprobante AND
      centrohumanitario2.ctacte.PERIODO = com.Fecha AND
      centrohumanitario2.ctacte.IMPORTE = com.MontoTotal)

  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 4) AND
  com.IdTipoComprobante = 1 AND

  com.IdEstadoComprobante = 1 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2 AND
  IFNULL(centrohumanitario2.ctacte.MENSU, 0) > 0


  GROUP BY mo.IdComprobanteRef
  ORDER BY mo.FechaPago DESC)
  UNION ALL (SELECT
    'CEMENTERIO',
    CASE
        WHEN @xidmes = dmc.IdMes THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(centrohumanitario2.ctacte.CEMEN)

  FROM detallemesescomprobante dmc
    INNER JOIN comprobante_venta_detalle cvd
      ON cvd.IdComprobanteVentaDetalle = dmc.IdComprobanteVentaDetalle
    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN centrohumanitario2.ctacte
      ON (centrohumanitario2.ctacte.IdPersona = com.Persona_IdPersona AND
      centrohumanitario2.ctacte.RECIBO = com.NumComprobante AND
      centrohumanitario2.ctacte.PERIODO = com.Fecha AND
      centrohumanitario2.ctacte.IMPORTE = com.MontoTotal)

  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 4) AND
  com.IdTipoComprobante = 1 AND

  com.IdEstadoComprobante = 1 AND

  IFNULL(centrohumanitario2.ctacte.CEMEN, 0) > 0 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2

  GROUP BY mo.IdComprobanteRef
  ORDER BY mo.FechaPago DESC)
  UNION ALL (SELECT
    'MORTORIO',
    CASE
        WHEN @xidmes = dmc.IdMes THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(centrohumanitario2.ctacte.MORTU)

  FROM detallemesescomprobante dmc
    INNER JOIN comprobante_venta_detalle cvd
      ON cvd.IdComprobanteVentaDetalle = dmc.IdComprobanteVentaDetalle
    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN centrohumanitario2.ctacte
      ON (centrohumanitario2.ctacte.IdPersona = com.Persona_IdPersona AND
      centrohumanitario2.ctacte.RECIBO = com.NumComprobante AND
      centrohumanitario2.ctacte.PERIODO = com.Fecha AND
      centrohumanitario2.ctacte.IMPORTE = com.MontoTotal)

  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 4) AND
  com.IdTipoComprobante = 1 AND

  com.IdEstadoComprobante = 1 AND


  IFNULL(centrohumanitario2.ctacte.MORTU, 0) > 0 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2

  GROUP BY mo.IdComprobanteRef
  ORDER BY mo.FechaPago DESC)
  UNION ALL (SELECT
    ta.Descripcion,
    CASE
        WHEN MONTH(dca.FechaCobranza) = MONTH(NOW()) AND
        YEAR(dca.FechaCobranza) = YEAR(NOW()) THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(dca.Couta)

  FROM comprobante_venta_detalle cvd

    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN detallecoutasactividad dca
      ON dca.IdCoutaActividad = cvd.IdCoutaActividad
    INNER JOIN detalleactividad da
      ON da.idDetalleActividad = dca.IdDetalleActividad
    INNER JOIN actividades a
      ON a.idActividades = da.Actividades_idActividades
    INNER JOIN tipoactividades ta
      ON ta.idActividades = a.TipoActividades_idActividades
  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 32) AND
  com.IdTipoComprobante = 1 AND
  com.IdEstadoComprobante = 1 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2

  GROUP BY ta.Descripcion,
           com.PorOficina)
  UNION ALL (SELECT
    tr.tiporeunion,
    CASE
        WHEN @xidmes = dmc.IdMes THEN 'Recaudacion' ELSE 'Cobranza'
      END,
    SUM(dci.Couta)

  FROM detallemesescomprobante dmc
    INNER JOIN comprobante_venta_detalle cvd
      ON cvd.IdComprobanteVentaDetalle = dmc.IdComprobanteVentaDetalle
    INNER JOIN comprobante com
      ON cvd.IdComprobanteVenta = com.IdComprobanteVenta
    INNER JOIN persona pe
      ON pe.IdPersona = com.Persona_IdPersona
    INNER JOIN movimientocuentacte mo
      ON mo.IdComprobanteRef = com.IdComprobanteVenta
    INNER JOIN detalletipopersona dtp
      ON dtp.idpersona = pe.IdPersona
    INNER JOIN detallezona detz
      ON detz.iddetalletipopersona = dtp.iddetalletipopersona
    INNER JOIN detallecoutasinasistencia dci
      ON dci.idCoutaInasistencia = cvd.IdCoutaActividad
    INNER JOIN asistencia asi
      ON asi.idasistencia = dci.idAsistencia
    INNER JOIN reunion re
      ON re.idreunion = asi.idreunion
    INNER JOIN tiporeunion tr
      ON re.idtiporeunion = tr.idtiporeunion
  WHERE dtp.idtipopersona = 4 AND
  dtp.estado = 1 AND
  (cvd.IdDetaUnTaProd = 33) AND
  com.IdTipoComprobante = 1 AND
  com.IdEstadoComprobante = 1 AND
  mo.FechaPago BETWEEN fecha1 AND fecha2

  GROUP BY tr.tiporeunion,
           com.PorOficina);


END
$$

DELIMITER ;