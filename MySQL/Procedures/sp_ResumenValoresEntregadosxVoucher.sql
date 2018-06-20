USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE centrohumanitario5.sp_ResumenValoresEntregadosxVoucher (xNumeroVouch varchar(20), xidusuario int)
BEGIN
  DECLARE xnombr varchar(500);
  DECLARE xDirec varchar(100);

  IF xNumeroVouch != '' THEN
  BEGIN
    SET @fecha2 = (SELECT
      FechaRegistro
    FROM movimientosbanco
    WHERE NumeroBoucher = xNumeroVouch
    AND Usuario_idUsuario = xidusuario);
    SET @xidmes = (SELECT
      IdMes
    FROM meses
    WHERE YEAR(fechames) = YEAR(@fecha2) AND MONTH(fechames) = MONTH(@fecha2)); (SELECT
      CONCAT((SELECT
        rubros.Codigo
      FROM rubros
        INNER JOIN dtllrubro
          ON dtllrubro.IdRubro = rubros.IdRubro
      WHERE dtllrubro.IdDetaUnTaProd = dtt.IdDetaUnTaProd2), '. ', dtt.DescDeta),
      CASE
          WHEN MONTH(com.Fecha) = MONTH(mo.FechaPago) AND
          YEAR(com.Fecha) = YEAR(mo.FechaPago) THEN 'Recaudacion' ELSE 'Cobranza'
        END AS dt,
      SUM(dtt.Importe)

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
      INNER JOIN detauntaprod detun
        ON detun.IdDetaUnTaProd = cvd.IdDetaUnTaProd
      INNER JOIN detalletasas dtt
        ON dtt.IdDetaUnTaProd = detun.IdDetaUnTaProd
      INNER JOIN detauntaprod detun2
        ON detun2.IdDetaUnTaProd = dtt.IdDetaUnTaProd2
      INNER JOIN detallecomprobantxboucher dcb
        ON dcb.IdComprobanteVenta = com.IdComprobanteVenta
      INNER JOIN movimientosbanco mob
        ON mob.idMovimientosbanco = dcb.idMovimientosbanco
    WHERE dtp.idtipopersona = 4 AND
    dtp.estado = 1 AND
    com.IdComprobanteVenta > 12760200 AND
    cvd.IdDetaUnTaProd = 4 AND
    mob.NumeroBoucher = xNumeroVouch AND

    com.Fecha >= dtt.fechaRegistro AND
    com.Fecha <
        CASE
          WHEN IFNULL(dtt.Registrofinal, 0) = 0 THEN NOW() ELSE dtt.Registrofinal
        END AND
      mob.IdZona = xidusuario

      GROUP BY dtt.IdDetaUnTaProd2,
               dt)
      UNION ALL (SELECT
        '002. MENSUALIDAD',
        CASE
            WHEN MONTH(centrohumanitario2.ctacte.PERIODO) = MONTH(mo.FechaPago) AND
            YEAR(centrohumanitario2.ctacte.PERIODO) = YEAR(mo.FechaPago) THEN 'Recaudacion' ELSE 'Cobranza'
          END AS dt,
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
          ON centrohumanitario2.ctacte.idComprobante = com.IdComprobanteVenta
        INNER JOIN detallecomprobantxboucher dcb
          ON dcb.IdComprobanteVenta = com.IdComprobanteVenta
        INNER JOIN movimientosbanco mob
          ON mob.idMovimientosbanco = dcb.idMovimientosbanco
      WHERE dtp.idtipopersona = 4 AND
      dtp.estado = 1 AND
      (cvd.IdDetaUnTaProd = 4) AND
      IFNULL(centrohumanitario2.ctacte.MENSU, 0) > 0 AND
      mob.NumeroBoucher = xNumeroVouch AND
      mob.IdZona = xidusuario

      GROUP BY mo.IdComprobanteRef,
               dt
      ORDER BY mo.FechaPago DESC)
      UNION ALL (SELECT
        '001. CEMENTERIO',
        CASE
            WHEN MONTH(centrohumanitario2.ctacte.PERIODO) = MONTH(mo.FechaPago) AND
            YEAR(centrohumanitario2.ctacte.PERIODO) = YEAR(mo.FechaPago) THEN 'Recaudacion' ELSE 'Cobranza'
          END AS dt,
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
          ON centrohumanitario2.ctacte.idComprobante = com.IdComprobanteVenta
        INNER JOIN detallecomprobantxboucher dcb
          ON dcb.IdComprobanteVenta = com.IdComprobanteVenta
        INNER JOIN movimientosbanco mob
          ON mob.idMovimientosbanco = dcb.idMovimientosbanco

      WHERE dtp.idtipopersona = 4 AND
      dtp.estado = 1 AND
      (cvd.IdDetaUnTaProd = 4) AND
      IFNULL(centrohumanitario2.ctacte.CEMEN, 0) > 0 AND
      mob.NumeroBoucher = xNumeroVouch AND
      mob.IdZona = xidusuario

      GROUP BY mo.IdComprobanteRef,
               dt
      ORDER BY mo.FechaPago DESC)
      UNION ALL (SELECT
        '001. MORTUORIO',
        CASE
            WHEN MONTH(centrohumanitario2.ctacte.PERIODO) = MONTH(mo.FechaPago) AND
            YEAR(centrohumanitario2.ctacte.PERIODO) = YEAR(mo.FechaPago) THEN 'Recaudacion' ELSE 'Cobranza'
          END AS dt,
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
          ON centrohumanitario2.ctacte.idComprobante = com.IdComprobanteVenta
        INNER JOIN detallecomprobantxboucher dcb
          ON dcb.IdComprobanteVenta = com.IdComprobanteVenta
        INNER JOIN movimientosbanco mob
          ON mob.idMovimientosbanco = dcb.idMovimientosbanco

      WHERE dtp.idtipopersona = 4 AND
      dtp.estado = 1 AND
      (cvd.IdDetaUnTaProd = 4) AND
      IFNULL(centrohumanitario2.ctacte.MORTU, 0) > 0 AND
      mob.NumeroBoucher = xNumeroVouch AND
      mob.IdZona = xidusuario


      GROUP BY mo.IdComprobanteRef,
               dt
      ORDER BY mo.FechaPago DESC);
      END;
      END IF;

      END
      $$

DELIMITER ;