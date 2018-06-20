USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE centrohumanitario5.USP_RptListaPersonaxFechaJuramentacion (fecha1 datetime, fecha2 datetime, xOpcion int, xIdTipoPersona int)
BEGIN
  IF (xOpcion = 1) THEN
  BEGIN
    SELECT
      persona.IdPersona,
      codigo,
      CONCAT(AppaPersona, ' ', ApmaPersona) AS Apellidos,
      CONCAT(PrimNomb, ' ', SeguNomb, ' ', TercNomb) AS Nombres,
      CONCAT(AppaPersona, ' ', ApmaPersona, ' ', PrimNomb, ' ', SeguNomb, ' ', TercNomb) AS NombCompleto,
      FechaNacimiento,
      DNI,
      (SELECT
        direccion
      FROM detalledireccion
      WHERE detalledireccion.idpersona = persona.IdPersona AND
      detalledireccion.idtipodireccion = 1 LIMIT 1),
      profesion,
      condicionlaboral,
      (SELECT
        CodigoZona
      FROM zona z
        INNER JOIN detallezona dz
          ON dz.idzona = z.IdZona
      WHERE dz.iddetalletipopersona = detalletipopersona.iddetalletipopersona),
      FechaJuramentacion
    FROM persona
      JOIN detalletipopersona
        ON persona.IdPersona = detalletipopersona.IdPersona
      JOIN profesion
        ON persona.idprofesion = profesion.idprofesion
      JOIN condicionlaboral
        ON persona.idcondicionlaboral = condicionlaboral.idcondicionlaboral
    WHERE estado = 1 AND
    idtipopersona = xIdTipoPersona AND

    FechaJuramentacion BETWEEN fecha1 AND fecha2

    ORDER BY 2;
  END;
  ELSE
  BEGIN
    SELECT
      persona.IdPersona,
      codigo,
      CONCAT(AppaPersona, ' ', ApmaPersona) AS Apellidos,
      CONCAT(PrimNomb, ' ', SeguNomb, ' ', TercNomb) AS Nombres,
      CONCAT(AppaPersona, ' ', ApmaPersona, ' ', PrimNomb, ' ', SeguNomb, ' ', TercNomb) AS NombCompleto,
      FechaNacimiento,
      DNI,
      (SELECT
        direccion
      FROM detalledireccion
      WHERE detalledireccion.idpersona = persona.IdPersona AND
      detalledireccion.idtipodireccion = 1 LIMIT 1),
      profesion,
      condicionlaboral,
      (SELECT
        CodigoZona
      FROM zona z
        INNER JOIN detallezona dz
          ON dz.idzona = z.IdZona
      WHERE dz.iddetalletipopersona = detalletipopersona.iddetalletipopersona),
      FechaJuramentacion

    FROM persona
      JOIN detalletipopersona
        ON persona.IdPersona = detalletipopersona.IdPersona
      JOIN profesion
        ON persona.idprofesion = profesion.idprofesion
      JOIN condicionlaboral
        ON persona.idcondicionlaboral = condicionlaboral.idcondicionlaboral
    WHERE detalletipopersona.estado = 1 AND
    idtipopersona = xIdTipoPersona AND

    FechaJuramentacion BETWEEN fecha1 AND fecha2


    ORDER BY 2;
  END;
  END IF;
END
$$

DELIMITER ;