USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_ConcatFormaPagoxIdEgreso (xidc bigint)
RETURNS varchar(500) charset latin1
BEGIN
  DECLARE xdescr varchar(500);
  DECLARE xxdesc varchar(200);
  DECLARE FECHA varchar(200);
  DECLARE id int;
  DECLARE done tinyint DEFAULT FALSE;




  DECLARE cur CURSOR FOR (SELECT
    IdDetallePago,
    CASE t.IDTIPOPAGO
        WHEN 4 THEN CONCAT(t.DESCRIPCION)
        WHEN 5 THEN CONCAT(t.DESCRIPCION, ' Num Tarjeta:', NumeroTarjeta, ' C.Aut:', CodigoAutorizacion)
        WHEN 6 THEN CONCAT('', NumeroCheque)
      END
  FROM pagosegresos pe
    INNER JOIN tipopago t
      ON t.IDTIPOPAGO = pe.IdTipoPago
  WHERE pe.IdComprobanteEgreso = xidc);


  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  SET xdescr = '';
  DROP TEMPORARY TABLE IF EXISTS tmpdescripciones;
  CREATE TEMPORARY TABLE tmpdescripciones (
    Id int,
    descrip varchar(300)

  );

  OPEN cur;

loop1:
LOOP
  FETCH cur INTO id, xxdesc;
  IF done THEN
    CLOSE cur;
    LEAVE loop1;
  END IF;
  BEGIN

    SET xdescr = CONCAT(xdescr, ', ', xxdesc);



  END;
END LOOP loop1;
  SET xdescr = SUBSTRING(xdescr, 2);
  RETURN xdescr;
END
$$

DELIMITER ;