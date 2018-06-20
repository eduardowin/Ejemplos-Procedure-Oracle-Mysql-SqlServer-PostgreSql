USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_LetraComprobante (xidtipo int)
RETURNS varchar(500) charset latin1
BEGIN
  DECLARE xdescr varchar(500);

  SET xdescr = (SELECT
    UPPER(SUBSTRING(DESCTICO, 1, 1))
  FROM tipocompro
  WHERE tipocompro.IdTipoComprobante = xidtipo);


  RETURN xdescr;
END
$$

DELIMITER ;