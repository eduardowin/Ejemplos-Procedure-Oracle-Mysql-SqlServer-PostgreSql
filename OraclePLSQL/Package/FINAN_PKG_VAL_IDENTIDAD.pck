create or replace package FINAN_PKG_VAL_IDENTIDAD IS

TYPE c_Valores IS REF CURSOR;

 PROCEDURE PRC_LIS_ALE_CUESTIONARIO( p_i_COD_MODULO IN NUMBER,
                                     p_i_NRO_SOLICITUD IN NUMBER,
                                     p_i_TIP_DOCUM_IDE IN NUMBER,
                                     p_i_NUM_DOCUM_IDE IN VARCHAR2,
                                     p_i_Usuario       IN VARCHAR2,
                                      p_o_cResultado OUT c_Valores);
                                    

END FINAN_PKG_VAL_IDENTIDAD;
/
create or replace package body FINAN_PKG_VAL_IDENTIDAD is

PROCEDURE PRC_LIS_ALE_CUESTIONARIO( p_i_COD_MODULO IN NUMBER,
                                     p_i_NRO_SOLICITUD IN NUMBER,
                                     p_i_TIP_DOCUM_IDE IN NUMBER,
                                     p_i_NUM_DOCUM_IDE IN VARCHAR2,
                                     p_i_Usuario       IN VARCHAR2,
                                      p_o_cResultado OUT c_Valores)
 /*
    -- *****************************************************************************************
    -- Descripcion: Registrará los datos básicos de un intento de validación,
    --              verificara que numero de intento de validacion es,
    --              si la validacion cumple, se devolvera una lista aleatoria con las
    --              preguntas a realizar al cliente.
    --            : EFINAN@FULXT01D
    --
    -- Input Parameters : p_i_COD_MODULO --> Codigo del modulo de donde se sacar las preguntas
    --                    p_i_NRO_SOLICITUD --> numero de solicitud del modulo
    --
    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : E Zuñiga.
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 06/05/2015       E.Zuñiga          CREACION               XXX
    -- *****************************************************************************************
  */
  IS
     v_Secuencia                          NUMBER(2)  :=   0;
     v_Mensaje_Error                      VARCHAR(180) := ' ';
     
     REC_DATA                             FINAN_VAL_IDE_CUESTIONARIO%ROWTYPE;
     
     CURSOR CUR_DATA IS
         SELECT * 
           FROM (SELECT *
                   FROM FINAN_VAL_IDE_CUESTIONARIO C
                  WHERE C.COD_MODULO = p_i_COD_MODULO
                ) T
           WHERE rownum <= 5;
  BEGIN 
    
     	BEGIN
        
          SELECT COUNT(1)
                 INTO
                 v_Secuencia
            FROM FINAN_VAL_IDENTIDAD V
           WHERE V.NRO_SOLICITUD     = p_i_NRO_SOLICITUD
                 AND V.TIP_DOCUM_IDE = p_i_TIP_DOCUM_IDE
                 AND V.NUM_DOCUM_IDE = p_i_NUM_DOCUM_IDE
                 AND V.COD_MODULO    = p_i_COD_MODULO  
        
      EXCEPTION
          WHEN OTHERS THEN 
            v_Secuencia:=0;
      END;
        
      IF v_Secuencia > 2 
      THEN
        
         v_Mensaje_Error := 'Validación de Identidad no conforme';
      ELSE
          
          INSERT INTO FINAN_VAL_IDENTIDAD
          ( 
            COD_MODULO,
            NRO_SOLICITUD,
            NRO_SECUENCIA,
            TIP_DOCUM_IDE,
            NUM_DOCUM_IDE,
            FEC_INICIO,

            EST_REGISTRO,
            FEC_REGISTRO,
            USU_REGISTRO
            )
           VALUES
           (
            p_i_COD_MODULO,
            p_i_NRO_SOLICITUD,
            v_Secuencia + 1,
            p_i_TIP_DOCUM_IDE,
            p_i_NUM_DOCUM_IDE,
            SYSDATE,
            1,
            SYSDATE,
            p_i_Usuario
           );
        
          OPEN CUR_DATA;
          FETCH CUR_DATA INTO REC_DATA;
          WHILE CUR_DATA%FOUND LOOP
              BEGIN
                  v_nNum_Solicitud:=REC_DATA.NRO_SOLICITUD;
                  
                  INSERT INTO 
    
              EXCEPTION
                
              WHEN OTHERS THEN
                      v_cDetalle_Error  := SUBSTR(SQLERRM, 1, 180);

                     INSERT INTO FINAN_INT_LP_DES_EFE_LOG
                     VALUES
                     (
                        v_nId_Proceso,
                        v_nSecuencial_Log,
                        'D',
                        v_nNum_cta_pmcp,
                        p_i_dFechaDesem,
                        v_cDetalle_Error,
                        'ES',
                        cadena,
                        SYSDATE,
                        'OPERADOR'       
                     );
                     v_nSecuencial_Log    := v_nSecuencial_Log + 1;
                     v_nCant_Log_Det      := NVL(v_nCant_Log_Det,0) + 1;
                
              END;

        FETCH CUR_DATA INTO REC_DATA;
        END LOOP;
        CLOSE CUR_DATA; 
        
      END IF;
      
      
          OPEN p_o_cResultado FOR
          SELECT  COD_TIPO_PLAN ,
                  DES_TIPO_PLAN 
            FROM  FINAN_SEG_TIPO_PLAN  STP 
           WHERE  STP.EST_REGISTRO = 1
                  AND STP.Cod_Tipo_Producto = p_i_COD_TIPO_PRODUCTO
                 ;
                 
                 
           
  EXCEPTION
            WHEN OTHERS THEN
          OPEN p_o_cResultado FOR
          SELECT  0           COD_TIPO_PLAN,
                  ' '         DES_TIPO_PLAN,
                  0           EST_REGISTRO
            FROM DUAL;

   END PRC_LIS_ALE_CUESTIONARIO;


END FINAN_PKG_VAL_IDENTIDAD;
/
