USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_MesesyanosEnletras (fecha datetime)
RETURNS varchar(500) charset latin1
BEGIN
  DECLARE xdescr varchar(500);

  SET xdescr =
      CASE MONTH(fecha)
        WHEN 1 THEN CONCAT('ENE', '-', YEAR(fecha))
        WHEN 2 THEN CONCAT('FEB', '-', YEAR(fecha))
        WHEN 3 THEN CONCAT('MAR', '-', YEAR(fecha))
        WHEN 4 THEN CONCAT('ABR', '-', YEAR(fecha))
        WHEN 5 THEN CONCAT('MAY', '-', YEAR(fecha))
        WHEN 6 THEN CONCAT('JUN', '-', YEAR(fecha))
        WHEN 7 THEN CONCAT('JUL', '-', YEAR(fecha))
        WHEN 8 THEN CONCAT('AGO', '-', YEAR(fecha))
        WHEN 9 THEN CONCAT('SET', '-', YEAR(fecha))
        WHEN 10 THEN CONCAT('OCT', '-', YEAR(fecha))
        WHEN 11 THEN CONCAT('NOV', '-', YEAR(fecha))
        WHEN 12 THEN CONCAT('DIC', '-', YEAR(fecha))
      END;


      RETURN xdescr;
    END
    $$

DELIMITER ;