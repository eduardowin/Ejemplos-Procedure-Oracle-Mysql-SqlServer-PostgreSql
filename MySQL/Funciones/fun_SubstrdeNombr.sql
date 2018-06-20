USE centrohumanitario5;

DELIMITER $$
CREATE DEFINER = 'root'@'localhost'
FUNCTION centrohumanitario5.fun_SubstrdeNombr (xIdTipo int, xNombre varchar(1000))
RETURNS varchar(1000) charset latin1
BEGIN
  DECLARE xnomb varchar(1000);
  DECLARE xstr varchar(200);


  IF (xIdTipo = 1) THEN
  BEGIN
    SET xnomb = TRIM(SUBSTRING(xNombre, 1, (SELECT
      INSTR(xNombre, ' '))));
  END;
  END IF;
  IF (xIdTipo = 2) THEN
  BEGIN
    IF ((SELECT
        INSTR(xNombre, ',')) > 0) THEN
    BEGIN
      SET xstr = TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' '))));
      SET xnomb = SUBSTRING((SUBSTRING_INDEX(xstr, ' ', 1)), 1, LENGTH((SUBSTRING_INDEX(xstr, ' ', 1))) - 1);
    END;
    ELSE
    BEGIN
      SET xstr = TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' '))));
      SET xnomb = TRIM(SUBSTRING_INDEX(xstr, ' ', 1));
    END;


    END IF;
  END;
  END IF;
  IF (xIdTipo = 3) THEN
  BEGIN

    SET xstr = TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
      INSTR(xNombre, ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), ' '))));
    SET xnomb = TRIM(SUBSTRING_INDEX(xstr, ' ', 1));

  END;
  END IF;
  IF (xIdTipo = 4) THEN
  BEGIN
    SET xstr = TRIM(SUBSTRING(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
      INSTR(xNombre, ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), (SELECT
        INSTR(TRIM(SUBSTRING(xNombre, (SELECT
          INSTR(xNombre, ' ')))), ' ')))), ' '))));

    SET xnomb = TRIM(SUBSTRING_INDEX(xstr, ' ', 1));

  END;
  END IF;
  IF (xIdTipo = 5) THEN
  BEGIN

    SET xstr = TRIM(SUBSTRING(TRIM(SUBSTRING(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
      INSTR(xNombre, ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), (SELECT
        INSTR(TRIM(SUBSTRING(xNombre, (SELECT
          INSTR(xNombre, ' ')))), ' ')))), ' ')))), (SELECT
      INSTR(TRIM(SUBSTRING(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
        INSTR(xNombre, ' ')))), (SELECT
        INSTR(TRIM(SUBSTRING(xNombre, (SELECT
          INSTR(xNombre, ' ')))), ' ')))), (SELECT
        INSTR(TRIM(SUBSTRING(TRIM(SUBSTRING(xNombre, (SELECT
          INSTR(xNombre, ' ')))), (SELECT
          INSTR(TRIM(SUBSTRING(xNombre, (SELECT
            INSTR(xNombre, ' ')))), ' ')))), ' ')))), ' '))));

    SET xnomb = TRIM(SUBSTRING_INDEX(xstr, ' ', 1));

  END;
  END IF;


  RETURN xnomb;
END
$$

DELIMITER ;