USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE centrohumanitario5.Sp_VerificarStock (xIdDetaProducto bigint, xCantidad int)
BEGIN


  DECLARE xStockAnterior int;
  DECLARE xIdStock int;
  DECLARE xStockActual int;


  SET xStockAnterior = (SELECT
    IFNULL(STOCKACTUAL, 0)
  FROM STOCK
  WHERE IdDetaUnTaProd = xIdDetaProducto);

  SELECT
    xStockAnterior;

END
$$

DELIMITER ;