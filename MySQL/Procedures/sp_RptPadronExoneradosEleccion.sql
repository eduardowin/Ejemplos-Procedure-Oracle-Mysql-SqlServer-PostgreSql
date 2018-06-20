USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE centrohumanitario5.USP_RptPadronExoneradosEleccion (xidzona int, xidreunion int)
BEGIN
  SELECT (SELECT
           CONCAT(' ', RIGHT(CONCAT('00', CAST(DAY(r.fechaHrInicio) AS char)), 2), '/', RIGHT(CONCAT('00', CAST(MONTH(r.fechaHrInicio) AS char)), 2), '/', YEAR(r.fechaHrInicio),
           ' ZONA: ', (SELECT
             CodigoZona
           FROM zona
           WHERE zona.IdZona = xidzona))
         FROM tiporeunion tr
           INNER JOIN reunion r
             ON r.idtiporeunion = tr.idtiporeunion
         WHERE r.idreunion = xidreunion),
         Codigo,
         CONCAT(AppaPersona, ' ', ApmaPersona, ' ', PrimNomb, ' ', SeguNomb, ' ', TercNomb) AS NombCompleto,
         dni,
         (SELECT
           CodigoZona
         FROM zona
         WHERE zona.IdZona = dz.idzona) AS zona,
         'No Asist.',
         NULL,
         NULL,
         NULL

  FROM persona
    JOIN detalletipopersona
      ON persona.IdPersona = detalletipopersona.IdPersona
    LEFT OUTER JOIN (SELECT
      idpersona
    FROM asistencia
    WHERE idreunion = xidreunion) veni
      ON veni.idpersona = persona.IdPersona
    INNER JOIN detallezona dz
      ON dz.iddetalletipopersona = detalletipopersona.iddetalletipopersona
  WHERE detalletipopersona.estado = 1 AND
  idtipopersona = 4
  AND dz.idzona = xidzona
  AND
  IFNULL(ExoneraElec, 0) = 1 AND
  FechaDefuncion IS NULL

  AND
  veni.idpersona IS NULL
  ORDER BY NombCompleto;

END
$$

DELIMITER ;