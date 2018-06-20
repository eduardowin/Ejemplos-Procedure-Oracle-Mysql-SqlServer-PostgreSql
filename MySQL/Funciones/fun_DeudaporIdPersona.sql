USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_DeudaporIdPersona (xIdpersona bigint)
RETURNS decimal(10, 2)
BEGIN
  DECLARE xcant decimal(10, 2);
  SET xcant = (SELECT
    - SUM(IFNULL(comprobante_venta_detalle.Precio, 0))

  FROM comprobante_venta_detalle
    INNER JOIN comprobante
      ON comprobante_venta_detalle.IdComprobanteVenta = comprobante.IdComprobanteVenta
    INNER JOIN persona
    INNER JOIN detalletipopersona
      ON detalletipopersona.idpersona = persona.IdPersona
    INNER JOIN detallezona detz
      ON detz.idpersona = persona.IdPersona
  WHERE detalletipopersona.idtipopersona = 4 AND
  detalletipopersona.estado = 1 AND persona.IdPersona = xIdpersona AND
  comprobante.IdEstadoComprobante IN (2, 3));


  RETURN xcant;
END
$$

DELIMITER ;