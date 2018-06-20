USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_GenerarComisionxZona (xidc bigint, xIdPorcentaje int, xinicio datetime, xFinal datetime)
RETURNS varchar(2000) charset latin1
BEGIN
  DECLARE xdescr varchar(500);
  DECLARE xMontoTotalRecibido decimal(10, 2);
  DECLARE xMontoTotalRecaudado decimal(10, 2);
  DECLARE id int;
  DECLARE xidRecaudador bigint;
  DECLARE done tinyint DEFAULT FALSE;



  DECLARE cur CURSOR FOR (SELECT
    IdZona
  FROM zona
  WHERE Estado = 1);


  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


  OPEN cur;

loop1:
LOOP
  FETCH cur INTO id;
  IF done THEN
    CLOSE cur;
    LEAVE loop1;
  END IF;
  BEGIN
    SET xidRecaudador = (SELECT
      idpersona
    FROM usuario
    WHERE IdZonaRecaudacion = id AND Estado = 1);

    SET xMontoTotalRecaudado = (SELECT
      IFNULL(SUM(c.MontoTotal), 0) AS total

    FROM comprobante c
      INNER JOIN detallecomprobantxboucher dcb
        ON dcb.IdComprobanteVenta = c.IdComprobanteVenta
      INNER JOIN movimientosbanco mo
        ON dcb.idMovimientosbanco = mo.idMovimientosbanco
      INNER JOIN usuario u
        ON u.idUsuario = c.IdUsuarioRecaudador
      INNER JOIN zona z
        ON z.IdZona = u.IdZonaRecaudacion
    WHERE DATE(mo.FechaVerificacion) BETWEEN DATE(xinicio)
    AND DATE(xFinal));
    SET xMontoTotalRecibido = (SELECT
      IFNULL(SUM(c.MontoTotal), 0) AS total

    FROM comprobante c
      INNER JOIN detallecomprobantxboucher dcb
        ON dcb.IdComprobanteVenta = c.IdComprobanteVenta
      INNER JOIN movimientosbanco mo
        ON dcb.idMovimientosbanco = mo.idMovimientosbanco
      INNER JOIN usuario u
        ON u.idUsuario = c.IdUsuarioRecaudador
      INNER JOIN zona z
        ON z.IdZona = u.IdZonaRecaudacion
    WHERE z.IdZona = id AND DATE(mo.FechaVerificacion) BETWEEN DATE(xinicio)
    AND DATE(xFinal)) * (SELECT
      Porcentaje
    FROM porcentajecomi
    WHERE IdPorceComi = xIdPorcentaje);

    INSERT INTO comisionxzona (IdZona, TotalRecaudado, TotalRecibido, Estado, IdRecaudador, IdComision)
      VALUES (id, xMontoTotalRecaudado, xMontoTotalRecibido, 1, xidRecaudador, xidc);

  END;
END LOOP loop1;

  RETURN '1';
END
$$

DELIMITER ;