create or replace package FINAN_PKG_LIN_PAR_SOLICITUD is

 TYPE c_Valores IS REF CURSOR;
PROCEDURE PRC_CON_MONTO_LP_ORIGINAL(
                                  p_i_vCod_Interno        IN VARCHAR2 ,
                                  p_i_vNum_Cuenta         IN VARCHAR2 ,
                                  p_i_nMonto_Solicitado   IN NUMBER   ,
                                  p_i_nNum_Cuota          IN NUMBER   ,
                                  p_i_nTasa_DisEfe        IN NUMBER   ,
                                  p_i_vUsu_Registro       IN VARCHAR2 ,
                                  p_i_vFlagseguro         IN NUMBER   ,
                                  p_o_cResultado         OUT c_Valores
                                )
                                ;

PROCEDURE PRC_SIMULADOR_CUOTAS_LP (
                                   /*       p_i_vCod_Interno        IN VARCHAR2,
                                           i_Num_Cuota          IN NUMBER,
                                           p_i_vNum_Cuenta    IN VARCHAR2,
                                           i_Monto_Credito      IN NUMBER,
                                           p_i_nTasa_DisEfe    IN NUMBER,
                                           i_USU_REGISTRO       IN VARCHAR2,
                                           o_Monto_Cuota        IN OUT NUMBER*/

                                           p_i_vCod_Interno        IN VARCHAR2,
                                    p_i_nNum_Cuota          IN NUMBER,
                                    p_i_vNum_Cuenta    IN VARCHAR2,
                                    p_i_nMonto_Solicitado      IN NUMBER,
                                    p_i_nTasa_DisEfe    IN NUMBER,
                                    p_i_vUsu_Registro       IN VARCHAR2,
                                    p_o_nMonto_Cuota        IN OUT NUMBER
                                          );

FUNCTION FNC_OBT_VAL_TASA_LP ( p_i_nCod_Tabla      NUMBER ) RETURN NUMBER;


PROCEDURE PRC_REG_SOLICITUD_LP (
                                           p_i_vSolicitud_Details           IN       VARCHAR2,
                                           p_i_vSolicitud_Saldos_Details    IN       VARCHAR2,
                                           p_o_cResultado                   OUT      c_Valores
                                          );



PROCEDURE PRC_CON_SOLLIN_PAR_X_CLI(  p_i_vTip_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Cuenta_TP            IN VARCHAR2,
                                           p_i_vEstado_Solicitud         IN VARCHAR2,
                                           p_i_vNro_Solicitud            IN VARCHAR2,
                                           p_o_CResultado             OUT c_Valores
                                        );

PROCEDURE PRC_OBT_SOLICITUD_LP(
                                         p_i_vNRO_SOLICITUD IN VARCHAR,
                                         p_i_nTIP_DOCUM_IDE IN NUMBER,
                                         p_i_vNUM_DOCUM_IDE IN VARCHAR,
                                         p_i_vAPE_PATERNO   IN VARCHAR,
                                         p_i_vAPE_MATERNO   IN VARCHAR,
                                         p_i_vPRI_NOMBRE    IN VARCHAR,
                                         p_i_vSEG_NOMBRE    IN VARCHAR,
                                         p_i_vTip_Producto  IN VARCHAR2,
                                         p_i_vNum_Cuenta    IN VARCHAR2,
                                         p_i_vNum_Tarjeta   IN VARCHAR2,
                                         p_i_nNum_Elemnto   IN number,
                                         p_o_cResultado  OUT c_Valores
                                        ) ;

PROCEDURE PRC_ANU_SOL_LIN_PAR (  p_i_vNRO_SOLICITUD             IN    VARCHAR2,
                                       p_i_vUSU_ACTUALIZACION         IN    VARCHAR2,
                                       p_o_cResultado                 OUT c_Valores
                                     );

PROCEDURE PRC_LIS_TIPO_VENDEDOR ( p_o_cResultado   OUT c_Valores);
PROCEDURE PRC_LIS_TASAS_LP      ( p_i_vCOD_TASA                    IN VARCHAR2,
                                  p_o_cResultado                   OUT c_Valores
                                 );
PROCEDURE PRC_CON_MONT_ASIG (  p_i_vTIP_DOCUM_IDE IN VARCHAR,
                                     p_i_vP_NUM_DOCUM_IDE IN VARCHAR,
                                     p_o_cResultado        OUT c_Valores);

PROCEDURE PRC_CON_LP_FILTROS(     p_i_vNUMERO_PAGINA   number default null,
                                  p_i_vFEC_INICIO      varchar2,
                                  p_i_vFEC_FINAL       varchar2,
                                  p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,
                                  p_i_vESTADO_SOLICITUD FINAN_LP_SOLICITUD.EST_SOLICITUD%TYPE,
                                  p_o_cResultado  OUT c_Valores
                              );

PROCEDURE PRC_SOL_LP_X_CLI_RPT(    p_i_vTip_Docum_Ide            IN VARCHAR2,
                                          p_i_vNum_Docum_Ide            IN VARCHAR2,
                                          p_i_vNum_Cuenta_TP            IN VARCHAR2,
                                          p_i_vEstado_Solicitud         IN VARCHAR2,
                                          p_i_vNro_Solicitud            IN VARCHAR2,
                                          p_o_cResultado             OUT c_Valores
                                            ) ;
PROCEDURE PRC_VAL_CAMBPROD_x_LP(
                                         p_i_nTIP_DOCUM_IDE IN NUMBER,
                                         p_i_vNUM_DOCUM_IDE IN VARCHAR,
                                         p_o_cResultado  OUT c_Valores
                                        ) ;

PROCEDURE PRC_CON_SALDOS_CLIENTE (
                                       p_i_vCodInterno       varchar2,
                                       p_o_cResultado        OUT c_Valores
                                      );


PROCEDURE PRC_VAL_REGIS_LP(  p_i_vTip_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Cuenta_TP            IN VARCHAR2,
                                           p_i_vEstado_Solicitud         IN VARCHAR2,
                                           p_i_vNro_Solicitud            IN VARCHAR2,
                                           p_o_CResultado             OUT c_Valores
                             );


PROCEDURE PRC_CON_DESEM_NOCONCIL(
                                 p_i_vNUMERO_PAGINA   number default null,
                                 p_i_vFEC_INICIO      varchar2,
                                 p_i_vFEC_FINAL       varchar2,
                                 p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,
                                 p_o_cResultado  OUT c_Valores
                                );

 PROCEDURE PRC_CON_MONTO_LP(
                                  p_i_vCod_Interno        IN VARCHAR2 ,
                                  p_i_vNum_Cuenta         IN VARCHAR2 ,
                                  p_i_nMonto_Solicitado   IN NUMBER   ,
                                  p_i_nNum_Cuota          IN NUMBER   ,
                                  p_i_nTasa_DisEfe        IN NUMBER   ,
                                  p_i_vUsu_Registro       IN VARCHAR2 ,
                                  p_i_vFlagseguro         IN NUMBER   ,
                                  p_o_cResultado         OUT c_Valores
                                )
                                ;

PROCEDURE PRC_OBT_SEGURO_PROTECCION
                                 (
                                  p_i_nCod_Elemento  NUMBER,
                                  p_o_cResultado     OUT c_Valores
                                 );


end FINAN_PKG_LIN_PAR_SOLICITUD;
/
create or replace package body FINAN_PKG_LIN_PAR_SOLICITUD is

 -- *****************************************************************************************
    -- Descripcion: Proceso que permitira realizar la simulacion de lAS cuotAS.
    --              Proceso utilizado principalmente en la generacion de cuotAS para Registro de Linea Paralela
    --              ESQUEMA: EPUC@FULXG01D
    --
    -- Input Parameters :  p_i_vCod_Interno                     --> Codigo Interno del cliente PUC_PersonAS
    --                     p_i_vNum_Cuenta                      --> Numero De Cuenta
    --                     p_i_nMonto_Solicitado                --> Monto Solicitado
    --                     p_i_nNum_Cuota                       --> Numero de cuotAS a simular
    --                     p_i_nTASa_DisEfe                     --> TASa utilizada para la simulacion
    --                     p_i_vUsu_Registro                    --> usuario que genera
    -- Output Parameters:  p_o_cResultado                       --> Valora que retornAS lAS cuotAS simuladAS.
    -- Author     : Oswaldo Valdivia Otiniano.
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Miguel Jibaja.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014    O.Valdivia           CREACION           XXX
    -- *****************************************************************************************
    ---
       PROCEDURE PRC_CON_MONTO_LP_ORIGINAL(         p_i_vCod_Interno        IN VARCHAR2 ,
                                           p_i_vNum_Cuenta         IN VARCHAR2 ,
                                           p_i_nMonto_Solicitado   IN NUMBER   ,
                                           p_i_nNum_Cuota          IN NUMBER   ,
                                           p_i_nTASa_DisEfe        IN NUMBER,
                                           p_i_vUsu_Registro       IN VARCHAR2 ,
                                           p_i_vFlagseguro         IN NUMBER   ,
                                           p_o_cResultado         OUT c_Valores
                                     ) IS
        --
        -- Declaracion de variables de trabajo...
        vContador                               VARCHAR2(2):=0;                 -- Contador...
        p_o_nMonto_Cuota                        NUMBER(10,2) := 0;              -- Monto de la cuota...
        vNumMeses                               VARCHAR2(2);                    -- Numero de cuotAS (Meses)...
        v_nNumMeses                             NUMBER;                         -- Numero de cuotAS (Meses)...
        v_nNum_Simulador                        NUMBER := 0;                    -- Numero de simulaciones (Bucle)
        v_nMonto_Solicitado                     NUMBER := 0;                    -- Monto de linea paralela solicitada por el cliente...
        v_nMonto_Seguro                         NUMBER := 0;                    -- Monto Correspondiente del seguro , para un número de cuota especifico (PUC_PARAMETROS COD_TABLA=247)
   --
   --
   BEGIN
        -- INICIO DEL PROCESO
        --
        -- Inicializando variables de trabajo...
        vNumMeses             := '';
        v_nNumMeses           := 0;
        v_nNum_Simulador      := 0;
        v_nMonto_Solicitado       := p_i_nMonto_Solicitado;
        v_nMonto_Solicitado       := TO_NUMBER(v_nMonto_Solicitado,'9999999999.99');
        --
        IF ( (p_i_nNum_Cuota IS NOT NULL) AND (p_i_vNum_Cuenta IS NOT NULL) AND (p_i_nTASa_DisEfe IS NOT NULL) AND (v_nMonto_Solicitado IS NOT NULL)) THEN
            -- Eliminando registros de la tabla temporal global...
            DELETE FROM TMP_DET_SIM_CUOTAS_LINPAR;  ---FINAN_TMP_DETALLE_REFINANCIAM;
            -- Inicializando valores...
            vContador:=1;
            --
            -- INICIANDO BUCLE DE SIMULACION DE CUOTAS...
            --
            -- Validar si se efectua la simulacion de lAS cuotAS...
            IF ( v_nMonto_Solicitado > 0 ) THEN
                -- ASignar numero de meses a simular...
                IF ( (p_i_nNum_Cuota IS NULL) OR (p_i_nNum_Cuota = 0) ) THEN
                    v_nNum_Simulador := 5;
                ELSE
                    v_nNum_Simulador := 6;
                END IF;
                --
                -- BUCLE para simular reprogramaciones a 6, 12, y 24 meses...
                FOR  i IN 1 .. v_nNum_Simulador
                LOOP
                    -- Inicializar variables...
                    vNumMeses     := '';
                    --
                    v_nNumMeses   := 0;
                    --
                    -- ASignar valores a variables...
                    -- 12, 18, 24, 30 Y 36
                    CASE
                        WHEN   i = 1   THEN
                               v_nNumMeses := 12;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 2   THEN
                               v_nNumMeses := 18;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 3   THEN
                               v_nNumMeses := 24;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 4   THEN
                               v_nNumMeses := 30;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 5   THEN
                               v_nNumMeses := 36;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        ELSE
                               v_nNumMeses := p_i_nNum_Cuota;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        --
                        /*WHEN   i = 1   THEN
                               v_nNumMeses := 6;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 2   THEN
                               v_nNumMeses := 12;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 3   THEN
                               v_nNumMeses := 24;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 4   THEN
                               v_nNumMeses := 30;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 5   THEN
                               v_nNumMeses := 36;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        ELSE
                               v_nNumMeses := p_i_nNum_Cuota;
                               vNumMeses   := TO_CHAR(v_nNumMeses);*/
                    END CASE;

                    v_nMonto_Solicitado       := p_i_nMonto_Solicitado;
                    v_nMonto_Solicitado       := TO_NUMBER(v_nMonto_Solicitado,'9999999999.99');
                    --
                    -- Evaluamos si se agregara el monto del seguro desgravamen
                    IF p_i_vFlagseguro = 1 THEN
                       v_nMonto_Seguro     :=0;
                       v_nMonto_Seguro     := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM(247,1,TO_NUMBER(vNumMeses));
                       v_nMonto_Seguro     := TO_NUMBER(v_nMonto_Seguro,'9999999999.99');
                       v_nMonto_Solicitado :=v_nMonto_Solicitado + v_nMonto_Seguro;
                    END IF;
                    --
                    -- Obtener el monto a reprograr por cuotAS (24, 30, 36)...

                    PRC_SIMULADOR_CUOTAS_LP (
                                             p_i_vCod_Interno,
                                             v_nNumMeses,
                                             p_i_vNum_Cuenta,
                                             v_nMonto_Solicitado,
                                             p_i_nTASa_DisEfe,
                                             p_i_vUsu_Registro,
                                             p_o_nMonto_Cuota
                                            );
                    --
                    -- Registrar en tabla de trabajo temporal...
                    INSERT INTO TMP_DET_SIM_CUOTAS_LINPAR  ----TMP_DET_SIM_CUOTAS_LINPAR_F ---
                           (
                            num_cuenta,
                            num_cuota,
                            monto_cuota,
                            usu_registro
                           )
                    VALUES
                          (
                            p_i_vNum_Cuenta,
                            vNumMeses,
                            p_o_nMonto_Cuota,
                            p_i_vUsu_Registro
                          );
                    --
                END LOOP;
                --
            END IF;
            --
            -- Someter los cambios...
            COMMIT;
            --
            -- Presentar la informacion de simulacion de cuotAS de reprogramacion...

            OPEN p_o_cResultado FOR
                 SELECT  TDR.NUM_CUOTA                           NUMERO_MESES,
                         NVL( SUM(TDR.MONTO_CUOTA), 0)           SLD_REFINANCIAMIENTO,
                         0                                       CUOTA_DEUDA_COMPRAS,
                         NVL( SUM(TDR.MONTO_CUOTA), 0)           CUOTA_DEUDA_DISPEFEC

                 FROM    TMP_DET_SIM_CUOTAS_LINPAR tdr
                 WHERE   TDR.NUM_CUENTA       = p_i_vNum_Cuenta
                         AND TDR.USU_REGISTRO = p_i_vUsu_Registro
                 GROUP   BY TDR.NUM_CUOTA
                 ORDER   BY NUM_CUOTA, SLD_REFINANCIAMIENTO DESC
                 ;
            --
        ELSE
            -- En cASo de error...
            OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REFINANCIAMIENTO
                 FROM    DUAL;
            --
        END IF;
        ---
        ---
   EXCEPTION
        WHEN No_Data_Found THEN
             --
             OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REPROGRAMADO
                 FROM    DUAL;
        WHEN OTHERS THEN
             --
             OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REPROGRAMADO
                 FROM    DUAL;
        --

   END PRC_CON_MONTO_LP_ORIGINAL;


PROCEDURE PRC_SIMULADOR_CUOTAS_LP (
                                    p_i_vCod_Interno        IN VARCHAR2,
                                    p_i_nNum_Cuota          IN NUMBER,
                                    p_i_vNum_Cuenta         IN VARCHAR2,
                                    p_i_nMonto_Solicitado      IN NUMBER,
                                    p_i_nTASa_DisEfe    IN NUMBER,
                                    p_i_vUsu_Registro       IN VARCHAR2,
                                    p_o_nMonto_Cuota        IN OUT NUMBER
                                  ) IS
    --
       -- Declaracion de variables de trabajo...

       -- Para el tratamiento de los errores...
       excError                                EXCEPTION;                                               -- Tratamiento de lAS excepciones...
       vDetalleError                           VARCHAR2(180);                                           -- Detalle del error generado...

        CERROR               VARCHAR2(100);
        MSGERR               VARCHAR2(100);
       --
       vAnioProc                               VARCHAR2(4);                                             -- A?o de procesamiento...
       vMesProc                                VARCHAR2(2);                                             -- Mes de procesamiento...
       vDiaProc                                VARCHAR2(2);                                             -- Dia de procesamiento...
       --
       -- Para los Cursores CronogramAS por CuentAS, Saldo Capital por Cronograma y por Cuota y para el Interes Devengado...
       nSaldoCapital                           PMCP_CUOTAS_DET_TOTAL.Mto_Cap_Cuota%TYPE;                -- Saldo Capital Vigente...
       nSaldoCapitalAcum                       PMCP_CUOTAS_DET_TOTAL.Mto_Cap_Cuota%TYPE;                -- Saldo Capital Vigente Acumulado por Tramo...
       nSaldoCapitalVencido                    PMCP_CUOTAS_DET_TOTAL.Mto_Cap_Cuota%TYPE;                -- Saldo Capital Vencido...
       vNumCuentaPmcp                          PMCP_CUOTAS_DET_TOTAL.Num_Cuenta_Pmcp%TYPE;              -- Numero de la Cuenta...
       vNumTarjeta                             PMCP_CUOTAS_DET_TOTAL.Num_Tarjeta%TYPE;                  -- Numero de la Tarjeta...
       vFecProceso                             VARCHAR2(10);                                            -- Fecha de Proceso (De tabla PMCP_CUOTAS_DET_TOTAL)...
       vFecTrx                                 VARCHAR2(10);                                            -- Fecha de Transaccion (De tabla PMCP_CUOTAS_DET_TOTAL)...
       vCodEstablecimiento                     PMCP_CUOTAS_DET_TOTAL.Cod_Establecimiento%TYPE;          -- Codigo de Establecimiento...
       vCodAutorizacion                        PMCP_CUOTAS_DET_TOTAL.Cod_Autorizacion%TYPE;             -- Codigo de Autorizacion...
       nSecPago                                PMCP_CUOTAS_DET_TOTAL.Sec_Pago%TYPE;                     -- Secuencia de Pago...
       nCodMultiprod                           PMCP_CUOTAS_DET_TOTAL.Cod_Multiprod%TYPE;                -- Codigo Multiproducto...
       nMtoTASaFinan                           PMCP_CUOTAS_DET_TOTAL.Mto_TASa_Finan%TYPE;               -- Monto de la TASa de Financiamiento...
       nNumPlan                                PMCP_CUOTAS_DET_TOTAL.Num_Plan%TYPE;                     -- Numero del Plan...
       -- PK PMCP_CUOTAS_DET_TOTAL = (vNumCuentaPmcp + vNumTarjeta + vFecProceso + vCodEstablecimiento + vCodAutorizacion + nSecPago + nCodMultiprod)...
       --
       -- Para el tratamiento de lAS fechAS...
       vFechaProcesamiento                     VARCHAR2(10);                                            -- Fecha de Procesamiento (Fecha Actual)...
       vFechaCorte                             VARCHAR2(10);                                            -- Fecha Actual...
       vFechaFacturacion                       VARCHAR2(10);                                            -- Fecha de facturacion...

       vMesFecCorte                            VARCHAR2(2);                                            -- Fecha Actual...
       vMesFecCorteIni                         VARCHAR2(2);                                            -- Fecha Actual...
       vMesFecCorteFin                         VARCHAR2(2);                                            -- Fecha Actual...
       vAnoFecCorte                            VARCHAR2(4);                                            -- Fecha Actual...

       nMesFecCorteIni                         NUMBER;                                            -- Fecha Actual...
       nMesFecCorteFin                         NUMBER;                                            -- Fecha Actual...
       nAnoFecCorte                            NUMBER;                                            -- Fecha Actual...

       vFechaVencimientoInicial                VARCHAR2(10);                                            -- Fecha Actual...
       vFechaCorteFinal                        VARCHAR2(10);                                            -- Fecha Actual...

       vFechaCorteFinalFactor                  VARCHAR2(10);                                            -- Fecha Actual...
       v_nFechaCorteFinalFactor                NUMBER;
       v_cDiaFechaCorteFinalFactor             VARCHAR2(2);

       vFechaCorteOri                          VARCHAR2(10);                                            -- Fecha Actual...

       vAnioFecAct                             VARCHAR2(4);                                             -- A?o de procesamiento...
       vMesFecAct                              VARCHAR2(2);                                             -- Mes de procesamiento...

       vFecVencimiento                         VARCHAR2(10);                                            -- Fecha de Vencimiento...
       vDiaFecVcmto                            VARCHAR2(2);                                             -- Dia de procesamiento...
       vMesFecVcmto                            VARCHAR2(2);                                             -- Mes de procesamiento...
       vAnoFecVcmto                            VARCHAR2(4);                                             -- Ano de procesamiento...

       vFecVcmtoInicial                        VARCHAR2(10);                                            -- Fecha de Vencimiento...
       vFecVcmtoFinal                          VARCHAR2(10);                                            -- Fecha de Vencimiento...
       --
       nMtoCapCuota                            PMCP_CUOTAS_DET_TOTAL.Mto_Cap_Cuota%TYPE;                -- Monto Capital Cuota...
       vAnioFacturacion                        VARCHAR2(4);                                             -- A?o de facturacion...
       vMesFacturacion                         VARCHAR2(2);                                             -- Mes de facturacion...
       vMesFacturacionOri                      VARCHAR2(2);                                             -- Mes de facturacion original...
       vDiaFacturacion                         VARCHAR2(2);                                             -- Dia de facturacion...

       v_nPagoMes                              NUMBER;                                                   -- Dia de facturacion...
       v_nDiaFecVcmto                          NUMBER;
       v_cDiaFecVcmto_Final                    VARCHAR(2);
       --
       p_resultado_proc                        VARCHAR2(50);                                             -- Dia de facturacion...
       --
       v_cNum_Docum_Ide                        VARCHAR2(20) := '';
       v_Tip_Docum_Ide                         NUMBER(6);
       --
       v_nMto_Cap_Cuota_TP_Pv                  NUMBER(11,2) := 0;
       v_nMto_Cap_Cuota_FUNO_Pv                NUMBER(11,2) := 0;
       --
       -- Para obtener el factor FUNO...
       v_nFactor_FUno                          NUMBER;
       --
       -- Para el detalle de la migracion...
       v_nContDetMigra                         NUMBER;
       v_nContRegAMigrar                       NUMBER;
       v_cDes_Cod_Auto                         VARCHAR2(50);

        v_nMONTO_CUOTA_TP_PV                    NUMBER;
        v_nMONTO_CUOTA_FUNO_PV                  NUMBER;

        -------------------------------------------------------------
        vFechaActual                            VARCHAR2(10);                                            -- Fecha Actual...
        vFechaPrimerVencimiento                 VARCHAR2(10);                                            -- Fecha del primer vencimiento despues de la fecha de corte...
        vFechaVencimiento                       VARCHAR2(10);                                            -- Fecha de vencimiento...
        vFechaVencimientoAnterior               VARCHAR2(10);                                            -- Fecha de vencimiento anterior...

        nDiASAcumInteres                        NUMBER := 0;                                             -- DiAS acumulados para interes...
        nDiASAcumInteresAnterior                NUMBER := 0;                                             -- DiAS acumulados para interes anterior...
        nDiASInteres                            NUMBER := 0;                                             -- DiAS para interes...

        nTIED                                   NUMBER(12,10) := 0;                                             -- Valor de la TIED...
        nFactorActualizacion                    NUMBER(12,10) := 0;                                             -- Factor de actualizacion...
        nInteres                                NUMBER(10,2) := 0;                                             -- Interes...
        nMontoCuotaMes                          NUMBER(10,2) := 0;                                        -- Monto cuota del mes...
        nCapital                                NUMBER(10,2) := 0;                                        -- Capital...
        nSaldo                                  NUMBER(10,2) := 0;                                        -- Saldo...
        nComisionAdm                            NUMBER(10,2) := 0;                                        -- Comision administrativa...
        nCuotaTP                                NUMBER(10,2) := 0;                                        -- Cuota a reprogramar...

        ---v_nTASa_ComisionAdm_ComprAS             NUMBER := FNC_OBT_VAL_TASA_LP(1);                                              --> TASa comision administrativa ComprAS...
        v_nTASa_ComisionAdm_DispEfec            NUMBER := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM (249, 2, 2);                --> TASa comision administrativa Disp. de efectivo...
        v_nTASa_ComisionAdm                     NUMBER := 0;                                              --> TASa comision administrativa...

        nFactorActualizacionAcumulado           NUMBER(12,10) := 0;                                             -- Factor de actualizacion acumulado...
        --


        TYPE Simulador_CuotAS IS RECORD
             (
               Num_Cuota               NUMBER(2),
               Factor_Actualizacion    NUMBER(12,10),
               Fecha_Vencimiento       VARCHAR2(10),
               Fecha_Facturacion       VARCHAR2(10),
               DiAS_Acum_Interes       NUMBER,
               DiAS_Interes            NUMBER,
               Cuota                   NUMBER(10,2),
               Capital                 NUMBER(10,2),
               Interes                 NUMBER(10,2),
               Saldo                   NUMBER(10,2),
               Comision_Adm            NUMBER(10,2),
               Cuota_TP                NUMBER(10,2)
              );

       TYPE Simulador_CuotAS_Tab IS TABLE OF Simulador_CuotAS
            INDEX BY BINARY_INTEGER;

       t_Simulador_CuotAS_Tab       Simulador_CuotAS_Tab;
   --
   --
   BEGIN
        -- INICIO DEL PROCESO
        --
        -- Inicializando variables de trabajo...
        v_cNum_Docum_Ide      := '';
        v_Tip_Docum_Ide       := 0;

        vFechaActual          := '';
        vFechaVencimientoAnterior   := '';
        nDiASAcumInteres      := 0;
        nDiASAcumInteresAnterior := 0;
        nDiASInteres          := 0;
        nTIED                 := 0;
        nFactorActualizacion  := 0;
        nInteres              := 0;
        nMontoCuotaMes        := 0;
        nFactorActualizacionAcumulado := 0;
        nCapital              := 0;
        nSaldo                := 0;

        p_o_nMonto_Cuota         := 0;
        --
        -- Obtener la fecha de corte (Primera facturacion)...
        vFechaCorte  :=  FINAN_PKG_UTILITARIOS.FNC_OBT_FEC_CORTE_LP(p_i_vNum_Cuenta);
        --
        IF (vFechaCorte IS NOT NULL) THEN
            -- ASignar la fecha de facturacion...
            vFechaFacturacion := vFechaCorte;
            --
            -- Obtener el primer vencimiento...
            vFechaPrimerVencimiento := FINAN_PKG_UTILITARIOS.FNC_OBT_1ER_VCMTO_LP (
                                                                                    p_i_vNum_Cuenta,
                                                                                    vFechaCorte
                                                                                   );
            --
            -- ASignar la fecha de vencimiento...
            vFechaVencimiento := vFechaPrimerVencimiento;
            --
            -- Obtener la fecha actual (Fecha de transaccion)...
            SELECT To_Char(SYSDATE,'dd/mm/yyyy') INTO vFechaActual
            FROM   DUAL;
            --
            -- Calcular la TIED...
            nTIED       := POWER((1 + p_i_nTASa_DisEfe/100), (1/360)) - 1;
            --
            v_nTASa_ComisionAdm := ROUND((p_i_nMonto_Solicitado * v_nTASa_ComisionAdm_DispEfec), 2);
            --
            -- INI - BUCLE SEGUN NUMERO DE CUOTAS...
            -- Bucle para calculo de datos bASicos...
            FOR  i IN 0 .. (p_i_nNum_Cuota-1)
            LOOP
                  -- Inicializar variables...
                  nDiASAcumInteres      := 0;
                  nDiASInteres          := 0;
                  nFactorActualizacion  := 0;
                  nInteres              := 0;

                  vFechaFacturacion     := '';
                  vFechaVencimiento     := '';
                  --
                  -- ASignar la fecha de corte...
                  vFechaFacturacion   := TO_CHAR(ADD_MONTHS(TO_DATE(vFechaCorte, 'dd/mm/yyyy'), i), 'dd/mm/yyyy');
                  t_Simulador_CuotAS_Tab(i+1).Fecha_Facturacion := vFechaFacturacion;
                  --
                  -- ASignar la fecha de vencimiento...
                  vFechaVencimiento := TO_CHAR(ADD_MONTHS(TO_DATE(vFechaPrimerVencimiento, 'dd/mm/yyyy'), i), 'dd/mm/yyyy');
                  t_Simulador_CuotAS_Tab(i+1).Fecha_Vencimiento := vFechaVencimiento;
                  --
                  IF (i = 0) THEN      -- Si es primera cuota...
                     -- Obtener los diAS acumulados para interes...
                     nDiASAcumInteres := TO_DATE(vFechaVencimiento, 'dd/mm/yyyy') - TO_DATE(vFechaActual,'dd/mm/yyyy');
                     t_Simulador_CuotAS_Tab(i+1).DiAS_Acum_Interes := nDiASAcumInteres;
                     --
                     -- Obtener los diAS de interes...
                     nDiASInteres     := nDiASAcumInteres;
                     t_Simulador_CuotAS_Tab(i+1).DiAS_Interes := nDiASInteres;
                     --
                     -- Calcular el interes...
                     nInteres    := ROUND (p_i_nMonto_Solicitado * ( POWER ( (1 + nTIED), nDiASInteres) - 1), 2);
                     t_Simulador_CuotAS_Tab(i+1).Interes := nInteres;
                     --
                  ELSE
                     -- Obtener los diAS de interes...
                     nDiASInteres     := TO_DATE(vFechaVencimiento, 'dd/mm/yyyy') - TO_DATE(vFechaVencimientoAnterior,'dd/mm/yyyy');
                     t_Simulador_CuotAS_Tab(i+1).DiAS_Interes := nDiASInteres;
                     --
                     -- Obtener los diAS acumulados para interes...
                     nDiASAcumInteres           := nDiASAcumInteresAnterior + nDiASInteres;
                     t_Simulador_CuotAS_Tab(i+1).DiAS_Acum_Interes := nDiASAcumInteres;
                     --
                  END IF;
                  --
                  -- ASignar los diAS acumulados para interes anterior...
                  nDiASAcumInteresAnterior   := nDiASAcumInteres;
                  --
                  -- ASignar la fecha de vencimiento anterior...
                  vFechaVencimientoAnterior  := vFechaVencimiento;
                  --
                  -- Calcular el factor de actualizacion...
                  nFactorActualizacion  := 1 / ( POWER( (1 + nTIED), nDiASAcumInteres) );
                  t_Simulador_CuotAS_Tab(i + 1).Factor_Actualizacion := nFactorActualizacion;
                  --
                  -- Acumular el factor de actualizacion...
                  nFactorActualizacionAcumulado := nFactorActualizacionAcumulado + nFactorActualizacion;
                  --
            END LOOP;
            -- FIN - BUCLE SEGUN NUMERO DE CUOTAS...
            --
            -- Calcular el valor del Monto Cuota Mes...
            nMontoCuotaMes := ROUND ( (p_i_nMonto_Solicitado / nFactorActualizacionAcumulado), 2);
            --
            -- Inicializar variables de calculo...
            nInteres              := 0;
            nCapital              := 0;
            nSaldo                := 0;
            --
            -- Eliminar de tabla temporal simulacion de cuotAS para refinanciamiento...
            DELETE FROM FINAN_TMP_DET_SIM_CUOTA_LINPAR sc
            WHERE  UPPER(SC.USU_REGISTRO) = UPPER(p_i_vUsu_Registro)
            ;
            --
            -- Bucle para calculo del Capital, Interes y Saldo...
            FOR  i IN 1 .. (p_i_nNum_Cuota)
            LOOP
                -- Inicializar variables de calculo...
                nInteres              := 0;
                nCapital              := 0;
                nSaldo                := 0;
                --
                -- Para registrar el monto cuota...
                t_Simulador_CuotAS_Tab(i).Cuota := nMontoCuotaMes;
                -- Para registrar la comision administrativa...
                t_Simulador_CuotAS_Tab(i).Comision_Adm := v_nTASa_ComisionAdm;
                --
                -- Para registrar la cuota TP...
                t_Simulador_CuotAS_Tab(i).Cuota_TP := (nMontoCuotaMes + v_nTASa_ComisionAdm);
                --
                -- Validar cuotAS...
                IF (i = 1) THEN
                    -- Calcular el capital de la primera cuota...
                    nCapital :=  nMontoCuotaMes - t_Simulador_CuotAS_Tab(i).Interes;
                    t_Simulador_CuotAS_Tab(i).Capital := nCapital;
                    --
                    -- Calcular el saldo de la primera cuota...
                    nSaldo   := ROUND ( (p_i_nMonto_Solicitado - nCapital), 2);
                    t_Simulador_CuotAS_Tab(i).Saldo := nSaldo;
                    --
                ELSE
                    -- Calcular el interes a partir de la segunda cuota...
                    nInteres    := ROUND (t_Simulador_CuotAS_Tab(i-1).Saldo * ( POWER ( (1 + nTIED), t_Simulador_CuotAS_Tab(i).DiAS_Interes) - 1), 2);
                    t_Simulador_CuotAS_Tab(i).Interes := nInteres;
                    --
                    -- Calcular el capital a partir de la segunda cuota...
                    nCapital :=  nMontoCuotaMes - nInteres;
                    t_Simulador_CuotAS_Tab(i).Capital := nCapital;
                    --
                    -- Calcular el saldo a partir de la segunda cuota...
                    nSaldo   := ROUND ( (t_Simulador_CuotAS_Tab(i-1).Saldo - nCapital), 2);
                    t_Simulador_CuotAS_Tab(i).Saldo := nSaldo;
                    --
                END IF;
                --
                -- Registrar simulacion de cuotAS en tabla temporal EFINAN_TMP_SIMULADOR_CUOTAS (Para Reprogramacion)...
                INSERT INTO FINAN_TMP_DET_SIM_CUOTA_LINPAR
                    ( Cod_Interno,
                      Fecha_Transaccion,
                      Numero_CuotAS,
                      Num_Cuota,
                      Factor_Actualizacion,
                      Fecha_Vencimiento,
                      Fecha_Facturacion,
                      DiAS_Acum_Interes,
                      DiAS_Interes,
                      Cuota,
                      Capital,
                      Interes,
                      Saldo,
                      Comision_Adm,
                      Cuota_TP,
                      FEC_REGISTRO,
                      USU_REGISTRO
                    )
                 VALUES
                    (
                      p_i_vCod_Interno,
                      SYSDATE,
                      p_i_nNum_Cuota,
                      i,
                      t_Simulador_CuotAS_Tab(i).Factor_Actualizacion,
                      t_Simulador_CuotAS_Tab(i).Fecha_Vencimiento,
                      t_Simulador_CuotAS_Tab(i).Fecha_Facturacion,
                      t_Simulador_CuotAS_Tab(i).DiAS_Acum_Interes,
                      t_Simulador_CuotAS_Tab(i).DiAS_Interes,
                      t_Simulador_CuotAS_Tab(i).Cuota,
                      t_Simulador_CuotAS_Tab(i).Capital,
                      t_Simulador_CuotAS_Tab(i).Interes,
                      t_Simulador_CuotAS_Tab(i).Saldo,
                      t_Simulador_CuotAS_Tab(i).Comision_Adm,
                      t_Simulador_CuotAS_Tab(i).Cuota_TP,
                      SYSDATE,
                      UPPER(p_i_vUsu_Registro)
                    );
                --
            END LOOP;
            --
            -- Someter los cambios...
            COMMIT;
            --
            -- Calcular el monto de la cuota para el cronograma simulado...
            BEGIN
                SELECT   sc.Cuota
                         INTO
                         p_o_nMonto_Cuota
                FROM     FINAN_TMP_DET_SIM_CUOTA_LINPAR sc
                WHERE    sc.Cod_Interno             = p_i_vCod_Interno
                         AND sc.Numero_CuotAS       = p_i_nNum_Cuota
                         AND UPPER(SC.USU_REGISTRO) = UPPER(p_i_vUsu_Registro)
                         AND ROWNUM                 = 1;
            EXCEPTION
                WHEN No_Data_Found THEN
                     p_o_nMonto_Cuota       := 0;
                WHEN OTHERS THEN
                     p_o_nMonto_Cuota       := 0;
            END;
            --
       ELSE
            -- En cASo de no existir la data...
            p_o_nMonto_Cuota  := 0;
        END IF;
        --
   EXCEPTION
        WHEN No_Data_Found THEN
             ROLLBACK;
             p_o_nMonto_Cuota  := 0;
        WHEN OTHERS THEN
             ROLLBACK;
             p_o_nMonto_Cuota  := 0;

   END PRC_SIMULADOR_CUOTAS_LP;


     FUNCTION FNC_OBT_VAL_TASA_LP ( p_i_nCod_Tabla      NUMBER
                                   )

            RETURN NUMBER IS

        -- *****************************************************************************************
        -- Descripcion: Proceso que obtiene un valor de una tASa de la tabla finan_lp_tASa
        --
        --              Tabla : finan_lp_tASa.
        --              ESQUEMA: EFINAN@FULXT01D
        --
        -- Input Parameters :  v_nCod_Tabla            NUMBER       --> PK de la tabla finan_lp_tASa.
        --
        -- Output Parameters:  v_nVal_Parametro        NUMBER       --> Valor de la tabla devuelto.
        -- Author     : Oswaldo Valdivia Otiniano.
        -- Proyecto   : Plataforma Unica de Clientes (PUC).
        -- Responsable: Miguel Jibaja.
        --
        -- Revisiones
        -- Fecha            Autor         Motivo del cambio      RDC
        -- -----------------------------------------------------------------------------------------
        -- 13/02/2014    O.Valdivia            PUC               XXX
        -- *****************************************************************************************
        ---

        v_nVal_Parametro  NUMBER;

        BEGIN
          -- Inicializando la variable a retornar...
          v_nVal_Parametro := 0;
          --
          -- Obteniendo el codigo de parametro...
          BEGIN
               SELECT val_tASa INTO v_nVal_Parametro
               FROM finan_lp_tASa WHERE cod_tASa=p_i_nCod_Tabla;

          EXCEPTION
              WHEN No_Data_Found THEN
                   v_nVal_Parametro := 0;
              WHEN OTHERS THEN
                   v_nVal_Parametro := 0;
          END;
          ---
          RETURN v_nVal_Parametro;

       END FNC_OBT_VAL_TASA_LP;

   PROCEDURE PRC_REG_SOLICITUD_LP (
                                           p_i_vSolicitud_Details           IN        VARCHAR2,
                                           p_i_vSolicitud_Saldos_Details    IN       VARCHAR2,
                                           p_o_cResultado                   OUT      c_Valores
                                          )
/*
 -- ******************************************************************************
      -- Descripcion: Proceso que permitira el registro de una nueva solicitud de
      --              Linea Paralela a traves del Sistema PUC/LINEA PARALELA.
      --              El proceso obtiene 1 trama de datos (En formato XML) para el
      --              registro de dicha data en lAS tablAS correspondientes.
      --              La informacion es registrada en la siguiente tabla: FINAN_SOLICITUD_LP.
      --              ESQUEMA: EFINAN@FULXT01D
      --
      -- Input Parameters : p_i_vSolicitud_Details        VARCHAR2  --> Trama conteniendo los datos a registrar en la tabla  FINAN_SOLICITUD_LP
      --                    p_i_vSolicitud_Saldos_Details           --> Trama conteniendo los datos a registrar en la tabla  finan_lp_saldos
      -- Output Parameters: p_o_cResultado                         --> Cursor con mensaje de exito
      --                                                             o fracASo del registro, y Numero de la
      --                                                             nueva solicitud.
      -- Author     : Eduardo A.J. Zuñiga Gamarra
      -- Proyecto   : Plataforma Unica de Clientes (PUC).
      -- Responsable: Oswaldo Valdivia Otiniano.
      --
      -- Revisiones
      -- Fecha            Autor                 Motivo del cambio                  RDC
      -- ------------------------------------------------------------------------------
      -- 13/02/2014    E.Zuñiga                    CREACION                       XXX
      -- ******************************************************************************
      ---
*/
  IS

      Details_Solicitud                 XMLTYPE;
      --
      v_cCodInterno                     VARCHAR2(10);
      --
      o_resultado_proc                  VARCHAR2(200);
      --
      v_cCad_XML_Solicitud_Details      VARCHAR2(10000);
      --
      v_nSecuencia_LP                   NUMBER(2) := 0;
      --
      -- Variables para el registro de la solicitud de linea Paralela...

        v_nEst_Solicitud                  NUMBER := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,3,'');-- Pendiente de Desembolso
        v_nSLD_MORA                       NUMBER(11,2) := 0;
        v_cCod_Bloqueo_Cuenta             VARCHAR2(1)  := 'N';
        v_cCod_Bloqueo_Cartera            VARCHAR2(1)  := 'N';
        v_Cod_Evaluador                   NUMBER := 0;

        v_Cod_Regla                      NUMBER(6)    := 0;

        -- Para el numero de la solicitud...
        v_cNro_Solicitud                 VARCHAR2(20)  := '';
        --
        -- Para el estado de la validacion...
        /*v_nEst_Pendiente_Regla           NUMBER := PUC_FNC_OBTENER_PARAMETRO(124,1,'');               --> Regla pendiente...
        v_nEst_Aprobada_Regla            NUMBER := PUC_FNC_OBTENER_PARAMETRO(124,2,'');               --> Regla aprobada...
        v_nEst_Desaprobada_Regla         NUMBER := PUC_FNC_OBTENER_PARAMETRO(124,3,'');               --> Regla desaprobada...
        --
        v_nEst_Solicitud_Pendiente       NUMBER := PUC_FNC_OBTENER_PARAMETRO(123,1,'');               --> Solicitud pendiente...
        v_nEst_Solicitud_Aprobada        NUMBER := PUC_FNC_OBTENER_PARAMETRO(123,2,'');               --> Solicitud aprobada...
        */
        --
        --
        v_ncod_tASa_comprAS              finan_lp_solicitud.cod_tASa_comprAS%TYPE:= 0;
        v_ncod_tASa_disp_efec            finan_lp_solicitud.cod_tASa_disp_efec%TYPE:= 0;
        --
        v_nSolicitudes_Aprob             NUMBER := 0;
        v_nEst_Validacion_Ini            NUMBER;
        v_nEst_Validacion_Fin            NUMBER;
        v_nConSolPen                     NUMBER := 0;
        --
        v_nMonto_Boleta_Ref              NUMBER(11,2) := 0;
        v_nMonto_Minimo_Exi              NUMBER(11,2) := 0;
        v_nMonto_Pago_BNPs               NUMBER(11,2) := 0;
        v_nSld_Refinanciado              NUMBER(11,2) := 0;
        v_nMonto_Cuota_Ref               NUMBER(11,2) := 0;
        --
        v_cFecha_Refinanciamiento        VARCHAR2(10);
        v_cFec_Solicitud                 VARCHAR2(10);
        v_cFecha_Actual                  VARCHAR2(10);
        v_nDiAS_Entre_Refinanciamiento   NUMBER := 0;
        v_Resultado_Eval_Regla           VARCHAR2(200);
        o_resultado_Regl                 VARCHAR2(200);
        --
        -- Variable para el tratamiento de los diAS de pago del cliente...
        v_nDiaFecVcmto                   NUMBER := 0;

        v_nMonto_Seguro                  NUMBER(11,2) := 0;



        v_nSldo_Capital                  NUMBER(11,2) := 0;
        v_nSldo_Capital_Usu              NUMBER(11,2) := 0;



        -- Variables para el tratamiento de los errores...
        CERROR                           VARCHAR2(100);
        -- Variable para Mensaje de Validacion.
        v_Mensa_Vali                     VARCHAR2(200):='';
        ---
        -- Para la cadena XML enviada por el Sistema PUC...
        v_cDetails_Soli_Saldos          XMLTYPE;
        v_cCad_XML_Soli_Saldos_Details  VARCHAR2(1000);

        v_NUM_CUENTA_ORIGEN           finan_lp_saldos.NUM_CUENTA_ORIGEN%TYPE:='';

        v_nSld_Actual                 PUC_REPR_SALDOS.SLD_ACTUAL%TYPE := 0;
        v_nSld_Capital                PUC_REPR_SALDOS.SLD_CAPITAL%TYPE := 0;
        v_nSld_Mora_Calc              PUC_REPR_SALDOS.SLD_MORA_CALC%TYPE := 0;
        v_nMto_Linea_Cred             PUC_REPR_SALDOS.MTO_LINEA_CRED%TYPE := 0;
        v_nMto_Disp_Cred              PUC_REPR_SALDOS.MTO_DISP_CRED%TYPE := 0;
        v_nCnt_DiAS_Mora_Sbs          PUC_REPR_SALDOS.CNT_DIAS_MORA_SBS%TYPE := 0;
        v_nValCtaXCli                 NUMBER(2)      := 0;
         ERROR_CONTROLADO             EXCEPTION;

        v_nEsta_Desem                 NUMBER := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,3,'');
        v_nEsta_Anulada               NUMBER := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');
        v_ntTipoProduc                NUMBER := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(15 ,5,'');
        v_nSecu_Dese                  NUMBER(3)      := 0;

        v_cNumCuenta_LP_Cab           varchar(7);
        v_cNumCuenta_LP_Det           varchar(12);
        v_cNumCuenta_LP               varchar(19);

 BEGIN

          -- Inicializacion de variables...
          -----SELECT finan_lp_solicitud_seq.NEXTVAL INTO v_cNro_Solicitud FROM   DUAL;
          -----SELECT finan_lp_solicitud_seq.currval into  v_cNro_Solicitud FROM   DUAL;

          v_cCodInterno                     := '';
          o_resultado_proc                  := 'ProblemAS en el Registro de la Solicitud. Verifique los datos.';

          --
          v_nMonto_Boleta_Ref               := 0;
          v_nMonto_Minimo_Exi               := 0;
          v_nMonto_Pago_BNPs                := 0;
          v_cFecha_Refinanciamiento         := '';
          v_cFecha_Actual                   := '';
          v_nDiAS_Entre_Refinanciamiento    := 0;
          v_nSldo_Capital                   := 0;
          v_nSldo_Capital_Usu               := 0;
          v_Resultado_Eval_Regla            :='';
          o_resultado_Regl                  :='';


          v_cCad_XML_Solicitud_Details   := p_i_vSolicitud_Details;
          -----v_cCad_XML_Solicitud_Details   := '<Solicitud_LIN_PAR><Root><COD_TIPO_DESEMBOLSO>1</COD_TIPO_DESEMBOLSO><TIP_DOCUM_IDE>141</TIP_DOCUM_IDE><NUM_DOCUM_IDE>31618700</NUM_DOCUM_IDE><TIP_PRODUCTO>1786</TIP_PRODUCTO><NUM_CUENTA_FUNO>5246010000159535</NUM_CUENTA_FUNO><COD_AGENCIA>13</COD_AGENCIA><NUM_TARJETA_FUNO>5246010000159535</NUM_TARJETA_FUNO><MON_CUOTA_LP>729.08</MON_CUOTA_LP><NUM_CUOTA_LP>12</NUM_CUOTA_LP><NUM_MESES_REF>12</NUM_MESES_REF><COD_VENDEDOR>10</COD_VENDEDOR><MON_SOLICITADO>8000</MON_SOLICITADO><MON_ASIGNADO>10000.00</MON_ASIGNADO><MON_MINIMO_ASIGNADO>1000</MON_MINIMO_ASIGNADO><COD_TASA_DISP_EFEC>LP1</COD_TASA_DISP_EFEC><COD_TASA_COMPRAS></COD_TASA_COMPRAS><DES_CAMPANA></DES_CAMPANA><EST_CAMPANA></EST_CAMPANA><NUM_BIN_TEBCA></NUM_BIN_TEBCA><NUM_CTA_BANCARIA></NUM_CTA_BANCARIA><EST_EJECUCION>P</EST_EJECUCION><EST_ENVIO>P</EST_ENVIO><USU_REGISTRO>ovaldiviA</USU_REGISTRO><USU_ACTUALIZACION>ovaldiviA</USU_ACTUALIZACION><COD_TIPO_VENDEDOR>1</COD_TIPO_VENDEDOR><FLAG_SEGURO>1</FLAG_SEGURO><MON_CUOTA_SEG>9.02</MON_CUOTA_SEG><NUM_CUOTA_SEG>12</NUM_CUOTA_SEG><VAL_TASA_SEG>16.86</VAL_TASA_SEG></Root></Solicitud_LIN_PAR>';
          --
          Details_Solicitud := xmltype.createxml(v_cCad_XML_Solicitud_Details);
          --
          -- Para los saldos de la LINEA DE PARALELA
          v_cCad_XML_Soli_Saldos_Details  := p_i_vSolicitud_Saldos_Details;
          -----v_cCad_XML_Soli_Saldos_Details  := '<SolicitudSaldosData><Root><FEC_APERTURA_CUENTA>22/03/2013</FEC_APERTURA_CUENTA><COD_BLOQUEO_2>N</COD_BLOQUEO_2><MTO_LINEA_CRED>10000</MTO_LINEA_CRED><MTO_DISP_CRED>10500</MTO_DISP_CRED><SLD_ACTUAL>499.97</SLD_ACTUAL><SLD_CAPITAL>452.97</SLD_CAPITAL><SLD_MORA_CALC>0</SLD_MORA_CALC><CNT_DIAS_MORA_SBS>0</CNT_DIAS_MORA_SBS><FLG_COMPRA_ESAFI>00</FLG_COMPRA_ESAFI><USU_REGISTRO>ovaldiviA</USU_REGISTRO></Root></SolicitudSaldosData>';
          --
          v_cDetails_Soli_Saldos          := XMLTYPE.createxml (v_cCad_XML_Soli_Saldos_Details);
          --

          FOR i IN
                  (
                      SELECT NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_TIPO_DESEMBOLSO/text()').getstringval(),-1)            AS COD_TIPO_DESEMBOLSO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/TIP_DOCUM_IDE/text()').getstringval(),' ')                 AS TIP_DOCUM_IDE,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_DOCUM_IDE/text()').getstringval(), 0)                  AS NUM_DOCUM_IDE,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/TIP_PRODUCTO/text()').getstringval(),' ')                  AS TIP_PRODUCTO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_CUENTA_FUNO/text()').getstringval(),' ')               AS NUM_CUENTA_FUNO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_AGENCIA/text()').getstringval(),' ')                   AS COD_AGENCIA,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_TARJETA_FUNO/text()').getstringval(),' ')              AS NUM_TARJETA_FUNO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/MON_CUOTA_LP/text()').getstringval(),' ')                  AS MON_CUOTA_LP,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_CUOTA_LP/text()').getstringval(),' ')                  AS NUM_CUOTA_LP,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_MESES_REF/text()').getstringval(),0)                   AS NUM_MESES_REF,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_VENDEDOR/text()').getstringval(),0)                    AS COD_VENDEDOR,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/MON_SOLICITADO/text()').getstringval(),0)                  AS MON_SOLICITADO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/MON_ASIGNADO/text()').getstringval(),0)                    AS MON_ASIGNADO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/MON_MINIMO_ASIGNADO/text()').getstringval(), 0)            AS MON_MINIMO_ASIGNADO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_TASA_DISP_EFEC/text()').getstringval(),' ')            AS COD_TASA_DISP_EFEC,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_TASA_COMPRAS/text()').getstringval(),0)                AS COD_TASA_COMPRAS,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/DES_CAMPANA/text()').getstringval(),' ')                   AS DES_CAMPANA,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/EST_CAMPANA/text()').getstringval(),' ')                   AS EST_CAMPANA,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_BIN_TEBCA/text()').getstringval(),' ')                 AS NUM_BIN_TEBCA,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_CTA_BANCARIA/text()').getstringval(),' ')              AS NUM_CTA_BANCARIA,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/EST_EJECUCION/text()').getstringval(),' ')                 AS EST_EJECUCION,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/EST_ENVIO/text()').getstringval(),' ')                     AS EST_ENVIO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/USU_REGISTRO/text()').getstringval(),' ')                  AS USU_REGISTRO,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/USU_ACTUALIZACION/text()').getstringval(),' ')             AS USU_ACTUALIZACION,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_TIPO_VENDEDOR/text()').getstringval(),' ')             AS COD_TIPO_VENDEDOR,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/FLAG_SEGURO/text()').getstringval(),' ')                   AS FLAG_SEGURO,

                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/MON_CUOTA_SEG/text()').getstringval(),' ')                 AS MON_CUOTA_SEG,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/NUM_CUOTA_SEG/text()').getstringval(),' ')                 AS NUM_CUOTA_SEG,
                             NVL(XMLTYPE.EXTRACT (VALUE (a), '/Root/VAL_TASA_SEG/text()').getstringval(),' ')                  AS VAL_TASA_SEG
                      FROM TABLE
                           (XMLSEQUENCE (Details_Solicitud.EXTRACT('/Solicitud_LIN_PAR/Root') ) )
                          a
                  )
              --
              LOOP


                          -- INI - NEW
                          ---IF ( (i.TIP_DOCUM_IDE IS NOT NULL) AND (i.NUM_DOCUM_IDE IS NOT NULL) ) THEN
                         IF ( (i.TIP_DOCUM_IDE IS NOT NULL) AND (i.NUM_DOCUM_IDE IS NOT NULL) AND (i.NUM_CUENTA_FUNO IS NOT NULL) AND (i.USU_REGISTRO IS NOT NULL) ) THEN
                        --
                        BEGIN
                            -- Validar correspondencia de la cuenta del cliente...
                            SELECT COUNT(1)
                                   INTO
                                   v_nValCtaXCli
                            FROM   PUC_PERSONAS_PROD PPP
                            WHERE  PPP.NUM_DOCUM_IDE  = i.NUM_DOCUM_IDE
                                   AND PPP.NUM_CUENTA = i.NUM_CUENTA_FUNO
                            ;
                        EXCEPTION
                             WHEN No_Data_Found THEN
                                  v_nValCtaXCli := 0;
                             WHEN OTHERS THEN
                                  v_nValCtaXCli := 0;
                        END;
                        --
                        IF v_nValCtaXCli > 0 THEN
                        -- FIN - NEW
                             -- Obtener el codigo interno del cliente...
                             BEGIN
                                  SELECT COD_INTERNO   INTO v_cCodInterno
                                  FROM   PUC_PERSONAS PP
                                  WHERE  PP.TIP_DOCUM_IDE     = i.TIP_DOCUM_IDE
                                         AND PP.NUM_DOCUM_IDE = i.NUM_DOCUM_IDE;
                             EXCEPTION
                                 WHEN No_Data_Found THEN
                                      v_cCodInterno := '';
                                 WHEN OTHERS THEN
                                      v_cCodInterno := '';
                             END;
                             --
                             -- Obtener la fecha actual...
                             SELECT TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY')
                                    INTO
                                    v_cFecha_Actual
                             FROM   DUAL;
                             -- Validacion extras
                             --v_Mensa_Vali:=PRC_VAL_REGIS_LP(i.TIP_DOCUM_IDE,i.NUM_DOCUM_IDE,i.NUM_CUENTA_FUNO,1,' ');

                             --IF v_Mensa_Vali != 'OK' THEN
                               --EXIT;
                             --END IF;
                             --
                             -- Validar si se permite la generacion de una nueva solicitud de Linea Paralela.

                             BEGIN
                                  SELECT COUNT(1) INTO v_nConSolPen
                                  FROM   FINAN_LP_SOLICITUD LP
                                  WHERE  LP.Cod_Interno           = v_cCodInterno
                                         and LP.EST_SOLICITUD    = v_nEst_Solicitud;

                             EXCEPTION
                                  WHEN No_Data_Found THEN
                                      v_nConSolPen := 0;
                                  WHEN OTHERS THEN
                                       v_nConSolPen := 0;
                             END;

                             IF v_nConSolPen = 0 THEN

                                  BEGIN
                                      SELECT TO_CHAR(MAX(PR.FEC_SOLICITUD), 'DD/MM/YYYY'),
                                             TO_CHAR(MAX(PR.Fec_Registro), 'DD/MM/YYYY')
                                             INTO
                                             v_cFec_Solicitud,
                                             v_cFecha_Refinanciamiento
                                      FROM   FINAN_LP_SOLICITUD PR
                                      WHERE  PR.COD_INTERNO          = v_cCodInterno
                                             AND PR.NUM_CUENTA_ORIGEN  = i.NUM_CUENTA_FUNO
                                             and PR.EST_SOLICITUD    = v_nEst_Solicitud;
                                            -- AND PR.ESTADO_SOLICITUD = v_nEst_Solicitud_Aprobada;
                                  EXCEPTION
                                      WHEN NO_DATA_FOUND THEN
                                           v_cFec_Solicitud          := '';
                                           v_cFecha_Refinanciamiento := '';
                                      WHEN OTHERS THEN
                                           v_cFec_Solicitud          := '';
                                           v_cFecha_Refinanciamiento := '';
                                  END;
                                  --
                                  IF (
                                      (v_cFec_Solicitud IS NULL AND (v_cFecha_Refinanciamiento IS NULL OR v_cFecha_Refinanciamiento = '01/01/1900') )
                                      OR
                                      (v_cFec_Solicitud <> v_cFecha_Actual)
                                     )
                                  THEN

                                             v_NUM_CUENTA_ORIGEN := I.NUM_CUENTA_FUNO;

                                             select nvl(count(1),0) into v_nSecuencia_LP from finan_lp_solicitud lp
                                             where  lp.COD_INTERNO          = v_cCodInterno
                                             AND   lp.num_cuenta_origen      = i.NUM_CUENTA_FUNO;

                                             v_nSecuencia_LP:=nvl(v_nSecuencia_LP,0)+1;
                                            -- Para obtener la deuda pendiente (Saldo en mora) y los codigos de bloqueo...
                                            BEGIN
                                                SELECT ps.SLD_MORA, ps.COD_BLOQUEO_2, ps.COD_BLOQUEO_1
                                                       INTO v_nSLD_MORA, v_cCod_Bloqueo_Cuenta, v_cCod_Bloqueo_Cartera
                                                FROM   pmcp_saldos ps
                                                WHERE  ps.num_cuenta_pmcp = i.NUM_CUENTA_FUNO
                                                       AND ps.num_tarjeta = i.NUM_TARJETA_FUNO;
                                            EXCEPTION
                                                WHEN No_data_found THEN
                                                     v_nSLD_MORA            := 0;
                                                     v_cCod_Bloqueo_Cuenta  := '';
                                                     v_cCod_Bloqueo_Cartera := '';
                                                WHEN OTHERS THEN
                                                     v_nSLD_MORA            := 0;
                                                     v_cCod_Bloqueo_Cuenta  := '';
                                                     v_cCod_Bloqueo_Cartera := '';
                                            END;

                                            if TO_NUMBER(i.FLAG_SEGURO)= 1  then

                                                select PP.VAL_NUM_ENTERO into v_nMonto_Seguro from puc_parametros pp
                                                where pp.cod_elemento=to_number(i.NUM_CUOTA_LP)
                                                AND   PP.COD_TABLA=247;

                                                IF NVL(v_nMonto_Seguro,0) <=0 THEN

                                                    CERROR := 'El MONTO DEL SEGURO NO EXISTE O ES CERO';
                                                    RAISE ERROR_CONTROLADO;

                                                end if;
                                            end if;

                                            /*
                                            v_cNumCuenta_LP_Cab := SUBSTR(i.NUM_CUENTA_FUNO,1,7);
                                            v_cNumCuenta_LP_Det := SUBSTR(i.NUM_CUENTA_FUNO,10,9);
                                            v_cNumCuenta_LP     := v_cNumCuenta_LP_Cab||'99'||v_cNumCuenta_LP_Det;
                                            */
                                            
                                            /*
                                            SELECT TO_CHAR(MAX(TO_NUMBER(PPP.NUM_CUENTA)))
                                              INTO v_cNumCuenta_LP
                                              FROM PUC_PERSONAS_PROD PPP
                                             WHERE PPP.TIP_DOCUM_IDE = TO_NUMBER(i.TIP_DOCUM_IDE)
                                               AND PPP.NUM_DOCUM_IDE = TRIM(i.NUM_DOCUM_IDE)
                                               AND PPP.TIP_PRODUCTO  = v_ntTipoProduc
                                               AND 
                                               PPP.NUM_CUENTA NOT IN (
                                                                         SELECT NVL(FLP.NUM_CUENTA_LP, 0)
                                                                         FROM   FINAN_LP_SOLICITUD FLP
                                                                         WHERE  FLP.COD_INTERNO        = v_cCodInterno
                                                                                AND FLP.EST_SOLICITUD! = v_nEsta_Anulada
                                                                   );
                                            */
                                            
                                            BEGIN 
                                                v_cNumCuenta_LP := FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_CUENTA_LP(TRIM(i.NUM_CUENTA_FUNO));
                                            EXCEPTION
                                                WHEN OTHERS THEN
                                                     v_cNumCuenta_LP:='';                                                                                            
                                            END;

                                            
                                            INSERT INTO FINAN_LP_SOLICITUD
                                                   (  NRO_SOLICITUD,
                                                      COD_TIPO_DESEMBOLSO,
                                                      FEC_SOLICITUD,
                                                      NRO_SECUENCIA,
                                                      COD_INTERNO,
                                                      TIP_PRODUCTO,
                                                      NUM_CUENTA_ORIGEN,
                                                      MON_ASIGNADO,
                                                      MON_MINIMO_ASIGNADO,
                                                      MON_SOLICITADO,
                                                      COD_TASA_COMPRAS,
                                                      COD_TASA_DISP_EFEC,
                                                      NUM_CUOTA_LP,
                                                      MON_CUOTA_LP,
                                                      COD_VENDEDOR,
                                                      COD_AGENCIA,
                                                      DES_CAMPANA,
                                                      EST_CAMPANA,

                                                      EST_ENVIO,

                                                      EST_EJECUCION,

                                                      EST_SOLICITUD,
                                                      EST_REGISTRO,
                                                      FEC_REGISTRO,
                                                      USU_REGISTRO,
                                                      FEC_ACTUALIZACION,
                                                      USU_ACTUALIZACION,
                                                      COD_TIPO_VENDEDOR,
                                                      NUM_TARJETA_ORIGEN,
                                                      FLAG_SEGURO,
                                                      MON_SEGURO,
                                                      NUM_CUENTA_LP,
                                                      NUM_CUOTA_SEG,
                                                      MON_CUOTA_SEG,
                                                      VAL_TASA_SEG
                                                   )
                                            VALUES (
                                                     v_cNro_Solicitud,                          --NRO_SOLICITUD
                                                     TO_NUMBER  (i.COD_TIPO_DESEMBOLSO),
                                                     SYSDATE,                                   	--FEC_SOLICITUD
                                                     TO_NUMBER  (v_nSecuencia_LP),
                                                     v_cCodInterno,                               --COD_INTERNO
                                                     TO_NUMBER  (i.TIP_PRODUCTO),                 --TIP_PRODUCTO
                                                     i.NUM_CUENTA_FUNO,                           --NUM_CUENTA_FUNO
                                                     TO_NUMBER  (i.MON_ASIGNADO, '9999999999.99') ,
                                                     TO_NUMBER  (i.MON_MINIMO_ASIGNADO, '9999999999.99'),
                                                     TO_NUMBER  (i.MON_SOLICITADO, '9999999999.99'),
                                                                                                  --TO_NUMBER  (i.COD_TASA_COMPRAS),
                                                     '',
                                                     i.COD_TASA_DISP_EFEC,
                                                     TO_NUMBER  (i.NUM_CUOTA_LP),
                                                     TO_NUMBER  (i.MON_CUOTA_LP, '9999999999.99'),
                                                     TO_NUMBER  (i.COD_VENDEDOR),
                                                     TO_NUMBER  (i.COD_AGENCIA),
                                                     i.DES_CAMPANA,
                                                     i.EST_CAMPANA,
                                                     i.EST_ENVIO,
                                                     i.EST_EJECUCION,
                                                     --TO_NUMBER  (v_nEst_Solicitud),v_nEsta_Desem
                                                     TO_NUMBER  (v_nEsta_Desem),
                                                     1,
                                                     SYSDATE,                                     	--FEC_REgistro
                                                     i.USU_REGISTRO,
                                                     SYSDATE,
                                                     i.USU_REGISTRO,
                                                     to_number(i.COD_TIPO_VENDEDOR),
                                                     i.NUM_TARJETA_FUNO,
                                                     TO_NUMBER(i.FLAG_SEGURO),
                                                     TO_NUMBER(v_nMonto_Seguro,'9999999999.99'),
                                                     v_cNumCuenta_LP,
                                                     TO_NUMBER(i.NUM_CUOTA_SEG),
                                                     TO_NUMBER(i.MON_CUOTA_SEG,'99999.99'),
                                                     TO_NUMBER(i.VAL_TASA_SEG,'9999.99')
                                                     --FEC_Actualizacion
                                                     -- Falta numero de CuotAS y monto generado por la simulacion
                                                     --Eduardo aca lo agregue para que no diera error disculpa
                                                    );

                                            COMMIT;

                                            --
                                            -- Sometemos la solicitud...

                                             --
                                             -- ASignamos el resultado del registro de la solicitud...
                                             o_resultado_proc:='OK';
                                             --
                                            -- Obtener el numero de solicitud generado...
                                            SELECT finan_lp_solicitud_seq.currval 
                                                   INTO
                                                   v_cNro_Solicitud 
                                            FROM   DUAL;
                                            --                                             
                                             -- INI - NEW - 24082012
                                             IF (v_cNro_Solicitud IS NOT NULL AND o_resultado_proc = 'OK') THEN

                                                    -- Registro de los saldos
                                                    FOR j IN
                                                        (
                                                         SELECT NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/FEC_APERTURA_CUENTA/text()').getstringval (), '')       AS FEC_APERTURA_CUENTA,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/COD_BLOQUEO_2/text()').getstringval (), '')             AS COD_BLOQUEO_2,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/MTO_LINEA_CRED/text()').getstringval (), 0)             AS MTO_LINEA_CRED,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/MTO_DISP_CRED/text()').getstringval (), 0)              AS MTO_DISP_CRED,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/SLD_ACTUAL/text()').getstringval (), 0)                 AS SLD_ACTUAL,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/SLD_CAPITAL/text()').getstringval (), 0)                AS SLD_CAPITAL,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/SLD_MORA_CALC/text()').getstringval (),0)               AS SLD_MORA_CALC,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/CNT_DIAS_MORA_SBS/text()').getstringval (), 0)          AS CNT_DIAS_MORA_SBS,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/FLG_COMPRA_ESAFI/text()').getstringval (), '')          AS FLG_COMPRA_ESAFI,
                                                                NVL (XMLTYPE.EXTRACT (VALUE (a), '/Root/USU_REGISTRO/text()').getstringval (), '')              AS USU_REGISTRO
                                                         FROM   TABLE (XMLSEQUENCE (v_cDetails_Soli_Saldos.EXTRACT ('/SolicitudSaldosData/Root'))) a
                                                        )
                                                    --
                                                    LOOP

                                                         -- ASignar los valores...
                                                         v_nSld_Actual           := TO_NUMBER  (j.SLD_ACTUAL, '9999999999.99');
                                                         v_nSld_Capital          := TO_NUMBER (j.SLD_CAPITAL, '9999999999.99');
                                                         v_nSld_Mora_Calc        := TO_NUMBER (j.SLD_MORA_CALC, '9999999999.99');
                                                         v_nMto_Linea_Cred       := TO_NUMBER (j.MTO_LINEA_CRED, '9999999999.99');
                                                         v_nMto_Disp_Cred        := TO_NUMBER (j.MTO_DISP_CRED, '9999999999.99');
                                                         v_nCnt_DiAS_Mora_Sbs    := TO_NUMBER (j.CNT_DIAS_MORA_SBS, '9999999999.99');
                                                         --
                                                         -- Registrar los saldos
                                                         BEGIN
                                                         INSERT INTO FINAN_LP_SALDOS
                                                         (
                                                          nro_solicitud,
                                                          NUM_CUENTA_ORIGEN,
                                                          fec_apertura_cuenta,
                                                          cod_bloqueo_2,
                                                          sld_actual,
                                                          sld_capital,
                                                          sld_mora_calc,
                                                          mto_linea_cred,
                                                          mto_disp_cred,
                                                          cnt_diAS_mora_sbs,
                                                          FLG_COMPRA_ESAFI,
                                                          est_registro,
                                                          fec_registro,
                                                          usu_registro
                                                         )
                                                         VALUES
                                                         (
                                                          v_cNro_Solicitud,
                                                          v_NUM_CUENTA_ORIGEN,
                                                          j.FEC_APERTURA_CUENTA,
                                                          j.COD_BLOQUEO_2,
                                                          v_nSld_Actual,            ---j.SALDO_ACTUAL,
                                                          v_nSld_Capital,           ---j.SALDO_CAPITAL,
                                                          v_nSld_Mora_Calc,         ---j.SALDO_MORA,
                                                          v_nMto_Linea_Cred,        ---j.LINEA_CREDITO,
                                                          v_nMto_Disp_Cred,         ---j.DISPONIBLE_CREDITO,
                                                          v_nCnt_DiAS_Mora_Sbs,     ---j.CANTIDAD_DIAS_MORA,
                                                          j.FLG_COMPRA_ESAFI,
                                                          1,
                                                          SYSDATE,
                                                          j.USU_REGISTRO
                                                         );
                                                          o_resultado_proc           := 'OK';
                                                         --
                                                      EXCEPTION
                                                        WHEN OTHERS THEN
                                                          o_resultado_proc           := 'Saldos' || SQLERRM;
                                                        ROLLBACK;
                                                        EXIT;
                                                      END;

                                                    END LOOP;

                                                    IF (v_cNro_Solicitud IS NOT NULL AND o_resultado_proc = 'OK') THEN

                                                        -- Sometemos los cambios...
                                                        select nvl(count(1),0) + 1 into v_nSecu_Dese from finan_lp_solicitud where trim(num_cuenta_origen) = trim(i.NUM_CUENTA_FUNO) and nro_solicitud <> v_cNro_Solicitud;
                                                        SELECT P.NRO_SOLICITUD INTO v_cNro_Solicitud FROM FINAN_LP_SOLICITUD P WHERE P.NRO_SOLICITUD=v_cNro_Solicitud;
                                                           BEGIN
                                                             INSERT INTO finan_lp_desembolso_entefe
                                                               ( nro_desembolso_ee,      --1
                                                                  FEC_DESEMBOLSO,        --2
                                                                  NRO_SECUENCIA,         --3
                                                                  NRO_SOLICITUD,         --4
                                                                  MON_DESEMBOLSO,        --5




                                                                  EST_ENVIO,             --10
                                                                  EST_EJECUCION,         --12
                                                                  EST_DESEMBOLSO,        --14
                                                                  EST_REGISTRO,          --15
                                                                  FEC_REGISTRO,          --16
                                                                  USU_REGISTRO,          --17
                                                                  MON_DESEMBOLSO_CAJA--18
                                                               )
                                                               VALUES (

                                                                 to_char(v_cNro_Solicitud), --1
                                                                  SYSDATE,
                                                                  v_nSecu_Dese, --3
                                                                  to_char(v_cNro_Solicitud), --4
                                                                  TO_NUMBER  (i.MON_SOLICITADO, '9999999999.99'), --5




                                                                  'P', --10
                                                                  'P', --12
                                                                  v_nEsta_Desem,  --14
                                                                  '1', --15
                                                                  ---v_cFecha_Actual, --16
                                                                  SYSDATE,
                                                                  i.USU_REGISTRO,     --17
                                                                  0                 --18
                                                                 );

                                                             COMMIT;

                                                             EXCEPTION
                                                               WHEN OTHERS THEN
                                                                    o_resultado_proc           := 'Desembolso' || SQLERRM;
                                                                 ROLLBACK;

                                                             END;
                                                             --
                                                             -- ASignamos el resultado del registro de la solicitud...
                                                        ELSE

                                                             ROLLBACK;

                                                        END IF;


                                                    END IF;

                                             END IF;

                                  ELSE
                                      -- ASignar resultado del proceso...
                                      o_resultado_proc:='Existe una solicitud de Linea de Paralela Aprobado.';
                                      --
                                  END IF; -- If Solicitudes Pendientes
                                  --
                         -- INI - NEW
                         ELSE

                             -- ASignar resultado del proceso...
                             o_resultado_proc:='La cuenta a Linea de Paralela  no corresponde al cliente.';
                             --
                         END IF;
                         -- FIN - NEW
                   END IF;
                         --
                         -- Enviamos resultado del proceso...
                   OPEN p_o_cResultado FOR
                        SELECT v_cNro_Solicitud        NRO_SOLICITUD,
                               o_resultado_proc        DES_RES_PROC
                        FROM DUAL;
                        --
                   --
              END LOOP;

   EXCEPTION

        WHEN ERROR_CONTROLADO THEN
             ROLLBACK;
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;

        WHEN OTHERS THEN
              -- Deshacemos los cambios...
              ROLLBACK;
              --
              -- ASignamos el resultado...
              CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM,1,100)));
              o_resultado_proc := CERROR;
              --
              -- Enviamos resultado del proceso...
              OPEN p_o_cResultado FOR
                   SELECT o_resultado_proc DES_RES_PROC
                   FROM   DUAL;
              --
   END PRC_REG_SOLICITUD_LP;




PROCEDURE PRC_CON_SOLLIN_PAR_X_CLI(        p_i_vTip_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Docum_Ide            IN VARCHAR2,
                                           p_i_vNum_Cuenta_TP            IN VARCHAR2,
                                           p_i_vEstado_Solicitud         IN VARCHAR2,
                                           p_i_vNro_Solicitud            IN VARCHAR2,
                                           p_o_CResultado             OUT c_Valores
                                        ) IS
    -- *****************************************************************************************
    -- Descripcion: Proceso que permitira consultar la solicitud Linea Paralela
    --              La informacion sera consultada en la tabla: EFINAN_SOLICITUD_LP.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters :  p_i_vTip_Docum_Ide          VARCHAR2   -->  Tipo de documento.
    --                     p_i_vNum_Docum_Ide          VARCHAR2   -->  Numero del documento.
    --                     p_i_vNum_Cuenta_TP          VARCHAR2   -->  Numero de Cuenta TP
    --                     p_i_vEstado_Solicitud       VARCHAR2   -->  Estado Solicitud
    --                     p_i_vNro_Solicitud          VARCHAR2   -->  Numero Solicitud
    -- Output Parameters:  pC_Resultado             CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    -- Declaracion de variables generales...
    v_cNum_Docum_Ide            VARCHAR2(20) := '';
    v_Cod_Interno               VARCHAR2(10) := '';
    v_nEst_Solicitud            NUMBER :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,TO_NUMBER(p_i_vEstado_Solicitud),'');             --> Estado pendiente de la solicitud...
    v_nTipo_Solicitante         NUMBER :=0;
    v_nContDoc                  NUMBER :=0;
    ---
    BEGIN
         -- Inicializando variables...
         v_cNum_Docum_Ide := '';
         --
         -- Validando ingreso del numero de documento...
         IF LENGTH(LTRIM(RTRIM(p_i_vNum_Docum_Ide))) < 8 THEN
            v_cNum_Docum_Ide := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
         ELSE
             IF LENGTH(LTRIM(RTRIM(p_i_vNum_Docum_Ide))) = 8 THEN
                 v_cNum_Docum_Ide := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
             ELSE
                 v_cNum_Docum_Ide := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
             END IF;
         END IF;
         --
         -- Consulta de la informacion...
         IF (p_i_vTip_Docum_Ide IS NOT NULL) AND (v_cNum_Docum_Ide IS NOT NULL) THEN
             -- Obtener el codigo interno del cliente...
             BEGIN
                 SELECT NVL(p.Cod_Interno,'') INTO v_Cod_Interno
                 FROM   puc_personAS p
                 WHERE  p.tip_docum_ide = p_i_vTip_Docum_Ide
                        AND p.num_docum_ide = v_cNum_Docum_Ide;
             EXCEPTION
                 WHEN No_Data_Found THEN
                      v_Cod_Interno := NULL;
                 WHEN OTHERS THEN
                      v_Cod_Interno := NULL;
             END;
             --
             IF ( (v_Cod_Interno IS NOT NULL) ) THEN


                 OPEN p_o_CResultado FOR
                     select
                            LP.NRO_SOLICITUD                                                       	    ,
                            LP.COD_TIPO_DESEMBOLSO                                                      ,
                            to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY')             AS FEC_SOLICITUD         ,
                            LP.NRO_SECUENCIA                                                            ,
                            LP.COD_INTERNO                                                              ,
                            LP.TIP_PRODUCTO                                                             ,
                            LP.NUM_CUENTA_ORIGEN                                          	            ,
                            nvl(LP.MON_ASIGNADO                         ,0  )  AS MON_ASIGNADO 		      ,
                            nvl(LP.MON_MINIMO_ASIGNADO                  ,0  )  AS MON_MINIMO_ASIGNADO   ,
                            nvl(LP.MON_SOLICITADO                       ,0  )  AS MON_SOLICITADO        ,
                            nvl(LP.COD_TASA_COMPRAS                     ,0  )  AS COD_TASA_COMPRAS      ,
                            nvl(LP.COD_TASA_DISP_EFEC                   ,0	)  AS COD_TASA_DISP_EFEC    ,
                            nvl(LP.NUM_CUOTA_LP                         ,0	)  AS NUM_CUOTA_LP          ,
                            nvl(LP.MON_CUOTA_LP                         ,0	)  AS MON_CUOTA_LP          ,
                            nvl(LP.COD_VENDEDOR                         ,0	)  AS COD_VENDEDOR          ,
                            nvl(LP.COD_AGENCIA                          ,0	)  AS COD_AGENCIA           ,
                            nvl(LP.DES_CAMPANA                          ,' ')  AS DES_CAMPANA           ,
                            nvl(LP.EST_CAMPANA                          ,' ')  AS EST_CAMPANA           ,
                            nvl(LP.NUM_CUENTA_LP                        ,' ')  AS NUM_CUENTA_LP         ,
                            nvl(LP.EST_ENVIO                            ,' ')  AS EST_ENVIO             ,
                            nvl(to_char(LP.FEC_ENVIO,'DD/MM/YYYY')      ,' ')  AS FEC_ENVIO             ,
                            nvl(LP.EST_EJECUCION                        ,' ')  AS EST_EJECUCION         ,
                            nvl(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY')  ,' ')  AS FEC_EJECUCION         ,
                            nvl(LP.EST_SOLICITUD                        ,0  )  AS EST_SOLICITUD         ,
                            nvl(LP.EST_REGISTRO                         ,0  )  AS EST_REGISTRO          ,
                            nvl(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')   ,' ')  AS FEC_REGISTRO          ,
                            nvl(LP.USU_REGISTRO                         ,' ')  AS USU_REGISTRO          ,
                            nvl(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') AS FEC_ACTUALIZACION    ,
                            nvl(LP.USU_ACTUALIZACION                    ,' ')  AS USU_ACTUALIZACION     ,
                            NVL(
                            ( SELECT ss.c_desc_sucur
                              FROM ESAC.SAC_SUCURSAL   SS
                              WHERE LP.COD_AGENCIA   = SS.N_ID_SUCUR)   ,' ')  AS c_desc_sucur          ,
                            NVL(
                            ( SELECT SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50)
                              FROM    PUC_PARAMETROS PA
                              WHERE   PA.COD_TABLA = 240
                              AND PA.Cod_Parametro = LP.Est_Solicitud)  ,' ')  AS DES_ESTADO_SOLICITUD  ,
                            NVL(
                            ( SELECT ta.val_tASa
                              FROM finan_lp_tASa ta
                              WHERE ta.cod_tASa = LP.cod_tASa_comprAS)   ,0 ) AS MONTO_TASA_COMPRAS     ,
                            nvl(
                            ( SELECT ta.val_tASa
                              FROM finan_lp_tASa ta
                              WHERE ta.cod_tASa = LP.cod_tASa_disp_efec) ,0 ) AS MONTO_TASA_DIS_EFEC    ,
                            NVL(
                            ( SELECT tv.des_tipo_vendedor
                              FROM finan_tipo_vendedor tv
                              WHERE
                              tv.cod_tipo_vendedor = LP.Cod_Tipo_Vendedor),0 ) AS Desc_Tipo_Vendedor    ,
                            NVL(td.des_tipo_desembolso                   ,' ') AS des_tipo_desembolso   ,
                            NVL(LP.Flag_Seguro                           ,0) AS Flag_Seguro

                            FROM   finan_lp_solicitud LP
                                   inner join finan_lp_tipo_desembolso td
                                   on td.cod_tipo_desembolso= LP.cod_tipo_desembolso
                            WHERE  LP.Cod_Interno             =   v_Cod_Interno
                                   AND LP.Num_Cuenta_Origen     =   p_i_vNum_Cuenta_TP
                                   AND LP.Est_Solicitud    !=   v_nEst_Solicitud
                                   AND (LP.NRO_SOLICITUD =p_i_vNro_Solicitud
                                       OR NVL(p_i_vNro_Solicitud,' ')=' ')
                            ORDER  BY LP.NRO_SOLICITUD ;

             ELSE
                 -- Para generar error...
                 OPEN p_o_CResultado FOR
                      SELECT ' '                   NUM_SOLICITUD_REFIN,
                             0                     SLD_REFINANCIAMIENTO,
                             0                     NUM_MESES_REF,
                             ' '                   NUM_BOLETA_BNP,
                             0                     NUM_MONTO_BNP,
                             'SIN AGENCIA'         DES_COD_AGENCIA,
                             'SIN EXON.'           DES_EXONERACION_SOLICITUD,
                             0                     MONTO_MINIMO_EXI,
                             'SIN TASA'            DES_MULTIPROD,
                             0                     MONTO_CUOTA_REF
                      FROM   finan_lp_solicitud PR
                      WHERE  PR.COD_INTERNO        =  '99999999'
                             AND PR.Num_Cuenta_Origen  =  '00000000';
             END IF;
         END IF;
    EXCEPTION
         WHEN OTHERS THEN
              ROLLBACK;
              --
              -- Para generar error...
              OPEN p_o_CResultado FOR
                      SELECT ' '                   NUM_SOLICITUD_REFIN,
                             0                     SLD_REFINANCIAMIENTO,
                             0                     NUM_MESES_REF,
                             ' '                   NUM_BOLETA_BNP,
                             0                     NUM_MONTO_BNP,
                             'SIN AGENCIA'         DES_COD_AGENCIA,
                             'SIN EXON.'           DES_EXONERACION_SOLICITUD,
                             0                     MONTO_MINIMO_EXI,
                             'SIN TASA'            DES_MULTIPROD,
                             0                     MONTO_CUOTA_REF
                      FROM   PUC_REFINANCIADo PR
                      WHERE  PR.COD_INTERNO        =  '99999999'
                             AND PR.NUM_CUENTA_FUNO  =  '00000000';
              --
    END PRC_CON_SOLLIN_PAR_X_CLI;

  PROCEDURE PRC_OBT_SOLICITUD_LP(
                                         p_i_vNRO_SOLICITUD IN VARCHAR,
                                         p_i_nTIP_DOCUM_IDE IN NUMBER,
                                         p_i_vNUM_DOCUM_IDE IN VARCHAR,
                                         p_i_vAPE_PATERNO   IN VARCHAR,
                                         p_i_vAPE_MATERNO   IN VARCHAR,
                                         p_i_vPRI_NOMBRE    IN VARCHAR,
                                         p_i_vSEG_NOMBRE    IN VARCHAR,
                                         p_i_vTip_Producto  IN VARCHAR2,
                                         p_i_vNum_Cuenta    IN VARCHAR2,
                                         p_i_vNum_Tarjeta   IN VARCHAR2,
                                         p_i_nNum_Elemnto  IN number,
                                         p_o_cResultado  OUT c_Valores
                                  ) IS

  /*
    -- *****************************************************************************************
    -- Descripcion: Proceso que permitira consulta una solicitud de Linea Paralels.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters :
                       p_i_vNRO_SOLICITUD    VARCHAR -->  Numero de Solicitud.
                       p_i_nTIP_DOCUM_IDE    NUMBER -->   Tipo de Documento.
                       p_i_vNUM_DOCUM_IDE    VARCHAR -->  Numero de Documento de Identidad.
                       p_i_vAPE_PATERNO      VARCHAR -->  Apellido Parteno.
                       p_i_vAPE_MATERNO      VARCHAR -->  Apellidos Materno.
                       p_i_vPRI_NOMBRE       VARCHAR -->  Primer Nombre.
                       p_i_vSEG_NOMBRE       VARCHAR -->   Segundo Nombre.
                       p_i_vTip_Producto     VARCHAR2 -->  Tipo producto.
                       p_i_vNum_Cuenta       VARCHAR2 -->  Numero de Cuenta.
                       p_i_vNum_Tarjeta      VARCHAR2 -->  Numero tarjeta.
                       p_i_nNum_Elemnto     number    --> Cod_Elemento Puc_parametro

    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */
    -- Declaracion de variables generales...
    v_cGlosa_Solicitud               VARCHAR2(3000) := '';
    v_Tip_Producto                   number(3):=0;
    v_Esta_Solicitud                 number(6);
    --
  BEGIN


  v_Esta_Solicitud:= FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,p_i_nNum_Elemnto,'');
  /*if p_Tip_Producto=0 then
    begin
      v_Tip_Producto:=null;
      end;
      else
        begin
          v_Tip_Producto:= to_number(p_Tip_Producto);
          end;
    end if;
    */
    OPEN p_o_cResultado FOR
      SELECT  distinct
             NVL(F.NUM_DOCUM_IDE                                   ,' ')  NUM_DOCUM_IDE           ,
             NVL(F.APE_PATERNO                                     ,' ')  APE_PATERNO             ,
             NVL(F.APE_MATERNO                                     ,' ')  APE_MATERNO             ,
             NVL(F.PRI_NOMBRE                                      ,' ')  PRI_NOMBRE              ,
             NVL(F.SEG_NOMBRE                                      ,' ')  SEG_NOMBRE              ,
             NVL(F.TIP_DOCUM_IDE                                   ,0)  TIP_DOCUM_IDE           ,

             NVL(
             ( SELECT NVL(P.VAL_CAD_LARGO,'')
               FROM PUC_PARAMETROS P
               WHERE P.COD_TABLA = 1
               AND P.COD_PARAMETRO = F.TIP_DOCUM_IDE)              ,' ')  DES_DOC_IDE             ,
             NVL(
             ( SELECT SUBSTR(NVL(PA.DES_ELEMENTO,''),0,50)
               FROM    PUC_PARAMETROS PA
               WHERE   PA.COD_TABLA = 240
                        AND PA.Cod_Parametro = LP.Est_Solicitud)   ,' ')  DES_ESTADO_SOLICITUD    ,
              NVL(
              ( SELECT ss.c_desc_sucur
                FROM ESAC.SAC_SUCURSAL   SS
                WHERE LP.COD_AGENCIA   = SS.N_ID_SUCUR)            ,' ')  c_desc_sucur            ,
              NVL(LP.NRO_SOLICITUD                                 ,' ')  NRO_SOLICITUD           ,
              NVL(LP.COD_TIPO_DESEMBOLSO                           ,0  )  COD_TIPO_DESEMBOLSO     ,
              NVL(to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY')           ,' ')  FEC_SOLICITUD           ,
              NVL(LP.NRO_SECUENCIA                                 ,0  )  NRO_SECUENCIA           ,
              NVL(LP.COD_INTERNO                                   ,0  )  COD_INTERNO             ,
              NVL(LP.TIP_PRODUCTO                                  ,0)  TIP_PRODUCTO            ,
              NVL(LP.NUM_CUENTA_ORIGEN                             ,' ')  NUM_CUENTA_ORIGEN       ,
              NVL(LP.MON_ASIGNADO                                  ,0  )  MON_ASIGNADO            ,
              NVL(LP.MON_MINIMO_ASIGNADO                           ,0  )  MON_MINIMO_ASIGNADO     ,
              NVL(LP.MON_SOLICITADO                                ,0  )  MON_SOLICITADO          ,
              NVL(LP.COD_TASA_COMPRAS                              ,0  )  COD_TASA_COMPRAS        ,
              NVL(LP.COD_TASA_DISP_EFEC                            ,0  )  COD_TASA_DISP_EFEC      ,
              NVL(LP.NUM_CUOTA_LP                                  ,0  )  NUM_CUOTA_LP            ,
              NVL(LP.MON_CUOTA_LP                                  ,0  )  MON_CUOTA_LP            ,
              NVL(LP.COD_VENDEDOR                                  ,0  )  COD_VENDEDOR            ,
              NVL(LP.COD_AGENCIA                                   ,0  )  COD_AGENCIA             ,
              NVL(LP.DES_CAMPANA                                   ,' ')  DES_CAMPANA             ,
              NVL(LP.EST_CAMPANA                                   ,' ')  EST_CAMPANA             ,
              NVL(LP.NUM_CUENTA_LP                                 ,' ')  NUM_CUENTA_LP           ,
              NVL(LP.EST_ENVIO                                     ,' ')  EST_ENVIO               ,
              NVL(to_char(LP.FEC_ENVIO,'DD/MM/YYYY')               ,' ')  FEC_ENVIO               ,
              NVL(LP.EST_EJECUCION                                 ,' ')  EST_EJECUCION           ,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY')           ,' ')  FEC_EJECUCION           ,
              NVL(LP.EST_SOLICITUD                                 ,0  )  EST_SOLICITUD           ,
              NVL(LP.EST_REGISTRO                                  ,0  )  EST_REGISTRO            ,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')            ,' ')  FEC_REGISTRO            ,
              NVL(LP.USU_REGISTRO                                  ,' ')  USU_REGISTRO            ,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY')       ,' ')  FEC_ACTUALIZACION       ,
              NVL(LP.USU_ACTUALIZACION                             ,' ')  USU_ACTUALIZACION

              FROM   finan_lp_solicitud LP
              INNER JOIN PUC_PERSONAS    F
              ON    LP.COD_INTERNO       = F.COD_INTERNO
              INNER JOIN PUC_PersonAS_Prod  A
              ON    (F.tip_docum_ide      = A.tip_docum_ide
                     AND F.NUM_DOCUM_IDE  = A.NUM_DOCUM_IDE)
              WHERE
                    (LP.NRO_SOLICITUD    = p_i_vNRO_SOLICITUD OR
                    NVL(p_i_vNRO_SOLICITUD, ' ') = ' ')
               AND (F.TIP_DOCUM_IDE 	  = p_i_nTIP_DOCUM_IDE OR
                   NVL(p_i_nTIP_DOCUM_IDE, 0) = 0)
               AND (F.NUM_DOCUM_IDE     = p_i_vNUM_DOCUM_IDE OR
                   NVL(p_i_vNUM_DOCUM_IDE, ' ') = ' ')
               AND (UPPER(F.APE_PATERNO) LIKE UPPER(p_i_vAPE_PATERNO) OR
                   NVL(p_i_vAPE_PATERNO, ' ') = ' ')
               AND (UPPER(F.APE_MATERNO) LIKE UPPER(p_i_vAPE_MATERNO) OR
                   NVL(p_i_vAPE_MATERNO, ' ') = ' ')
               AND (UPPER(F.PRI_NOMBRE) LIKE UPPER (p_i_vPRI_NOMBRE) OR
                   NVL(p_i_vPRI_NOMBRE, ' ') = ' ')
               AND (UPPER(F.SEG_NOMBRE) LIKE UPPER (p_i_vSEG_NOMBRE) OR
                   NVL(p_i_vSEG_NOMBRE, ' ') = ' ')
               AND (A.Tip_Producto        = p_i_vTip_Producto OR
                   NVL(p_i_vTip_Producto, 0) = 0 )
               AND (A.Num_Cuenta          =  p_i_vNum_Cuenta OR
                   NVL(p_i_vNum_Cuenta,' ')=' ')
               AND (A.NUM_TARJETA         = p_i_vNum_Tarjeta OR
                   NVL(p_i_vNum_Tarjeta,' ')=' ' )
               AND LP.Est_Solicitud      != v_Esta_Solicitud
               AND LP.EST_REGISTRO        = 1
               AND F.Est_Registro         = 1
         ORDER BY TO_NUMBER(NRO_SOLICITUD) DESC;


         --
  END;

--
    -- *****************************************************************************************
    -- Descripcion: Proceso que permite anular una solicitud de linea paralela
    --              cambiando el estado del solicitud y del Desembolso
    -- Input Parameters :  p_i_vNRO_SOLICITUD      --> Numero de Solicitu LP
    --                     p_i_vUSU_ACTUALIZACION  --> Usuario que realiza la Anulación.

    -- Output Parameters:  p_o_cResultado          -- resultado
    -- Author     : Eduardo Zuñiga gamarra.
    -- Proyecto   : Sistema PUC
    -- Responsable: Oswaldo Valdivia.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 14/03/2014    E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---

PROCEDURE PRC_ANU_SOL_LIN_PAR (        p_i_vNRO_SOLICITUD             IN    VARCHAR2,
                                       p_i_vUSU_ACTUALIZACION     IN    VARCHAR2,
                                       p_o_cResultado                   OUT c_Valores)
IS
      CERROR                VARCHAR2(1000);
      ERROR_CONTROLADO      EXCEPTION;
      v_Esta_LP             Number(6);
      v_Esta_LP_Nro         Number(6);
      v_Esta_Pend_Dese      Number(6);
      v_Esta_Desembolsada   Number(6);
      v_Tipo_Desembolso     finan_lp_solicitud.cod_tipo_desembolso%TYPE;
      v_FechaRegistro      date;
      v_FechadeHoy         date;
BEGIN


     select p.fec_registro into v_FechaRegistro
     from finan_lp_solicitud p
     where p.nro_solicitud=p_i_vNRO_SOLICITUD;

     select Sysdate into v_FechadeHoy
     from dual;

     v_Esta_LP_Nro       :=0;
     v_Tipo_Desembolso   :=0;
     v_Esta_Pend_Dese    :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,3,'');
     v_Esta_Desembolsada :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,4,'');

     v_Esta_LP           :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');

     SELECT  lp.EST_SOLICITUD
       INTO  v_Esta_LP_Nro
       FROM  FINAN_LP_SOLICITUD lp
      WHERE  lp.nro_solicitud=p_i_vNRO_SOLICITUD;

     SELECT  lp.cod_tipo_desembolso
       INTO  v_Tipo_Desembolso
       FROM  FINAN_LP_SOLICITUD lp
      WHERE  lp.nro_solicitud=p_i_vNRO_SOLICITUD;

     -- INI - NEW - 06052014
     -- ELIMINAR ANULACION POR DIA DE PROCESO...
     
     -----IF To_date(v_FechaRegistro) = to_date(v_FechadeHoy) THEN

     UPDATE FINAN_LP_SOLICITUD
     SET    EST_SOLICITUD =v_Esta_LP,  --Anulado
            FEC_ACTUALIZACION     = SYSDATE,
            USU_ACTUALIZACION     = p_i_vUSU_ACTUALIZACION
      WHERE  NRO_SOLICITUD        = p_i_vNRO_SOLICITUD
             AND EST_REGISTRO     = 1
             AND EST_SOLICITUD != v_Esta_LP;
     --        
     IF SQL%ROWCOUNT = 0 THEN
                RAISE  ERROR_CONTROLADO;
     END IF;

     IF v_Esta_LP_Nro=v_Esta_Pend_Dese  or  v_Esta_LP_Nro=v_Esta_Desembolsada then

        IF v_Tipo_Desembolso=1 THEN
          UPDATE finan_lp_desembolso_entefe
          SET    est_desembolso=v_Esta_LP,
                 FEC_ACTUALIZACION     = SYSDATE,
                 USU_ACTUALIZACION     = p_i_vUSU_ACTUALIZACION
          WHERE  nro_solicitud=p_i_vNRO_SOLICITUD;
        END IF;
     END IF;

     IF SQL%ROWCOUNT = 0 THEN
                RAISE  ERROR_CONTROLADO;
     END IF;

     COMMIT;
     --
     OPEN p_o_cResultado FOR
          SELECT 'OK' AS DES_RES_PROC FROM DUAL;
          
     -----ELSE

       /*ROLLBACK;
       CERROR := '¡La Solicitud no puede ser anulada, por tener un fecha de registro diferente al dia de Hoy!';
       OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;*/

     -----END IF;


EXCEPTION
       WHEN ERROR_CONTROLADO THEN
             ROLLBACK;
             CERROR := 'ERROR: NO SE ANULO LA SOLICITUD';
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
       WHEN OTHERS THEN
             ROLLBACK;
             CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
END PRC_ANU_SOL_LIN_PAR;


PROCEDURE PRC_LIS_TIPO_VENDEDOR (  p_o_cResultado                   OUT c_Valores)
IS
      CERROR                VARCHAR2(100);
      ERROR_CONTROLADO      EXCEPTION;
BEGIN

      OPEN p_o_cResultado FOR
      SELECT nvl(COD_TIPO_VENDEDOR,0) COD_TIPO_VENDEDOR,
             nvl(DES_TIPO_VENDEDOR,' ') DES_TIPO_VENDEDOR,
             nvl(EST_REGISTRO,0)  EST_REGISTRO

       FROM FINAN_TIPO_VENDEDOR  tv
      WHERE tv.est_registro=1
             ;

EXCEPTION
       WHEN ERROR_CONTROLADO THEN
             ROLLBACK;
             CERROR := 'ERROR: ERROR AL CONSULTAR TIPO VENDEDOR';
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
       WHEN OTHERS THEN
             ROLLBACK;
             CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
END PRC_LIS_TIPO_VENDEDOR;


PROCEDURE PRC_LIS_TASAS_LP (  p_i_vCOD_TASA                    IN VARCHAR2,
                              p_o_cResultado                   OUT c_Valores
                            )
IS
      CERROR                VARCHAR2(100);
      ERROR_CONTROLADO      EXCEPTION;
BEGIN

      OPEN p_o_cResultado FOR
      SELECT nvl(COD_TASA,' ') COD_TASA,
            nvl(DES_TASA,' ') DES_TASA,
            nvl(VAL_TASA,0) VAL_TASA,
            nvl(EST_REGISTRO,0) EST_REGISTRO

            FROM FINAN_LP_TASA TA WHERE TA.COD_TASA=p_i_vCOD_TASA
            AND TA.EST_REGISTRO=1
             ;

EXCEPTION
       WHEN ERROR_CONTROLADO THEN
             ROLLBACK;
             CERROR := 'ERROR: ERROR AL CONSULTAR TASAS LP';
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
       WHEN OTHERS THEN
             ROLLBACK;
             CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
END PRC_LIS_TASAS_LP;



    -- *****************************************************************************************
    -- Descripcion: Proceso que permite obtener el monto asignado y tipo de tasa de efectivo para
    --              un cliente en especifico, de la tabla PMCP_CTAS_LPAR, cuyos datos han sido proporcionados desde un archivo

    -- Input Parameters :  p_i_vTIP_DOCUM_IDE      --> Tipo de Documento de Identidad
    --                     p_i_vP_NUM_DOCUM_IDE    --> Numero de Documento de Identidad

    -- Output Parameters:  p_o_cResultado          -- resultado
    -- Author     : Eduardo Zuñiga gamarra.
    -- Proyecto   : Sistema PUC  - Solicitud Linea Paralela
    -- Responsable: Oswaldo Valdivia.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 14/03/2014    E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---

PROCEDURE PRC_CON_MONT_ASIG (      p_i_vTIP_DOCUM_IDE    IN VARCHAR,
                                   p_i_vP_NUM_DOCUM_IDE  IN VARCHAR,
                                   p_o_cResultado        OUT c_Valores)
IS
      CERROR                VARCHAR2(100);
      ERROR_CONTROLADO      EXCEPTION;
      v_TipoDoc_Equiv_Funo  EFINAN_TEMP_EQUIV_DOCUMENTOS.TIP_DOCUM_IDE_PMCP%TYPE;
      v_Docu_Ident          PMCP_CTAS_LPAR.NUM_DOC%TYPE;
BEGIN

      SELECT  equi_doc.tip_docum_ide_pmcp        
        INTO  v_TipoDoc_Equiv_Funo
        FROM  EFINAN_TEMP_EQUIV_DOCUMENTOS equi_doc
       WHERE  equi_doc.tip_docum_ide_puc           =  TO_NUMBER(p_i_vTIP_DOCUM_IDE,'999999') 
         AND  rownum <= 1;
      
      v_Docu_Ident:='0000'|| p_i_vP_NUM_DOCUM_IDE;
      
      
      OPEN p_o_cResultado FOR
      SELECT  nvl(NUM_LOTE,0)                    NUM_LOTE,
              nvl(NUM_CUENTA,' ')                NUM_CUENTA,
              nvl(TIP_DOC,' ')                   TIP_DOC,
              nvl(NUM_DOC,' ')                   NUM_DOC,
              nvl(MTO_LINEA,0)                   MTO_LINEA,
              nvl(EST_DATOS,0)                   EST_DATOS,
             
              NVL(COD_PCT,' ')                   COD_PCT

        FROM PMCP_CTAS_LPAR clp
       WHERE clp.tip_doc=TO_CHAR(v_TipoDoc_Equiv_Funo) 
         AND clp.num_doc=TO_CHAR(v_Docu_Ident)
         AND clp.est_datos=1;

EXCEPTION
       WHEN ERROR_CONTROLADO THEN
             ROLLBACK;
             CERROR := 'ERROR: ERROR AL CONSULTAR TASAS LP';
             OPEN p_o_cResultado 
              FOR SELECT  CERROR AS DES_RES_PROC 
                    FROM  DUAL;
       WHEN OTHERS THEN
             ROLLBACK;
             CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
             OPEN p_o_cResultado 
              FOR SELECT  CERROR AS DES_RES_PROC 
                    FROM  DUAL;
END PRC_CON_MONT_ASIG;

/*PROCEDURE PRC_CON_LP_FILTROS(
                                         p_i_vNUMERO_PAGINA    NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO       VARCHAR2,
                                         p_i_vFEC_FINAL        VARCHAR2,
                                         p_i_vCOD_AGENCIA      FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,
                                         p_i_vESTADO_SOLICITUD FINAN_LP_SOLICITUD.EST_SOLICITUD%TYPE,
                                         p_o_cResultado        OUT c_Valores
                                        ) IS

   \*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS GeneradAS.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters :
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                       p_i_vESTADO_SOLICITUD FINAN_LP_SOLICITUD.EST_SOLICITUD%TYPE --> estado Solicitud

    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    *\

    v_nTOTAL_REGISTROS    NUMBER;
    v_nTOTAL_PAGINAS      NUMBER;
    v_nCantidad_Registros NUMBER := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial   NUMBER;
    v_nRegistro_Final     NUMBER;
    v_bFLAG_VACIO         BOOLEAN;
   -- v_nEST_LOTE_CERRADO FINAN_CD_CAB_LOTE.EST_LOTE%TYPE;
    --v_nEST_LOTE_EN_PROCESO FINAN_CD_CAB_LOTE.EST_LOTE%TYPE;
    v_datetime            DATE;

  BEGIN

  v_datetime:=TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT

             nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
             nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
             nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
             nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0) TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
             NVL(
             ( SELECT P.VAL_CAD_LARGO
               FROM PUC_PARAMETROS P
               WHERE P.COD_TABLA = 1
                 AND P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
             NVL(
             ( SELECT SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50)
               FROM    PUC_PARAMETROS PA
               WHERE   PA.COD_TABLA = 240
                 AND PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,

              NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
              NVL(to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
              NVL(LP.MON_ASIGNADO                        ,0  ) MON_ASIGNADO,
              NVL(LP.MON_MINIMO_ASIGNADO                 ,0  ) MON_MINIMO_ASIGNADO,
              NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
              NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
              NVL(LP.DES_CAMPANA                         ,' ') DES_CAMPANA,
              NVL(LP.EST_CAMPANA                         ,' ') EST_CAMPANA,
              NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
              NVL(LP.EST_ENVIO                           ,' ') EST_ENVIO,
              NVL(to_char(LP.FEC_ENVIO,'DD/MM/YYYY')     ,' ') FEC_ENVIO,
              NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
              NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
              NVL(
              ( SELECT  ss.c_desc_sucur
                  FROM  ESAC.SAC_SUCURSAL   SS
                 WHERE  LP.COD_AGENCIA   = SS.N_ID_SUCUR)  ,' ') C_DESC_SUCUR,

              NVL(
              ( SELECT  TD.DES_TIPO_DESEMBOLSO
                  FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                 WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ')  DES_TIPO_DESEMBOLSO,
                NVL(
                     (SELECT  TO_CHAR(PMS.CIC_FACTURACION)
                        FROM  PMCP_SALDOS PMS
                       WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' )      FEC_CORTE,
                LP.NUM_CUENTA_LP                               NUM_CUENTA_LP,
                NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ')    NUM_TARJETA_LP,
                NVL(LP.MON_SEGURO,0)                                              MON_SEGURO,
                NVL(LP.NUM_CUOTA_SEG,0)                                           NUM_CUOTA_SEG,
                NVL(LP.MON_CUOTA_SEG,0)                                           MON_CUOTA_SEG,
                NVL(
                   (SELECT  T.VAL_TASA
                      FROM  FINAN_LP_TASA T
                     WHERE  T.COD_TASA=LP.COD_TASA_DISP_EFEC),0)                    VAL_TASA_SEG,
                NVL(( SELECT tv.des_tipo_vendedor
                              FROM finan_tipo_vendedor tv
                              WHERE
                              tv.cod_tipo_vendedor = LP.Cod_Tipo_Vendedor),'' ) AS Desc_Tipo_Vendedor
              FROM   finan_lp_solicitud LP,
                     PUC_PERSONAS           F
              WHERE
                LP.COD_INTERNO = F.COD_INTERNO
                AND LP.FEC_SOLICITUD BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND (LP.Est_Solicitud = p_i_vESTADO_SOLICITUD OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND LP.EST_REGISTRO = 1
                AND F.Est_Registro = 1
           ORDER BY TO_NUMBER(LP.NRO_SOLICITUD) ASc;

        ELSE

            -- Establecer variables
            BEGIN

                SELECT   COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                  INTO   v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                  FROM   finan_lp_solicitud LP,
                         PUC_PERSONAS           F
              WHERE  LP.COD_INTERNO = F.COD_INTERNO
                AND  LP.FEC_SOLICITUD BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND  (LP.Est_Solicitud = p_i_vESTADO_SOLICITUD OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND  LP.EST_REGISTRO = 1
                AND  F.Est_Registro = 1
          ORDER BY  LP.NRO_SOLICITUD DESC;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final   := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
             SELECT DISTINCT
             NVL(F.NUM_DOCUM_IDE                         	     ,' ') NUM_DOCUM_IDE,
             NVL(F.APE_PATERNO                                 ,' ') APE_PATERNO,
             NVL(F.APE_MATERNO                                 ,' ') APE_MATERNO,
             NVL(F.PRI_NOMBRE                                  ,' ') PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                                  ,' ') SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                               ,0) TIP_DOCUM_IDE,

             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE)          ,' ') DES_DOC_IDE,
             NVL(
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,''),0,50)
                 FROM  PUC_PARAMETROS PA
                WHERE  PA.COD_TABLA = 240
                  AND  PA.Cod_Parametro = LP.Est_Solicitud)      ,'') DES_ESTADO_SOLICITUD,

              NVL(LP.NRO_SOLICITUD                             ,' ') NRO_SOLICITUD ,
              NVL(LP.COD_TIPO_DESEMBOLSO                       ,0) COD_TIPO_DESEMBOLSO,
              NVL(to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY')       ,' ') AS FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                             ,0  ) NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                               ,' ') COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                              ,0  ) TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                         ,' ') NUM_CUENTA_ORIGEN,
              NVL(LP.MON_ASIGNADO                              ,0  ) MON_ASIGNADO ,
              NVL(LP.MON_MINIMO_ASIGNADO                       ,0  ) MON_MINIMO_ASIGNADO,
              NVL(LP.MON_SOLICITADO                            ,0  ) MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                          ,' ') COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                        ,' ') COD_TASA_DISP_EFEC,
              NVL(LP.NUM_CUOTA_LP                              ,0  ) NUM_CUOTA_LP,
              NVL(LP.MON_CUOTA_LP                              ,0  ) MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                              ,0  ) COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                               ,0  ) COD_AGENCIA,
              NVL(LP.DES_CAMPANA                               ,' ') DES_CAMPANA,
              NVL(LP.EST_CAMPANA                               ,' ') EST_CAMPANA,
              NVL(LP.NUM_CUENTA_LP                             ,' ') NUM_CUENTA_LP,
              NVL(LP.EST_ENVIO                                 ,' ') EST_ENVIO,
              NVL(to_char(LP.FEC_ENVIO,'DD/MM/YYYY')           ,' ') FEC_ENVIO,
              NVL(LP.EST_EJECUCION                             ,' ') EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY')       ,' ') FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                             ,0  ) EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                              ,0  ) EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')        ,' ') FEC_REGISTRO,
              NVL(LP.USU_REGISTRO                              ,' ') USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY')   ,' ') FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                         ,' ') USU_ACTUALIZACION,
              NVL(
              ( SELECT  ss.c_desc_sucur
                  FROM  ESAC.SAC_SUCURSAL   SS
                 WHERE  LP.COD_AGENCIA   = SS.N_ID_SUCUR)      ,' ') C_DESC_SUCUR
              ,NVL(v_nTotal_PaginAS                            ,0  ) TOTAL_PAGINAS
              ,NVL(v_nTotal_Registros                          ,0  ) TOTAL_REGISTROS
              ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(LP.NRO_SOLICITUD )),0) AS RN

              FROM   finan_lp_solicitud LP,
                     PUC_PERSONAS           F
              WHERE  LP.COD_INTERNO           = F.COD_INTERNO
                AND  LP.FEC_SOLICITUD   BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND  (LP.COD_AGENCIA      = p_i_vCOD_AGENCIA          OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND  (LP.Est_Solicitud    = p_i_vESTADO_SOLICITUD     OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND  LP.EST_REGISTRO      = 1
                AND  F.Est_Registro       = 1


            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY X.NRO_SOLICITUD ASC;

        END IF;

         --
  END;*/


  -- INI - NEW - 25042014
  
  PROCEDURE PRC_CON_LP_FILTROS(     
                                         p_i_vNUMERO_PAGINA    NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO       VARCHAR2,
                                         p_i_vFEC_FINAL        VARCHAR2,
                                         p_i_vCOD_AGENCIA      FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,
                                         p_i_vESTADO_SOLICITUD FINAN_LP_SOLICITUD.EST_SOLICITUD%TYPE,              
                                         p_o_cResultado        OUT c_Valores
                                        ) IS
  
   /*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS GeneradAS.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters : 
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                       p_i_vESTADO_SOLICITUD FINAN_LP_SOLICITUD.EST_SOLICITUD%TYPE --> estado Solicitud

    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */
    
    v_nTOTAL_REGISTROS        NUMBER;
    v_nTOTAL_PAGINAS          NUMBER;
    v_nCantidad_Registros     NUMBER := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial       NUMBER;
    v_nRegistro_Final         NUMBER;
    v_bFLAG_VACIO             BOOLEAN;
   -- v_nEST_LOTE_CERRADO FINAN_CD_CAB_LOTE.EST_LOTE%TYPE;
    --v_nEST_LOTE_EN_PROCESO FINAN_CD_CAB_LOTE.EST_LOTE%TYPE;
    v_datetime                DATE;
    
  BEGIN
       
  v_datetime                  :=TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT 
             
             NVL(F.APE_PATERNO                          ,' ') APE_PATERNO,
             NVL(F.APE_MATERNO                          ,' ') APE_MATERNO,
             NVL(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0) TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
             NVL( 
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                 FROM  PUC_PARAMETROS PA 
                WHERE  PA.COD_TABLA = 240 
                  AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                 
              NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
              NVL(TO_CHAR(LP.FEC_SOLICITUD,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
              NVL(LP.MON_ASIGNADO                        ,0  ) MON_ASIGNADO,
              NVL(LP.MON_MINIMO_ASIGNADO                 ,0  ) MON_MINIMO_ASIGNADO,
              NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
              NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
              NVL(LP.DES_CAMPANA                         ,' ') DES_CAMPANA,
              NVL(LP.EST_CAMPANA                         ,' ') EST_CAMPANA,
              NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
              NVL(LP.EST_ENVIO                           ,' ') EST_ENVIO,
              NVL(to_char(LP.FEC_ENVIO,'DD/MM/YYYY')     ,' ') FEC_ENVIO,
              NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
              NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
              NVL( 
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL   SS  
                 WHERE  LP.COD_AGENCIA   = SS.N_ID_SUCUR)  ,' ') C_DESC_SUCUR,
                
               NVL(
               (SELECT  TD.DES_TIPO_DESEMBOLSO
                  FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                 WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ')  DES_TIPO_DESEMBOLSO,
                NVL(
               (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                  FROM  PMCP_SALDOS PMS
                 WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' )            FEC_CORTE,
                LP.NUM_CUENTA_LP                                                   NUM_CUENTA_LP,
                NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ')    NUM_TARJETA_LP,
                NVL(LP.MON_SEGURO,0)                                              MON_SEGURO,
                NVL(LP.NUM_CUOTA_SEG,0)                                           NUM_CUOTA_SEG,
                NVL(LP.MON_CUOTA_SEG,0)                                           MON_CUOTA_SEG,
                NVL(
                (SELECT  T.VAL_TASA 
                   FROM  FINAN_LP_TASA T
                  WHERE  T.COD_TASA=LP.COD_TASA_DISP_EFEC),0)                      VAL_TASA_SEG,
                NVL(
                (SELECT  tv.des_tipo_vendedor 
                   FROM  finan_tipo_vendedor tv 
                  WHERE  tv.cod_tipo_vendedor = LP.Cod_Tipo_Vendedor),'' ) AS Desc_Tipo_Vendedor
              
              FROM   finan_lp_solicitud LP,
                     PUC_PERSONAS           F
              WHERE  LP.COD_INTERNO = F.COD_INTERNO
                AND  TO_CHAR(LP.FEC_SOLICITUD, 'DD/MM/YYYY')	 =      p_i_vFEC_INICIO--BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND  (LP.COD_AGENCIA                           = p_i_vCOD_AGENCIA       OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND  (LP.Est_Solicitud                         = p_i_vESTADO_SOLICITUD  OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND  LP.EST_REGISTRO                           = 1
                AND  F.Est_Registro                            = 1
           ORDER BY  TO_NUMBER(LP.NRO_SOLICITUD) ASC;      
  
        ELSE

            -- Establecer variables
            BEGIN

                SELECT   COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                  INTO   v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                  FROM   finan_lp_solicitud LP,
                         PUC_PERSONAS           F
              WHERE  LP.COD_INTERNO = F.COD_INTERNO 
                AND  TO_CHAR(LP.FEC_SOLICITUD, 'DD/MM/YYYY')	 =      p_i_vFEC_INICIO--BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND  (LP.COD_AGENCIA   = p_i_vCOD_AGENCIA      OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND  (LP.Est_Solicitud = p_i_vESTADO_SOLICITUD OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND  LP.EST_REGISTRO   = 1
                AND  F.Est_Registro    = 1
          ORDER BY  TO_NUMBER(LP.NRO_SOLICITUD) ASC; 
          
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS  := 0;
                    v_nTOTAL_PAGINAS    := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS  := 0;
                    v_nTOTAL_PAGINAS    := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial         := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final           := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
             SELECT DISTINCT
             NVL(F.NUM_DOCUM_IDE                         	     ,' ') NUM_DOCUM_IDE,
             NVL(F.APE_PATERNO                                 ,' ') APE_PATERNO,
             NVL(F.APE_MATERNO                                 ,' ') APE_MATERNO,
             NVL(F.PRI_NOMBRE                                  ,' ') PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                                  ,' ') SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                               ,0) TIP_DOCUM_IDE,
            
             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE)          ,' ') DES_DOC_IDE,
             NVL( 
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,''),0,50) 
                 FROM  PUC_PARAMETROS PA 
                WHERE  PA.COD_TABLA = 240 
                  AND  PA.Cod_Parametro = LP.Est_Solicitud)      ,'') DES_ESTADO_SOLICITUD,
                 
              NVL(LP.NRO_SOLICITUD                             ,' ') NRO_SOLICITUD ,
              NVL(LP.COD_TIPO_DESEMBOLSO                       ,0) COD_TIPO_DESEMBOLSO, 
              NVL(to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY')       ,' ') AS FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                             ,0  ) NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                               ,' ') COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                              ,0  ) TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                         ,' ') NUM_CUENTA_ORIGEN,
              NVL(LP.MON_ASIGNADO                              ,0  ) MON_ASIGNADO ,
              NVL(LP.MON_MINIMO_ASIGNADO                       ,0  ) MON_MINIMO_ASIGNADO,
              NVL(LP.MON_SOLICITADO                            ,0  ) MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                          ,' ') COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                        ,' ') COD_TASA_DISP_EFEC,
              NVL(LP.NUM_CUOTA_LP                              ,0  ) NUM_CUOTA_LP,
              NVL(LP.MON_CUOTA_LP                              ,0  ) MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                              ,0  ) COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                               ,0  ) COD_AGENCIA,
              NVL(LP.DES_CAMPANA                               ,' ') DES_CAMPANA,
              NVL(LP.EST_CAMPANA                               ,' ') EST_CAMPANA,
              NVL(LP.NUM_CUENTA_LP                             ,' ') NUM_CUENTA_LP,
              NVL(LP.EST_ENVIO                                 ,' ') EST_ENVIO,
              NVL(TO_CHAR(LP.FEC_ENVIO,'DD/MM/YYYY')           ,' ') FEC_ENVIO,
              NVL(LP.EST_EJECUCION                             ,' ') EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY')       ,' ') FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                             ,0  ) EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                              ,0  ) EST_REGISTRO,
              NVL(TO_CHAR(LP.FEC_REGISTRO,'DD/MM/YYYY')        ,' ') FEC_REGISTRO,
              NVL(LP.USU_REGISTRO                              ,' ') USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY')   ,' ') FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                         ,' ') USU_ACTUALIZACION,
              NVL(
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL   SS  
                 WHERE  LP.COD_AGENCIA   = SS.N_ID_SUCUR)      ,' ') C_DESC_SUCUR  
              ,NVL(v_nTotal_PaginAS                            ,0  ) TOTAL_PAGINAS
              ,NVL(v_nTotal_Registros                          ,0  ) TOTAL_REGISTROS
              ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(LP.NRO_SOLICITUD )),0) AS RN

              FROM   finan_lp_solicitud LP,
                     PUC_PERSONAS           F
              WHERE  LP.COD_INTERNO       = F.COD_INTERNO 
                AND  TO_CHAR(LP.FEC_SOLICITUD, 'DD/MM/YYYY')	 =      p_i_vFEC_INICIO--BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                AND  (LP.COD_AGENCIA      = p_i_vCOD_AGENCIA          OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                AND  (LP.Est_Solicitud    = p_i_vESTADO_SOLICITUD     OR NVL(p_i_vESTADO_SOLICITUD,-1) = -1)
                AND  LP.EST_REGISTRO      = 1
                AND  F.Est_Registro       = 1
                

            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY TO_NUMBER(X.NRO_SOLICITUD) ASC;

        END IF;

         --
  END;
  
  -- FIN - NEW - 25042014
  
  PROCEDURE PRC_SOL_LP_X_CLI_RPT(         p_i_vTip_Docum_Ide            IN VARCHAR2,
                                          p_i_vNum_Docum_Ide            IN VARCHAR2,
                                          p_i_vNum_Cuenta_TP            IN VARCHAR2,
                                          p_i_vEstado_Solicitud         IN VARCHAR2,
                                          p_i_vNro_Solicitud            IN VARCHAR2,
                                          p_o_cResultado                OUT c_Valores
                                            ) IS
      /*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado para la generacion del formato Pdf de Linea Paralela y Constancia de desembolso(Efectivo)
    --              se obtienen los datos para mostrar en los formatos.
    --
    -- Input Parameters : 
                       p_i_vTip_Docum_Ide            IN VARCHAR2  --> Tipo de Documento Identidad
                       p_i_vNum_Docum_Ide            IN VARCHAR2  --> Num. Documento de Identidad
                       p_i_vNum_Cuenta_TP            IN VARCHAR2  --> Num Cuenta 
                       p_i_vEstado_Solicitud         IN VARCHAR2  --> Estado Solicitud LP
                       p_i_vNro_Solicitud            IN VARCHAR2  --> Nro Solicitud LP

    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */
    v_cNum_Docum_Ide            VARCHAR2(20)       := '';
    v_Cod_Interno               VARCHAR2(10)       := '';
    
    v_nTipo_Solicitante         NUMBER             :=0;
    v_nContDoc                  NUMBER             :=0;
    v_cGlosa_Solicitud          VARCHAR2(3000)     := '';
    v_cGlosa_Des_Efec           VARCHAR2(3000)     := '';
    v_vDireccion                VARCHAR2(3000)     := '';
    v_nDir_Corr                 NUMBER             := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(31,3,''); 
    v_nPorcSeguroDesg           NUMBER             := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM(249,2,1); 
    ---
    BEGIN
            
            
            v_cGlosa_Solicitud :=
            'El cliente declara haber sido informado de los siguientes terminos y condiciones de la línea paralela:' ||
            
            CHR (10) ||
            '1. La cuota ha sido calculada en bASe al monto solicitado, número de cuotAS y la tASa de la linea paralela que se            muestra en esta solicitud.' ||
            CHR (10) ||
            '' || 
            CHR (10) ||
            '2. El monto desembolsado no afecta la línea de crédito que actualmente tiene el cliente.' || 
            CHR (10) ||
            '' || 
            CHR (10) ||
            '3. Se generarán y enviarán los estados de cuenta según el medio de envío elegido, los cuales originarán, de ser el cASo, el cargo por comisión de envío de estado de cuenta y seguro de desgravamen.' || 
            CHR (10) ||
            
            CHR (10) ||
            '4. Si a la fecha de vencimiento establecida en el Estado de Cuenta, el cliente no realiza el pago o lo realiza por un monto inferior al indicado en el Estado de Cuenta como ¿Pago Mínimo¿, el capital impago generará, además de los respectivos intereses compensatorios; la penalidad que se indican en el Tarifario vigente.' ||
            CHR (10) ||
                     
            CHR (10) ||
            '5. La línea paralela constituye ¿¿..' ||
            CHR (10) ||            
            ' ' ||
            CHR (10) ||            
            '';
             v_cGlosa_Des_Efec :=
            'El cliente declara haber sido informado de los siguientes terminos y condiciones de la línea paralela:' ||
            
            CHR (10) ||
            '1. La cuota ha sido calculada en bASe al monto solicitado, número de cuotAS y tASa de linea paralela que se muestra en esta solicitud.' ||
            CHR (10) ||
            '' || 
            CHR (10) ||
            '2. El cliente declara haber recibido conforme el dinero según el monto de desembolso consignado en la presente constancia.' || 
            CHR (10) ||
            '' || 
            CHR (10) ||
            
            CHR (10) ||
            '(*) La cuota puede variar dependiendo de la fecha de registro de operación.' ||
            CHR (10) ||
            '' ||
            CHR (10) ||            
            ' ' ||
            CHR (10) ||            
            '';
         
         -- Inicializando variables...
         v_cNum_Docum_Ide := '';
         --
         -- Validando ingreso del numero de documento...
         IF LENGTH(LTRIM(RTRIM(p_i_vNum_Docum_Ide))) < 8 THEN
           
            v_cNum_Docum_Ide 	    := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
            
         ELSE
             IF LENGTH(LTRIM(RTRIM(p_i_vNum_Docum_Ide))) = 8 THEN
               
                 v_cNum_Docum_Ide := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
                 
             ELSE
               
                 v_cNum_Docum_Ide := LTRIM(RTRIM(p_i_vNum_Docum_Ide));
                 
             END IF;
         END IF;
         --
         -- Consulta de la informacion...
         IF (p_i_vTip_Docum_Ide IS NOT NULL) AND (v_cNum_Docum_Ide IS NOT NULL) THEN
             -- Obtener el codigo interno del cliente...
             BEGIN
                 SELECT   NVL(p.Cod_Interno,'') 
                   INTO   v_Cod_Interno
                   FROM   puc_personAS p
                  WHERE   p.tip_docum_ide = p_i_vTip_Docum_Ide
                    AND   p.num_docum_ide = v_cNum_Docum_Ide;
                    
             EXCEPTION
                 WHEN No_Data_Found  THEN
                      v_Cod_Interno  := NULL;
                 WHEN OTHERS THEN
                      v_Cod_Interno  := NULL;
             END;
             --
             IF ( (v_Cod_Interno IS NOT NULL) ) THEN

             v_vDireccion:= FINAN_PKG_UTILITARIOS.FINAN_FUN_OBT_DIRECCION(v_Cod_Interno, v_nDir_Corr);

                 OPEN p_o_cResultado FOR
                     SELECT 
                            NVL(LPAD(LP.NRO_SOLICITUD,10,'0')                             ,' ') NRO_SOLICITUD,
                            NVL(LP.COD_TIPO_DESEMBOLSO                                    ,0  ) COD_TIPO_DESEMBOLSO,
                            NVL(to_char(LP.FEC_SOLICITUD,'DD/MM/YYYY')                    ,' ') FEC_SOLICITUD,
                            NVL(LP.NRO_SECUENCIA                                          ,0  ) NRO_SECUENCIA,
                            NVL(LP.COD_INTERNO                                            ,' ') COD_INTERNO,
                            NVL(LP.TIP_PRODUCTO                                           , 0 ) TIP_PRODUCTO,
                            NVL(LP.NUM_CUENTA_ORIGEN                                      ,' ') NUM_CUENTA_ORIGEN,
                            
                            NVL(LP.MON_ASIGNADO                                           ,0  ) MON_ASIGNADO,
                            NVL(LP.MON_MINIMO_ASIGNADO                                    ,0  ) MON_MINIMO_ASIGNADO,
                            NVL(LP.MON_SOLICITADO                                         ,0  ) MON_SOLICITADO,
                            
                            NVL(LP.COD_TASA_DISP_EFEC                                     ,' ') COD_TASA_DISP_EFEC,
                            NVL(LP.NUM_CUOTA_LP                                           ,0  ) NUM_CUOTA_LP,
                            NVL(LP.MON_CUOTA_LP                                           ,0  ) MON_CUOTA_LP,
                            NVL(LP.COD_VENDEDOR                                           ,0  ) COD_VENDEDOR,
                            NVL(LP.COD_AGENCIA                                            ,0  ) COD_AGENCIA,
                            NVL(LP.DES_CAMPANA                                            ,' ') DES_CAMPANA,
                            NVL(LP.EST_CAMPANA                                            ,' ') EST_CAMPANA,
                            NVL(LP.NUM_CUENTA_LP                                          ,' ') NUM_CUENTA_LP,
                            NVL(LP.Num_Tarjeta_Origen                                     ,' ') NUM_TARJETA_ORIGEN,
                         
                            NVL(
                            ( SELECT  ss.c_desc_sucur 
                                FROM  ESAC.SAC_SUCURSAL  SS  
                               WHERE  LP.COD_AGENCIA   = SS.N_ID_SUCUR)                     ,' ') c_desc_sucur,
                            NVL( 
                            (SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,''),0,50) 
                               FROM  PUC_PARAMETROS PA 
                              WHERE  PA.COD_TABLA = 240 
                                AND  PA.Cod_Parametro = LP.Est_Solicitud)              ,' ') DES_ESTADO_SOLICITUD,
                                                                               
                            NVL(
                            ( SELECT  ta.val_tASa 
                                FROM  finan_lp_tASa ta 
                               WHERE  ta.cod_tASa = LP.cod_tASa_disp_efec)                  ,0  ) MONTO_TASA_DIS_EFEC,
                            NVL(
                            ( SELECT  tv.des_tipo_vendedor 
                                FROM  finan_tipo_vendedor tv 
                               WHERE  tv.cod_tipo_vendedor = LP.Cod_Tipo_Vendedor)          ,' ') Desc_Tipo_Vendedor,
                            NVL(
                            ( SELECT  P.VAL_CAD_LARGO
                                FROM  PUC_PARAMETROS P
                               WHERE  P.COD_TABLA = 1
                                 AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE)                    ,' ') DES_DOC_IDE,
                            NVL(td.des_tipo_desembolso                                    ,' ') des_tipo_desembolso,
                            NVL(F.Num_Docum_Ide                                           ,' ') Num_Docum_Ide,
                            NVL(v_cGlosa_Solicitud                                        ,' ') TERMINO_SOLICITUD,
                            NVL(v_cGlosa_Des_Efec                                         ,' ') TERMINO_DES_EFEC,
                            --Lpad((SELECT LPD.NRO_SOLICITUD_DES_EE FROM FINAN_LP_SOLICITUD_DES_ENTEFE LPD where LPD.NRO_SOLICITUD= LP.NRO_SOLICITUD ),10,'0') AS NRO_SOLICITUD_DES_EE,
                            NVL(LPAD(LP.NRO_SOLICITUD,10,'0')                             ,' ') NRO_SOLICITUD_DES_EE,
                            NVL(v_vDireccion                                              ,' ') DIR_CORRESPONDENCIA,
                            NVL(LP.Flag_Seguro                           ,0)              AS Flag_Seguro,
                            NVL(LP.Mon_Seguro                            ,0)              AS Mon_Seguro,
                            'S/. '|| TRIM(TO_CHAR(LP.Mon_Solicitado*v_nPorcSeguroDesg,'99999.99'))   AS PORCENTAJE_SEGURO
                           
                            FROM   finan_lp_solicitud LP 
                      INNER JOIN   finan_lp_tipo_desembolso td
                              ON   td.cod_tipo_desembolso= LP.cod_tipo_desembolso,
                                    PUC_PERSONAS       F
                            WHERE  F.Cod_Interno  = LP.Cod_Interno
                              AND  LP.Cod_Interno             =   v_Cod_Interno
                              AND  LP.Num_Cuenta_Origen     =   p_i_vNum_Cuenta_TP
                              AND  (LP.Nro_Solicitud = p_i_vNro_Solicitud 
                                    OR nvl(p_i_vNro_Solicitud, ' ')=' ')
                              AND  LP.EST_SOLICITUD!=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'')                                    
                        ORDER  BY  LP.NRO_SOLICITUD ;
                           
             ELSE
                 -- Para generar error...
                 OPEN p_o_cResultado FOR
                      SELECT ' '                   NUM_SOLICITUD_REFIN,
                             0                     SLD_REFINANCIAMIENTO,
                             0                     NUM_MESES_REF,
                             ' '                   NUM_BOLETA_BNP,
                             0                     NUM_MONTO_BNP,
                             'SIN AGENCIA'         DES_COD_AGENCIA,
                             'SIN EXON.'           DES_EXONERACION_SOLICITUD,
                             0                     MONTO_MINIMO_EXI,
                             'SIN TASA'            DES_MULTIPROD,
                             0                     MONTO_CUOTA_REF
                      FROM   finan_lp_solicitud PR
                      WHERE  PR.COD_INTERNO        =  '99999999'
                        AND  PR.Num_Cuenta_Origen  =  '00000000';
             END IF;
         END IF;
    EXCEPTION
         WHEN OTHERS THEN
              ROLLBACK;
              --
              -- Para generar error...
              OPEN p_o_cResultado FOR
                      SELECT ' '                   NUM_SOLICITUD_REFIN,
                             0                     SLD_REFINANCIAMIENTO,
                             0                     NUM_MESES_REF,
                             ' '                   NUM_BOLETA_BNP,
                             0                     NUM_MONTO_BNP,
                             'SIN AGENCIA'         DES_COD_AGENCIA,
                             'SIN EXON.'           DES_EXONERACION_SOLICITUD,
                             0                     MONTO_MINIMO_EXI,
                             'SIN TASA'            DES_MULTIPROD,
                             0                     MONTO_CUOTA_REF
                      FROM   PUC_REFINANCIADo PR
                      WHERE  PR.COD_INTERNO        =  '99999999'
                        AND  PR.NUM_CUENTA_FUNO  =  '00000000';
              --
    END PRC_SOL_LP_X_CLI_RPT;
    
    
PROCEDURE PRC_VAL_CAMBPROD_x_LP(         p_i_nTIP_DOCUM_IDE IN NUMBER,
                                         p_i_vNUM_DOCUM_IDE IN VARCHAR,
                                         p_o_cResultado  OUT c_Valores
                                         ) IS
    /*
    -- *****************************************************************************************
    -- Descripcion: Procedure validar que no se halla registrado un cambio de producto, hace  dos diAS atraz
    --
    -- Input Parameters :
                       p_i_vTip_Docum_Ide            IN VARCHAR2  --> Tipo de Documento Identidad
                       p_i_vNum_Docum_Ide            IN VARCHAR2  --> Num. Documento de Identidad

    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */
    v_cGlosa_Solicitud               VARCHAR2(3000) := '';
    v_Fecha_HacedosDiAS              DATE;
    --
  BEGIN
    SELECT  to_date(SYSDATE-2)
      INTO  v_Fecha_HacedosDias
      FROM  dual;

    OPEN p_o_cResultado FOR
      SELECT NVL(A.NRO_SOLICITUD                              ,' ') NRO_SOLICITUD, -- DATOS SOLICITUD
             NVL(TO_CHAR(B.FEC_SOLICITUD, 'DD/MM/YYYY')       ,' ') FEC_SOLICITUD,
             NVL(TO_CHAR(B.FEC_EJECUCION, 'DD/MM/YYYY')       ,' ') FEC_EJECUCION,
             NVL(B.ESTADO_SOLICITUD                           ,0) ESTADO_SOLICITUD,
             NVL(F.TIP_DOCUM_IDE                              ,0) TIP_DOCUM_IDE,
             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE)       ,' ') AS DES_DOC_IDE,
             nvl(F.NUM_DOCUM_IDE                              ,' ') NUM_DOCUM_IDE,
             nvl(F.APE_PATERNO                                ,' ') APE_PATERNO,
             nvl(F.APE_MATERNO                                ,' ') APE_MATERNO,
             nvl(F.PRI_NOMBRE                                 ,' ') PRI_NOMBRE,
             nvl(F.SEG_NOMBRE                                 ,' ') SEG_NOMBRE,
             NVL(F.COD_INTERNO                                ,' ') COD_INTERNO,
             NVL(B.TIP_PRODUCTO                               ,0 ) TIP_PRODUCTO,
             NVL(
             ( SELECT  P.DES_ELEMENTO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 15
                  AND  P.COD_PARAMETRO = B.TIP_PRODUCTO)        ,' ') DES_TIP_PRODUCTO,
             NVL(B.NUM_CUENTA                                 ,' ') NUM_CUENTA,
             NVL(B.NUM_TARJETA                                ,' ') NUM_TARJETA,
             NVL(A.BLO_CUENTA                                 ,' ') BLO_CUENTA,
             NVL(A.BLQ_TARJETA                                ,' ') BLQ_TARJETA,
             NVL(A.COD_AGENCIA                                ,0  ) COD_AGENCIA,
             NVL(A.MTO_LINEA_CRED                             ,0  ) MTO_LINEA_CRED,
             NVL(A.SLD_ACTUAL                                 ,0  ) SLD_ACTUAL,
             NVL(A.SLD_CAPITAL                                ,0  ) SLD_CAPITAL,
             NVL(A.SLD_MORA                                   ,0  ) SLD_MORA,
             NVL(A.CNT_DIAS_MORA                              ,0  ) CNT_DIAS_MORA,
             NVL(TO_CHAR(A.FEC_APERTURA, 'DD/MM/YYYY')        ,' ') FEC_APERTURA,
             NVL(A.FLG_COMPRA_EEAA                            ,' ') FLG_COMPRA_EEAA,
             NVL(B.IND_APROBACION                             ,' ') IND_APROBACION,
             NVL(
             ( SELECT  S.C_DESC_SUCUR
                 FROM  ESAC.SAC_SUCURSAL S
                WHERE  S.N_EST_SUCUR = 1
                  AND  S.N_ID_SUCUR = A.COD_AGENCIA)          ,' ') DES_AGENCIA,
             NVL(B.TIP_PROD_NUEVO                             ,0  ) TIP_PROD_NUEVO,
             NVL(
             ( SELECT  P.DES_ELEMENTO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 15
                  AND  P.COD_PARAMETRO = B.TIP_PROD_NUEVO)    ,' ') DES_TIP_PRODUCTO_NUEVO,
             ---I_TERMINO AS TERMINO_SOLICITUD,
             NVL(v_cGlosa_Solicitud                           ,' ') TERMINO_SOLICITUD,
             NVL(TO_CHAR(B.FEC_CREACION, 'DD/MM/YYYY')        ,' ') FEC_CREACION,
             NVL(B.USU_REGISTRO                               ,' ') USU_REGISTRO,
             NVL(B.USU_ACTUALIZACION                          ,' ') USU_ACTUALIZACION,
             NVL(TO_CHAR(B.FEC_ACTUALIZACION, 'DD/MM/YYYY')   ,' ') FEC_ACTUALIZACION,
             NVL(TO_CHAR(B.FEC_REGISTRO, 'DD/MM/YYYY')        ,' ') FEC_REGISTRO,
             NVL(
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50)
                 FROM  PUC_PARAMETROS PA
                WHERE  PA.COD_TABLA = 170
                  AND  PA.COD_ELEMENTO = B.ESTADO_SOLICITUD)    ,' ') DES_ESTADO_SOLICITUD

        FROM FINAN_CAMPRO_SALDOS    A,
             FINAN_CAMPRO_SOLICITUD B,
             PUC_PERSONAS           F
       WHERE  A.COD_INTERNO 	   = B.COD_INTERNO
         AND  B.COD_INTERNO      = F.COD_INTERNO
         AND  F.TIP_DOCUM_IDE    = p_i_nTIP_DOCUM_IDE
         AND  F.NUM_DOCUM_IDE    = p_i_vNUM_DOCUM_IDE
         AND  B.Fec_Solicitud    >= v_Fecha_HacedosDiAS
         AND  A.EST_REGISTRO     = 1
         AND  B.EST_REGISTRO     = 1
    ORDER BY  TO_NUMBER(A.NRO_SOLICITUD) DESC;
         --
  END;

PROCEDURE PRC_CON_SALDOS_CLIENTE (     p_i_vCodInterno       VARCHAR2,
                                       p_o_cResultado        OUT c_Valores
                                 ) IS

        v_Num_Cuenta_LP         VARCHAR2(19) := '';
        v_Esta_Soli_LP          NUMBER(6):=0;
        -- ******************************************************************************
        -- Descripcion: Proceso que permitira consultar los saldos del cliente en
        --              bASe al Codigo interno del Cliente
        --
        --              ESQUEMA: EFINAN@FULXT01
        --
        -- Input Parameters : p_i_vCodInterno	       VARCHAR2      --> Codigo interno Puc_Persona
        --
        -- Output Parameters: p_o_cResultado                         --> Cursor
        -- Author     : Eduardo A.J. Zuñiga Gamarra
        -- Proyecto   : Plataforma Unica de Clientes (PUC).
        -- Responsable:  O.Valdivia O.
        --
        -- Revisiones
        -- Fecha            Autor           Motivo del cambio                RDC
        -- ------------------------------------------------------------------------------
        -- 13/02/2014    E. Zuñiga      Creacion
        -- ******************************************************************************


        BEGIN

        v_Esta_Soli_LP :=    FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');

        SELECT  Lp.Num_Cuenta_Lp
          INTO  v_Num_Cuenta_LP
          FROM  finan_lp_solicitud LP
         WHERE  LP.COD_INTERNO      = p_i_vCodInterno
           AND  LP.Est_Solicitud   != v_Esta_Soli_LP;

             -- Validacion del ingreso correcto de los parametros...
             IF (v_Num_Cuenta_LP IS NOT NULL) THEN

                    OPEN p_o_cResultado FOR
                        SELECT DISTINCT
                               NVL(S.NUM_CUENTA_PMCP, '')                                                                            NUM_CUENTA,
                               NVL(S.MTO_LINEA_CRED,0)                                                                               LINEA_CREDITO,

                               NVL(S.SLD_ACTUAL,0)                                                                                        SLD_ACTUAL,
                               NVL(S.SLD_CAPITAL,0)                                                                                      SLD_CAPITAL,

                               NVL(S.COD_BLOQUEO_2, '') || '|' || NVL(COD_BLOQUEO_2,'')                                                  COD_BLOQUEO_2,
                               NVL(S.SLD_MORA_CALC, 0)                                                                                   SLD_MORA_CALC,
                               NVL(S.CNT_DIAS_MORA_SBS,0)                                                                                CNT_DIAS_MORA_SBS,

                               NVL(PC.FLG_DISP_EFEC,'')                                                               FLG_DISP_EFECTIVO,
                               (
                               CASE
                                  WHEN NVL(PC.FLG_COMPRA_ESAFI, '0') = '1' THEN
                                       '0'
                                  WHEN NVL(PC.FLG_COMPRA_ESAFI, '0') = '01' THEN
                                       '0'
                                  ELSE
                                       '2'
                               END
                               )                                                                                                        FLG_COMPRA_EEAA,
                               /*
                               -- Para Refinanciamiento (MINIMO_EXIGIBLE)...
                               NVL(
                                   ROUND((S.SLD_ACTUAL - S.SLD_CAPITAL), 2)
                                   ,
                                   0
                                  )                                                                                   MINIMO_EXIGIBLE,
                               */
                               NVL(TO_CHAR(PC.FEC_APERTURA,'dd/mm/yyyy'),'')                                                          FECHA_APERTURA_CUENTA,

                                                                                                COD_PCT,
                               (
                                CASE TRIM(PC.FLG_ENVIO_EECC)
                                     WHEN '0' THEN 'NO'
                                     WHEN NULL THEN 'SI'
                                     WHEN ''   THEN 'SI'
                                     ELSE
                                         'SI'
                                END
                               )                                                                                      FLG_ENVIO_EECC
                        FROM   PMCP_SALDOS S ,
                               PMCP_CUENTAS PC
                        WHERE  S.NUM_CUENTA_PMCP      = PC.NUM_CUENTA_PMCP
                          AND  PC.NUM_CUENTA_PMCP     = v_Num_Cuenta_LP
                        ;

                ELSE -- else de v_Num_Cuenta_LP is null
                  OPEN p_o_cResultado FOR
                       SELECT  ''                         NUM_CUENTA,
                               0                          LINEA_CREDITO,
                               0                          DISPONIBLE_EFECTIVO,
                               0                          CICLO_FACTURACION,
                               0                          DISPONIBLE_CREDITO,
                               0                          SALDO_ACTUAL,
                               0                          SALDO_CAPITAL,
                               0                          SALDO_ANTERIOR,
                               0                          DEBITO_MEMO,
                               ''                         CODIGO_BLOQUEO,
                               0                          SALDO_MORA,
                               0                          CANTIDAD_DIAS_MORA,
                               ''                         FECHA_ULTIMO_PAGO,
                               ''                         FLG_DISP_EFECTIVO,
                               '2'                        FLG_COMPRA_EEAA,
                               0                          MINIMO_EXIGIBLE,
                               ''                         FECHA_APERTURA_CUENTA,
                               ''                         CLASIFICACION_INTERNA,
                               ''                         CLASIFICACION_SBS,
                               0                          LINEA_DISP_SIN_SOBREGIRO,
                               ''                         COD_PCT,
                               'SI'                       FLG_ENVIO_EECC
                      FROM     DUAL;

             END IF;
             --
        EXCEPTION
             WHEN OTHERS THEN
                  OPEN p_o_cResultado FOR
                       SELECT  ''                         NUM_CUENTA,
                               0                          LINEA_CREDITO,
                               0                          DISPONIBLE_EFECTIVO,
                               0                          CICLO_FACTURACION,
                               0                          DISPONIBLE_CREDITO,
                               0                          SALDO_ACTUAL,
                               0                          SALDO_CAPITAL,
                               0                          SALDO_ANTERIOR,
                               0                          DEBITO_MEMO,
                               ''                         CODIGO_BLOQUEO,
                               0                          SALDO_MORA,
                               0                          CANTIDAD_DIAS_MORA,
                               ''                         FECHA_ULTIMO_PAGO,
                               ''                         FLG_DISP_EFECTIVO,
                               '2'                        FLG_COMPRA_EEAA,
                               0                          MINIMO_EXIGIBLE,
                               ''                         FECHA_APERTURA_CUENTA,
                               ''                         CLASIFICACION_INTERNA,
                               ''                         CLASIFICACION_SBS,
                               0                          LINEA_DISP_SIN_SOBREGIRO,
                               ''                         COD_PCT,
                               'SI'                       FLG_ENVIO_EECC
                      FROM     DUAL;
                      --

        END PRC_CON_SALDOS_CLIENTE;
/*
    -- *****************************************************************************************
    -- Descripcion: Funcion que permite obtener la direccion de correspondencia del cliente.
    --
    -- Input Parameters :
                       P_CODIGO_INTERNO            IN NUMBER  --> Codigo Interno cliente
                       P_TIPO_DIRECCION            IN NUMBER  --> Tipo Direccion


    -- Output Parameters:  no aplica.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */


PROCEDURE PRC_VAL_REGIS_LP(  p_i_vTip_Docum_Ide            IN VARCHAR2,
                             p_i_vNum_Docum_Ide            IN VARCHAR2,
                             p_i_vNum_Cuenta_TP            IN VARCHAR2,
                             p_i_vEstado_Solicitud         IN VARCHAR2,
                             p_i_vNro_Solicitud            IN VARCHAR2,
                             p_o_CResultado                OUT c_Valores
                           ) IS
    -- *****************************************************************************************
    -- Descripcion: Permitira Realizar validacion con los estados, la fecha de creacion y los saldos a cancelar del Cliente para la creacion de
    --              una Nueva Solicitud de Linea Paralela.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters :                    p_i_vTip_Docum_Ide            IN VARCHAR2 --> Tipo de Documento de Identidad
    --                                       p_i_vNum_Docum_Ide            IN VARCHAR2 --> Numero de Documento de Identidad
    --                                       p_i_vNum_Cuenta_TP            IN VARCHAR2 --> Num de Cuenta
    --                                       p_i_vEstado_Solicitud         IN VARCHAR2 --> Estado Solicitud
    --                                       p_i_vNro_Solicitud            IN VARCHAR2 --> Numero de Solicitud
    -- Output Parameters:  p_o_CResultado             CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra 
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio                        RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014    E. Zuñiga         CREACION                                 XXX
    -- 01/07/2014    E. Zuñiga         Modificación Val. Días de Mora           XXX
    -- *****************************************************************************************
    ---
    ---
    -- Declaracion de variables generales...
    v_cNum_Docum_Ide            VARCHAR2(20)              := '';
    v_Cod_Interno               VARCHAR2(10)              := '';
    v_nEst_Solicitud            NUMBER                    :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');  --> Estado Anulado de LP..
    v_nEst_Ejecutado            NUMBER                    :=FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,5,'');  --> Estado Ejecutado de LP..
    v_nTipo_Solicitante         NUMBER                    :=0;
    v_nContDoc                  NUMBER                    :=0;
    v_Cant_Cuot_Pagar           NUMBER                    :=0;
    v_dFechaActual              DATE;
    v_dFechaUltimoRegistro      DATE;
    o_resultado_proc            VARCHAR2(150);
    v_nEst_LP                   NUMBER(6);
    v_nNum_Cuenta_LP            NUMBER(19);
    v_rwLineaParalela           FINAN_LP_SOLICITUD%ROWTYPE;
    v_nNum_Cta_Pmcp             VARCHAR2(19);
    --INI E.Zuñiga 01/07/2014
    v_nCantDiasMora             NUMBER(5):=0;
    v_nCantDiasMoraEBS          NUMBER(5):=0;
    --FIN
    ---
    BEGIN
        o_resultado_proc:='Excepcion';
      	IF (p_i_vTip_Docum_Ide IS NOT NULL) AND (p_i_vNum_Docum_Ide IS NOT NULL) THEN
             -- Obtener el codigo interno del cliente...
             BEGIN
                 SELECT   NVL(p.Cod_Interno,'') 
                   INTO   v_Cod_Interno
                   FROM   puc_personAS p
                  WHERE   p.tip_docum_ide = p_i_vTip_Docum_Ide
                    AND   p.num_docum_ide = p_i_vNum_Docum_Ide;
                    
                 SELECT   PS.CNT_DIAS_MORA,
                          PS.CNT_DIAS_MORA_SBS
                          INTO
                          v_nCantDiasMora,
                          v_nCantDiasMoraEBS   
                   FROM   PMCP_SALDOS PS
                  WHERE   PS.NUM_CUENTA_PMCP = p_i_vNum_Cuenta_TP;
                    
             EXCEPTION
                   WHEN   No_Data_Found THEN
                          v_Cod_Interno := NULL;
                          o_resultado_proc:='Excepcion';
                   WHEN   OTHERS THEN
                          v_Cod_Interno := NULL;
                          o_resultado_proc:='Excepcion';
             END;
         END IF;
         
      	-- Inicializando variables...
         SELECT  MAX(p.fec_solicitud) 
           INTO  v_dFechaUltimoRegistro 
           FROM  finan_lp_solicitud p 
          WHERE  p.est_solicitud!=v_nEst_Solicitud 
            AND  p.cod_interno=v_Cod_Interno;
          
         BEGIN
           
         SELECT  MAX(NVL(PM.NUM_CUENTA_PMCP,'')) 
           INTO  v_nNum_Cta_Pmcp 
           FROM  PMCP_CUENTAS PM 
          WHERE  PM.COD_LOGO IN ('051','052')
            AND  PM.TIP_DOCUM_IDE = CASE WHEN p_i_vTip_Docum_Ide=141 THEN 1
                                    ELSE 0
                                    END
            AND  PM.NUM_DOCUM_IDE = '0000'||p_i_vNum_Docum_Ide
            AND  PM.NUM_CUENTA_PMCP NOT IN (
                                              SELECT   NVL(LP.NUM_CUENTA_LP,0)
                                                FROM   FINAN_LP_SOLICITUD LP
                                               WHERE   LP.COD_INTERNO   =  v_Cod_Interno
                                                 AND   LP.EST_SOLICITUD != v_nEst_Solicitud
                                           );
         
         EXCEPTION
           WHEN OTHERS THEN 
           
                v_nNum_Cta_Pmcp:='';
           
         END;
         
         SELECT  SYSDATE 
           INTO  v_dFechaActual 
           FROM  dual;
           
         IF v_nCantDiasMora = 0 THEN 
           
             IF v_nCantDiasMoraEBS = 0 THEN 
                
                 IF v_dFechaUltimoRegistro IS NULL  THEN
               
                      IF v_nNum_Cta_Pmcp IS NOT NULL THEN
                                 
                         o_resultado_proc:='OK';
                      ELSE
                         o_resultado_proc  :='No Existe número de cuenta creada para el Linea Paralela';  
                      END IF;
                  
                 ELSE
                   
                    SELECT  * 
                      INTO  v_rwLineaParalela
                      FROM  finan_lp_solicitud p 
                     WHERE  p.est_solicitud!=v_nEst_Solicitud 
                       AND  p.cod_interno=v_Cod_Interno
                       AND  to_date(p.fec_solicitud)=to_date(v_dFechaUltimoRegistro);
                    
                     v_nNum_Cuenta_LP :=v_rwLineaParalela.Num_Cuenta_Lp;
                     v_nEst_LP	      :=v_rwLineaParalela.Est_Solicitud;
                     
                     IF to_date(v_dFechaUltimoRegistro)=to_date(v_dFechaActual) THEN
                       
                           o_resultado_proc  :='Existe un Registro de Linea Paralela para el dia de Hoy';
                           
                     ELSE-- Else comparacion de fechAS ultimo registro y v fecha actual
                           
                              IF v_nEst_Ejecutado!=v_nEst_LP THEN
                              
                              o_resultado_proc  :='Existe una Solicitud de Linea Paralela Vigente'; 
                              
                              ELSE
                                
                                   SELECT  COUNT(CTA.NUM_CUENTA_PMCP) 
                                     INTO  v_Cant_Cuot_Pagar 
                                     FROM  PMCP_CUOTAS_DET_TOTAL  CTA 
                                    WHERE  cta.num_cuenta_pmcp= v_nNum_Cuenta_LP 
                                      AND  cta.cod_est_cuota=' ';   
                                   
                                   IF v_Cant_Cuot_Pagar>0 THEN -- cuando aun tenga cuotAS a pagar
                                      
                                      o_resultado_proc  :='El Cliente tiene una Linea Paralela con un Saldo a Cancelar';
                                     
                                   ELSE-- cuando lAS cuotAS a pagar seran cero
                                       IF v_nNum_Cta_Pmcp IS NOT NULL THEN
                                     
                                           o_resultado_proc  :='OK';
                                       ELSE
                                         
                                           o_resultado_proc  :='No Existe número de cuenta creada para el Linea Paralela';  
                                       
                                       END IF;
                                   END IF;
                              
                              
                              END IF;
                                
                       END IF;
                 
                 END IF;
             
             ELSE
                 o_resultado_proc := 'Cliente tiene dias de Mora - Modulo EBS';
             END IF;
         ELSE
             o_resultado_proc := 'Cliente tiene dias de Mora';
         END IF;
         
         
         OPEN p_o_cResultado FOR
                        SELECT o_resultado_proc        DES_RES_PROC
                        FROM DUAL; 
         --
     EXCEPTION
         WHEN OTHERS THEN
              ROLLBACK;
              --
              -- Para generar error...
              o_resultado_proc:='Excepcion Controlada:'|| LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
              OPEN p_o_cResultado FOR
                        SELECT 
                               o_resultado_proc        DES_RES_PROC
                        FROM DUAL; 
                        
              --
    END PRC_VAL_REGIS_LP;  


/*  PROCEDURE PRC_CON_DESEM_NOCONCIL(     
                                         p_i_vNUMERO_PAGINA   NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO      VARCHAR2,
                                         p_i_vFEC_FINAL       VARCHAR2,
                                         p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,          
                                         p_o_cResultado       OUT c_Valores
                                        ) IS
  
   \*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS NO CONCILIADAS CON LA DATA DE MC.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters : 
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                      
    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : IFU.
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    *\
    v_nTOTAL_REGISTROS                     NUMBER;
    v_nTOTAL_PAGINAS                       NUMBER;
    v_nCantidad_Registros                  NUMBER := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial                    NUMBER;
    v_nRegistro_Final                      NUMBER;
    v_bFLAG_VACIO                          BOOLEAN;

    v_datetime                             DATE;
    
  BEGIN
       
  v_datetime:=TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT  VT.APE_PATERNO,
              VT.APE_MATERNO,
              VT.PRI_NOMBRE,
              VT.SEG_NOMBRE,
              VT.TIP_DOCUM_IDE,
              VT.NUM_DOCUM_IDE,
              VT.DES_DOC_IDE,
              VT.DES_ESTADO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.NRO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.FEC_SOLICITUD,
              VT.NRO_SECUENCIA,
              VT.COD_INTERNO,
              VT.TIP_PRODUCTO,
              VT.NUM_CUENTA_ORIGEN,
              VT.MON_SOLICITADO,
              VT.COD_TASA_COMPRAS,
              VT.COD_TASA_DISP_EFEC,
              VT.NUM_CUOTA_LP,
              MON_CUOTA_LP,
              COD_VENDEDOR,
              COD_AGENCIA,
              NUM_CUENTA_LP,
              EST_EJECUCION,
              FEC_EJECUCION,
              EST_SOLICITUD,
              EST_REGISTRO,
              FEC_REGISTRO,--28
              USU_REGISTRO,
              FEC_ACTUALIZACION,
              USU_ACTUALIZACION,
              NUM_TARJETA_ORIGEN,
              C_DESC_SUCUR,
              MON_DESEMBOLSO,
              DES_OBSERVACION,
              FEC_CORTE,
              NUM_CUENTA_LP,
              NUM_TARJETA_LP,
              MON_SEGURO,
              NUM_CUOTA_SEG,
              MON_CUOTA_SEG,
              NUM_SECUENCIA_DES,
              NUM_CAJA_DES,
              DES_TIPO_DESEMBOLSO,
              EST_DESEMBOLSO_DES,
              EST_CONCILIACION_DES,
              FEC_PROCESO,
              DES_ESTADO_SOLICITUD
              
      FROM 
      (
        SELECT 
             NVL(F.APE_PATERNO                          ,' ')                     APE_PATERNO,
             NVL(F.APE_MATERNO                          ,' ')                     APE_MATERNO,
             NVL(F.PRI_NOMBRE                           ,' ')                     PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                           ,' ')                     SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0  )                     TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ')                     NUM_DOCUM_IDE,
             NVL(
             ( SELECT P.VAL_CAD_LARGO
                 FROM PUC_PARAMETROS P
                WHERE P.COD_TABLA = 1
                  AND P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                    DES_DOC_IDE,
             NVL( 
             ( SELECT SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                 FROM PUC_PARAMETROS PA 
                WHERE PA.COD_TABLA = 240 
                  AND PA.Cod_Parametro = LP.Est_Solicitud),' ')                   DES_ESTADO_SOLICITUD, --8
                 
              NVL(DL.NRO_SOLICITUD                       ,' ')                    NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  )                    COD_TIPO_DESEMBOLSO,
              NVL(to_char(DL.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ')                   FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  )                    NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ')                    COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  )                    TIP_PRODUCTO,
              NVL(DL.NUM_CUENTA_PMCP                     ,' ')                    NUM_CUENTA_ORIGEN,
              NVL(LP.MON_SOLICITADO                      ,0  )                    MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ')                    COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                    COD_TASA_DISP_EFEC,--18
              NVL(LP.NUM_CUOTA_LP                        ,0  )                    NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  )                    MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  )                    COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  )                    COD_AGENCIA,
              
              NVL(LP.EST_EJECUCION                       ,' ')                    EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                    FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  )                    EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  )                    EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                   FEC_REGISTRO,--28
              NVL(LP.USU_REGISTRO                        ,' ')                    USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                 FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ')                    USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                    NUM_TARJETA_ORIGEN,
              NVL(
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL  SS  
                 WHERE  SS.N_ID_SUCUR =  LP.COD_AGENCIA)  ,' ')                   C_DESC_SUCUR,
              NVL(DL.MON_DESEMBOLSO,'' )                                          MON_DESEMBOLSO,
              NVL(DL.DES_OBSERVACION,' ')                                         DES_OBSERVACION,
              NVL(
              (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                 FROM  PMCP_SALDOS PMS
                WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' )      FEC_CORTE,
              NVL(LP.NUM_CUENTA_LP,' ')                                           NUM_CUENTA_LP,
              \*
              NVL(
                	  (SELECT DISTINCT TO_CHAR(MAX(TO_NUMBER(PPP.NUM_TARJETA)))
                       FROM PUC_PERSONAS_PROD  PPP
                      WHERE PPP.NUM_CUENTA=LP.NUM_CUENTA_LP),' ')                 NUM_TARJETA_LP,
              *\
              NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
              NVL(LP.MON_SEGURO,0)                                                MON_SEGURO,--39
              NVL(LP.NUM_CUOTA_SEG,0)                                             NUM_CUOTA_SEG,
              NVL(LP.MON_CUOTA_SEG,0)                                             MON_CUOTA_SEG,
              NVL(
              	   ( SELECT  DEE.NUM_SECUENCIA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)               NUM_SECUENCIA_DES,
              NVL(
              	   ( SELECT  DEE.NUM_CAJA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)               NUM_CAJA_DES,
             
              NVL(
                   ( SELECT  TD.DES_TIPO_DESEMBOLSO
                       FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                      WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
              NVL(
              	   ( SELECT  PP.DES_ELEMENTO 
                       FROM  PUC_PARAMETROS PP 
                      WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                  FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                 WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
              'NO PROCESADO'                                                       EST_CONCILIACION_DES,
              NVL(TO_CHAR(DL.FEC_REGISTRO,'DD/MM/YYYY'),' ')                       FEC_PROCESO
             
                   
                    FROM   FINAN_LP_CONCIL_DESEM_LOG DL
              LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
              
              LEFT  JOIN   PUC_PERSONAS           F
                      ON   F.COD_INTERNO = LP.COD_INTERNO
                    
                  WHERE  DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                    AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                    AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA 
                          OR NVL(p_i_vCOD_AGENCIA,-1) = -1)

         UNION ALL-- ========================
         
         SELECT 
             NVL(F.APE_PATERNO                          ,' ')                        APE_PATERNO,
             NVL(F.APE_MATERNO                          ,' ')                        APE_MATERNO,
             NVL(F.PRI_NOMBRE                           ,' ')                        PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                           ,' ')                        SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0  )                        TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ')                        NUM_DOCUM_IDE,
             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                       DES_DOC_IDE,
             NVL( 
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                 FROM  PUC_PARAMETROS PA 
                WHERE  PA.COD_TABLA = 240 
                  AND  PA.Cod_Parametro = LP.Est_Solicitud),' ')                      DES_ESTADO_SOLICITUD,--8
                 
              NVL(DLD.NRO_SOLICITUD                       ,' ')      	               NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                  ,0  )                      COD_TIPO_DESEMBOLSO,
              NVL(TO_CHAR(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY'),' ')                      FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  )                       NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ')                       COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  )                       TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                   ,' ')                       NUM_CUENTA_ORIGEN,
              NVL(LP.MON_SOLICITADO                      ,0  )                       MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ')                       COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                       COD_TASA_DISP_EFEC,--18
              NVL(LP.NUM_CUOTA_LP                        ,0  )                       NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  )                       MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  )                       COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  )                       COD_AGENCIA,
              
              NVL(LP.EST_EJECUCION                       ,' ')                       EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                       FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  )                       EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  )                       EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                      FEC_REGISTRO,--28
              NVL(LP.USU_REGISTRO                        ,' ')                       USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                    FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ')                       USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                       NUM_TARJETA_ORIGEN,
              NVL(
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL   SS  
                 WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA )  ,' ')                       C_DESC_SUCUR,
              NVL(DLD.MON_DESEMBOLSO,'' )                                            MON_DESEMBOLSO,--34
              ' '                                                                    DES_OBSERVACION,
              NVL(
                  (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                     FROM  PMCP_SALDOS PMS
                    WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' ) 
                                                                                     FEC_CORTE,
              NVL(LP.NUM_CUENTA_LP,' ')                                              NUM_CUENTA_LP,
              NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
              NVL(LP.MON_SEGURO,0)                                                   MON_SEGURO,--39
              NVL(LP.NUM_CUOTA_SEG,0)                                                NUM_CUOTA_SEG,
              NVL(LP.MON_CUOTA_SEG,0)                                                MON_CUOTA_SEG,
              NVL(
              	   ( SELECT  DEE.NUM_SECUENCIA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_SECUENCIA_DES,
              NVL(
              	   ( SELECT  DEE.NUM_CAJA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_CAJA_DES,
     
              NVL(
                   ( SELECT  TD.DES_TIPO_DESEMBOLSO
                       FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                      WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
              NVL(
              	   ( SELECT  PP.DES_ELEMENTO 
                       FROM  PUC_PARAMETROS PP 
                      WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                  FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                 WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
              'PROCESADO'                                                             EST_CONCILIACION_DES,
              NVL(TO_CHAR(DLD.FEC_EJECUCION,'DD/MM/YYYY'),' ')                        FEC_PROCESO

                    FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
             INNER  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
             INNER  JOIN   PMCP_CUENTAS PC
                      ON   PC.NUM_CUENTA_PMCP  = LP.NUM_CUENTA_ORIGEN
             INNER  JOIN   PUC_PERSONAS           F
                      ON   DECODE(PC.TIP_DOCUM_IDE,1,141) =F.TIP_DOCUM_IDE 
                           AND
                           PC.NUM_DOCUM_IDE               ='0000'||F.NUM_DOCUM_IDE
                    
                    WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                      AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                      AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                      AND  DLD.EST_EJECUCION='E'
                
         )    VT  
         ORDER BY VT.NRO_SOLICITUD ASC;
  
        ELSE

            -- Establecer variables
            BEGIN

                SELECT COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                INTO v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                FROM
                (
                            SELECT   LP.NRO_SOLICITUD,
                                     DL.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                                     
                              FROM   FINAN_LP_CONCIL_DESEM_LOG DL
                        LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
                        
                        LEFT  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                             WHERE   DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                          
                        UNION ALL
                          
                            SELECT   LP.NRO_SOLICITUD,
                                     DLD.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                                     
                             WHERE   DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND   (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                               AND   DLD.EST_EJECUCION='E'
                          
                 ) VT
                          
                   ORDER BY VT.NRO_SOLICITUD ASC; 
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final   := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
               
             SELECT   VT.*
                     ,NVL(v_nTotal_PaginAS         ,0  ) TOTAL_PAGINAS
                     ,NVL(v_nTotal_Registros       ,0  ) TOTAL_REGISTROS
                     ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(VT.NRO_SOLICITUD )),0) AS RN
              FROM  (
                
                 SELECT  nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                         nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                         nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                         nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                         NVL(F.TIP_DOCUM_IDE                        ,0  ) TIP_DOCUM_IDE,
                         NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                         NVL(
                         ( SELECT  P.VAL_CAD_LARGO
                             FROM  PUC_PARAMETROS P
                            WHERE  P.COD_TABLA = 1
                              AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                         NVL( 
                         ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                             FROM  PUC_PARAMETROS PA 
                            WHERE  PA.COD_TABLA = 240 
                              AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                             
                          NVL(DL.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                          NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                          NVL(to_char(DL.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                          NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                          NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                          NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                          NVL(DL.NUM_CUENTA_PMCP                     ,' ') NUM_CUENTA_ORIGEN,
                          NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                          NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                          NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                          NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                          NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                          NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                          NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                          NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                          NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                          NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                          NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                          NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                          NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                          NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                          NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                          NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                          NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                          NVL(
                          ( SELECT  ss.c_desc_sucur 
                              FROM  ESAC.SAC_SUCURSAL   SS  
                             WHERE  SS.N_ID_SUCUR=LP.COD_AGENCIA )  ,' ') C_DESC_SUCUR,
                          NVL(DL.MON_DESEMBOLSO,'')                            MON_DESEMBOLSO,
                          NVL(DL.DES_OBSERVACION,'')                           DES_OBSERVACION                                      
                          
                                FROM   FINAN_LP_CONCIL_DESEM_LOG DL
                          LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                                  ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
                          
                          LEFT  JOIN   PUC_PERSONAS           F
                                  ON   LP.COD_INTERNO= F.COD_INTERNO
                                  
                          WHERE  DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                            AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                            
                     UNION ALL
    
                        SELECT     nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                                   nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                                   nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                                   nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                                   NVL(F.TIP_DOCUM_IDE                        ,0) TIP_DOCUM_IDE,
                                   NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                                   NVL(
                                   ( SELECT  P.VAL_CAD_LARGO
                                       FROM  PUC_PARAMETROS P
                                      WHERE  P.COD_TABLA = 1
                                        AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                                   NVL( 
                                   ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                                       FROM  PUC_PARAMETROS PA 
                                      WHERE  PA.COD_TABLA = 240 
                                        AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                                       
                                    NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                                    NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                                    NVL(to_char(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                                    NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                                    NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                                    NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                                    NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
                                    NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                                    NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                                    NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                                    NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                                    NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                                    NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                                    NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                                    NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                                    NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                                    NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                                    NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                                    NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                                    NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                                    NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                                    NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                                    NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                                    NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                                    NVL(
                                    ( SELECT  ss.c_desc_sucur 
                                        FROM  ESAC.SAC_SUCURSAL   SS  
                                       WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA)  ,' ') C_DESC_SUCUR,
                                    NVL(DLD.MON_DESEMBOLSO,'')                            MON_DESEMBOLSO,
                                    ' '                           DES_OBSERVACION    
                      
                            FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                     INNER  JOIN   FINAN_LP_SOLICITUD LP 
                              ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                     INNER  JOIN   PUC_PERSONAS           F
                              ON   F.COD_INTERNO=LP.COD_INTERNO
                            
                      WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                        AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                        AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                        AND  DLD.EST_EJECUCION='E'
                   
                   ) VT
                                   
            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY X.NRO_SOLICITUD ASC;

        END IF;

    
              
              
         --
  END;*/
  

/*  PROCEDURE PRC_CON_DESEM_NOCONCIL(     
                                         p_i_vNUMERO_PAGINA   NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO      VARCHAR2,
                                         p_i_vFEC_FINAL       VARCHAR2,
                                         p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,          
                                         p_o_cResultado       OUT c_Valores
                                        ) IS
  
   \*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS NO CONCILIADAS CON LA DATA DE MC.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters : 
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                      
    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : IFU.
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    *\
    v_nTOTAL_REGISTROS                     NUMBER;
    v_nTOTAL_PAGINAS                       NUMBER;
    v_nCantidad_Registros                  NUMBER := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial                    NUMBER;
    v_nRegistro_Final                      NUMBER;
    v_bFLAG_VACIO                          BOOLEAN;

    v_datetime                             DATE;
    
  BEGIN
       
  v_datetime:=TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT  VT.APE_PATERNO,
              VT.APE_MATERNO,
              VT.PRI_NOMBRE,
              VT.SEG_NOMBRE,
              VT.TIP_DOCUM_IDE,
              VT.NUM_DOCUM_IDE,
              VT.DES_DOC_IDE,
              VT.DES_ESTADO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.NRO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.FEC_SOLICITUD,
              VT.NRO_SECUENCIA,
              VT.COD_INTERNO,
              VT.TIP_PRODUCTO,
              VT.NUM_CUENTA_ORIGEN,
              VT.MON_SOLICITADO,
              VT.COD_TASA_COMPRAS,
              VT.COD_TASA_DISP_EFEC,
              VT.NUM_CUOTA_LP,
              MON_CUOTA_LP,
              COD_VENDEDOR,
              COD_AGENCIA,
              NUM_CUENTA_LP,
              EST_EJECUCION,
              FEC_EJECUCION,
              EST_SOLICITUD,
              EST_REGISTRO,
              FEC_REGISTRO,--28
              USU_REGISTRO,
              FEC_ACTUALIZACION,
              USU_ACTUALIZACION,
              NUM_TARJETA_ORIGEN,
              C_DESC_SUCUR,
              MON_DESEMBOLSO,
              DES_OBSERVACION,
              FEC_CORTE,
              NUM_CUENTA_LP,
              NUM_TARJETA_LP,
              MON_SEGURO,
              NUM_CUOTA_SEG,
              MON_CUOTA_SEG,
              NUM_SECUENCIA_DES,
              NUM_CAJA_DES,
              DES_TIPO_DESEMBOLSO,
              EST_DESEMBOLSO_DES,
              EST_CONCILIACION_DES,
              FEC_PROCESO,
              DES_ESTADO_SOLICITUD
              
      FROM 
      (
        SELECT 
             NVL(F.APE_PATERNO                          ,' ')                     APE_PATERNO,
             NVL(F.APE_MATERNO                          ,' ')                     APE_MATERNO,
             NVL(F.PRI_NOMBRE                           ,' ')                     PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                           ,' ')                     SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0  )                     TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ')                     NUM_DOCUM_IDE,
             NVL(
             ( SELECT P.VAL_CAD_LARGO
                 FROM PUC_PARAMETROS P
                WHERE P.COD_TABLA = 1
                  AND P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                    DES_DOC_IDE,
             NVL( 
             ( SELECT SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                 FROM PUC_PARAMETROS PA 
                WHERE PA.COD_TABLA = 240 
                  AND PA.Cod_Parametro = LP.Est_Solicitud),' ')                   DES_ESTADO_SOLICITUD, --8
                 
              NVL(DL.NRO_SOLICITUD                       ,' ')                    NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  )                    COD_TIPO_DESEMBOLSO,
              NVL(to_char(DL.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ')                   FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  )                    NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ')                    COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  )                    TIP_PRODUCTO,
              NVL(DL.NUM_CUENTA_PMCP                     ,' ')                    NUM_CUENTA_ORIGEN,
              NVL(LP.MON_SOLICITADO                      ,0  )                    MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ')                    COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                    COD_TASA_DISP_EFEC,--18
              NVL(LP.NUM_CUOTA_LP                        ,0  )                    NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  )                    MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  )                    COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  )                    COD_AGENCIA,
              
              NVL(LP.EST_EJECUCION                       ,' ')                    EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                    FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  )                    EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  )                    EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                   FEC_REGISTRO,--28
              NVL(LP.USU_REGISTRO                        ,' ')                    USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                 FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ')                    USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                    NUM_TARJETA_ORIGEN,
              NVL(
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL  SS  
                 WHERE  SS.N_ID_SUCUR =  LP.COD_AGENCIA)  ,' ')                   C_DESC_SUCUR,
              NVL(DL.MON_DESEMBOLSO,'' )                                          MON_DESEMBOLSO,
              NVL(DL.DES_OBSERVACION,' ')                                         DES_OBSERVACION,
              NVL(
              (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                 FROM  PMCP_SALDOS PMS
                WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' )      FEC_CORTE,
              NVL(LP.NUM_CUENTA_LP,' ')                                           NUM_CUENTA_LP,
              \*
              NVL(
                	  (SELECT DISTINCT TO_CHAR(MAX(TO_NUMBER(PPP.NUM_TARJETA)))
                       FROM PUC_PERSONAS_PROD  PPP
                      WHERE PPP.NUM_CUENTA=LP.NUM_CUENTA_LP),' ')                 NUM_TARJETA_LP,
              *\
              NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
              NVL(LP.MON_SEGURO,0)                                                MON_SEGURO,--39
              NVL(LP.NUM_CUOTA_SEG,0)                                             NUM_CUOTA_SEG,
              NVL(LP.MON_CUOTA_SEG,0)                                             MON_CUOTA_SEG,
              NVL(
              	   ( SELECT  DEE.NUM_SECUENCIA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)               NUM_SECUENCIA_DES,
              NVL(
              	   ( SELECT  DEE.NUM_CAJA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)               NUM_CAJA_DES,
             
              NVL(
                   ( SELECT  TD.DES_TIPO_DESEMBOLSO
                       FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                      WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
              NVL(
              	   ( SELECT  PP.DES_ELEMENTO 
                       FROM  PUC_PARAMETROS PP 
                      WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                  FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                 WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
              'NO PROCESADO'                                                       EST_CONCILIACION_DES,
              NVL(TO_CHAR(DL.FEC_REGISTRO,'DD/MM/YYYY'),' ')                       FEC_PROCESO
             
                   
                    FROM   FINAN_LP_CONCIL_DESEM_LOG DL
              LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
              
              LEFT  JOIN   PUC_PERSONAS           F
                      ON   F.COD_INTERNO = LP.COD_INTERNO
                    
                  WHERE  DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                    AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                    AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA 
                          OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                          
                          

         UNION ALL-- ========================
         
         SELECT 
             NVL(F.APE_PATERNO                          ,' ')                        APE_PATERNO,
             NVL(F.APE_MATERNO                          ,' ')                        APE_MATERNO,
             NVL(F.PRI_NOMBRE                           ,' ')                        PRI_NOMBRE,
             NVL(F.SEG_NOMBRE                           ,' ')                        SEG_NOMBRE,
             NVL(F.TIP_DOCUM_IDE                        ,0  )                        TIP_DOCUM_IDE,
             NVL(F.NUM_DOCUM_IDE                        ,' ')                        NUM_DOCUM_IDE,
             NVL(
             ( SELECT  P.VAL_CAD_LARGO
                 FROM  PUC_PARAMETROS P
                WHERE  P.COD_TABLA = 1
                  AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                       DES_DOC_IDE,
             NVL( 
             ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                 FROM  PUC_PARAMETROS PA 
                WHERE  PA.COD_TABLA = 240 
                  AND  PA.Cod_Parametro = LP.Est_Solicitud),' ')                      DES_ESTADO_SOLICITUD,--8
                 
              NVL(DLD.NRO_SOLICITUD                       ,' ')      	               NRO_SOLICITUD,
              NVL(LP.COD_TIPO_DESEMBOLSO                  ,0  )                      COD_TIPO_DESEMBOLSO,
              NVL(TO_CHAR(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY'),' ')                      FEC_SOLICITUD,
              NVL(LP.NRO_SECUENCIA                       ,0  )                       NRO_SECUENCIA,
              NVL(LP.COD_INTERNO                         ,' ')                       COD_INTERNO,
              NVL(LP.TIP_PRODUCTO                        ,0  )                       TIP_PRODUCTO,
              NVL(LP.NUM_CUENTA_ORIGEN                   ,' ')                       NUM_CUENTA_ORIGEN,
              NVL(LP.MON_SOLICITADO                      ,0  )                       MON_SOLICITADO,
              NVL(LP.COD_TASA_COMPRAS                    ,' ')                       COD_TASA_COMPRAS,
              NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                       COD_TASA_DISP_EFEC,--18
              NVL(LP.NUM_CUOTA_LP                        ,0  )                       NUM_CUOTA_LP ,
              NVL(LP.MON_CUOTA_LP                        ,0  )                       MON_CUOTA_LP,
              NVL(LP.COD_VENDEDOR                        ,0  )                       COD_VENDEDOR,
              NVL(LP.COD_AGENCIA                         ,0  )                       COD_AGENCIA,
              
              NVL(LP.EST_EJECUCION                       ,' ')                       EST_EJECUCION,
              NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                       FEC_EJECUCION,
              NVL(LP.EST_SOLICITUD                       ,0  )                       EST_SOLICITUD,
              NVL(LP.EST_REGISTRO                        ,0  )                       EST_REGISTRO,
              NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                      FEC_REGISTRO,--28
              NVL(LP.USU_REGISTRO                        ,' ')                       USU_REGISTRO,
              NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                    FEC_ACTUALIZACION,
              NVL(LP.USU_ACTUALIZACION                   ,' ')                       USU_ACTUALIZACION,
              NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                       NUM_TARJETA_ORIGEN,
              NVL(
              ( SELECT  ss.c_desc_sucur 
                  FROM  ESAC.SAC_SUCURSAL   SS  
                 WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA )  ,' ')                       C_DESC_SUCUR,
              NVL(DLD.MON_DESEMBOLSO,'' )                                            MON_DESEMBOLSO,--34
              ' '                                                                    DES_OBSERVACION,
              NVL(
                  (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                     FROM  PMCP_SALDOS PMS
                    WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' ) 
                                                                                     FEC_CORTE,
              NVL(LP.NUM_CUENTA_LP,' ')                                              NUM_CUENTA_LP,
              NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
              NVL(LP.MON_SEGURO,0)                                                   MON_SEGURO,--39
              NVL(LP.NUM_CUOTA_SEG,0)                                                NUM_CUOTA_SEG,
              NVL(LP.MON_CUOTA_SEG,0)                                                MON_CUOTA_SEG,
              NVL(
              	   ( SELECT  DEE.NUM_SECUENCIA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_SECUENCIA_DES,
              NVL(
              	   ( SELECT  DEE.NUM_CAJA_DES 
                       FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                      WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_CAJA_DES,
     
              NVL(
                   ( SELECT  TD.DES_TIPO_DESEMBOLSO
                       FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                      WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
              NVL(
              	   ( SELECT  PP.DES_ELEMENTO 
                       FROM  PUC_PARAMETROS PP 
                      WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                  FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                 WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
              'PROCESADO'                                                             EST_CONCILIACION_DES,
              NVL(TO_CHAR(DLD.FEC_EJECUCION,'DD/MM/YYYY'),' ')                        FEC_PROCESO

                    FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
             INNER  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
             INNER  JOIN   PMCP_CUENTAS PC
                      ON   PC.NUM_CUENTA_PMCP  = LP.NUM_CUENTA_ORIGEN
             INNER  JOIN   PUC_PERSONAS           F
                      ON   DECODE(PC.TIP_DOCUM_IDE,1,141) =F.TIP_DOCUM_IDE 
                           AND
                           PC.NUM_DOCUM_IDE               ='0000'||F.NUM_DOCUM_IDE
                    
                    WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                      AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                      AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                      AND  DLD.EST_EJECUCION='E'
                
         )    VT  
         ORDER BY VT.NRO_SOLICITUD ASC;
  
        ELSE

            -- Establecer variables
            BEGIN

                SELECT COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                INTO v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                FROM
                (
                            SELECT   LP.NRO_SOLICITUD,
                                     DL.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                                     
                              FROM   FINAN_LP_CONCIL_DESEM_LOG DL
                        LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
                        
                        LEFT  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                             WHERE   DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                          
                        UNION ALL
                          
                            SELECT   LP.NRO_SOLICITUD,
                                     DLD.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                                     
                             WHERE   DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND   (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                               AND   DLD.EST_EJECUCION='E'
                          
                 ) VT
                          
                   ORDER BY VT.NRO_SOLICITUD ASC; 
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final   := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
               
             SELECT   VT.*
                     ,NVL(v_nTotal_PaginAS         ,0  ) TOTAL_PAGINAS
                     ,NVL(v_nTotal_Registros       ,0  ) TOTAL_REGISTROS
                     ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(VT.NRO_SOLICITUD )),0) AS RN
              FROM  (
                
                 SELECT  nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                         nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                         nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                         nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                         NVL(F.TIP_DOCUM_IDE                        ,0  ) TIP_DOCUM_IDE,
                         NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                         NVL(
                         ( SELECT  P.VAL_CAD_LARGO
                             FROM  PUC_PARAMETROS P
                            WHERE  P.COD_TABLA = 1
                              AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                         NVL( 
                         ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                             FROM  PUC_PARAMETROS PA 
                            WHERE  PA.COD_TABLA = 240 
                              AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                             
                          NVL(DL.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                          NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                          NVL(to_char(DL.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                          NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                          NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                          NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                          NVL(DL.NUM_CUENTA_PMCP                     ,' ') NUM_CUENTA_ORIGEN,
                          NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                          NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                          NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                          NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                          NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                          NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                          NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                          NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                          NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                          NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                          NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                          NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                          NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                          NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                          NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                          NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                          NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                          NVL(
                          ( SELECT  ss.c_desc_sucur 
                              FROM  ESAC.SAC_SUCURSAL   SS  
                             WHERE  SS.N_ID_SUCUR=LP.COD_AGENCIA )  ,' ') C_DESC_SUCUR,
                          NVL(DL.MON_DESEMBOLSO,'')                            MON_DESEMBOLSO,
                          NVL(DL.DES_OBSERVACION,'')                           DES_OBSERVACION                                      
                          
                                FROM   FINAN_LP_CONCIL_DESEM_LOG DL
                          LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                                  ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
                          
                          LEFT  JOIN   PUC_PERSONAS           F
                                  ON   LP.COD_INTERNO= F.COD_INTERNO
                                  
                          WHERE  DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                            AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                            
                     UNION ALL
    
                        SELECT     nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                                   nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                                   nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                                   nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                                   NVL(F.TIP_DOCUM_IDE                        ,0) TIP_DOCUM_IDE,
                                   NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                                   NVL(
                                   ( SELECT  P.VAL_CAD_LARGO
                                       FROM  PUC_PARAMETROS P
                                      WHERE  P.COD_TABLA = 1
                                        AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                                   NVL( 
                                   ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                                       FROM  PUC_PARAMETROS PA 
                                      WHERE  PA.COD_TABLA = 240 
                                        AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                                       
                                    NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                                    NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                                    NVL(to_char(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                                    NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                                    NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                                    NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                                    NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
                                    NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                                    NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                                    NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                                    NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                                    NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                                    NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                                    NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                                    NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                                    NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                                    NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                                    NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                                    NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                                    NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                                    NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                                    NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                                    NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                                    NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                                    NVL(
                                    ( SELECT  ss.c_desc_sucur 
                                        FROM  ESAC.SAC_SUCURSAL   SS  
                                       WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA)  ,' ') C_DESC_SUCUR,
                                    NVL(DLD.MON_DESEMBOLSO,'')                            MON_DESEMBOLSO,
                                    ' '                           DES_OBSERVACION    
                      
                            FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                     INNER  JOIN   FINAN_LP_SOLICITUD LP 
                              ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                     INNER  JOIN   PUC_PERSONAS           F
                              ON   F.COD_INTERNO=LP.COD_INTERNO
                            
                      WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                        AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                        AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                        AND  DLD.EST_EJECUCION='E'
                   
                   ) VT
                                   
            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY X.NRO_SOLICITUD ASC;

        END IF;

    
              
              
         --
  END;*/
  
  
    -- INI - NEW - 15052014...
    
/*    PROCEDURE PRC_CON_DESEM_NOCONCIL(     
                                         p_i_vNUMERO_PAGINA   NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO      VARCHAR2,
                                         p_i_vFEC_FINAL       VARCHAR2,
                                         p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,          
                                         p_o_cResultado       OUT c_Valores
                                        ) IS
  
   \*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS NO CONCILIADAS CON LA DATA DE MC.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters : 
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                      
    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : IFU.
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    *\
    v_nTOTAL_REGISTROS                     NUMBER;
    v_nTOTAL_PAGINAS                       NUMBER;
    v_nCantidad_Registros                  NUMBER := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial                    NUMBER;
    v_nRegistro_Final                      NUMBER;
    v_bFLAG_VACIO                          BOOLEAN;

    v_FechaInicio                            DATE;
    
    --
    v_Esta_Anulado                         NUMBER(6):= FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');
    
    
  BEGIN
       
  v_FechaInicio:=TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT  VT.APE_PATERNO,
              VT.APE_MATERNO,
              VT.PRI_NOMBRE,
              VT.SEG_NOMBRE,
              VT.TIP_DOCUM_IDE,
              VT.NUM_DOCUM_IDE,
              VT.DES_DOC_IDE,
              VT.DES_ESTADO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.NRO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.FEC_SOLICITUD,
              VT.NRO_SECUENCIA,
              VT.COD_INTERNO,
              VT.TIP_PRODUCTO,
              VT.NUM_CUENTA_ORIGEN,
              VT.MON_SOLICITADO,
              VT.COD_TASA_COMPRAS,
              VT.COD_TASA_DISP_EFEC,
              VT.NUM_CUOTA_LP,
              MON_CUOTA_LP,
              COD_VENDEDOR,
              COD_AGENCIA,
              NUM_CUENTA_LP,
              EST_EJECUCION,
              FEC_EJECUCION,
              EST_SOLICITUD,
              EST_REGISTRO,
              FEC_REGISTRO,--28
              USU_REGISTRO,
              FEC_ACTUALIZACION,
              USU_ACTUALIZACION,
              NUM_TARJETA_ORIGEN,
              C_DESC_SUCUR,
              MON_DESEMBOLSO,
              DES_OBSERVACION,
              FEC_CORTE,
              NUM_CUENTA_LP,
              NUM_TARJETA_LP,
              MON_SEGURO,
              NUM_CUOTA_SEG,
              MON_CUOTA_SEG,
              NUM_SECUENCIA_DES,
              NUM_CAJA_DES,
              DES_TIPO_DESEMBOLSO,
              EST_DESEMBOLSO_DES,
              EST_CONCILIACION_DES,
              FEC_PROCESO,
              DES_ESTADO_SOLICITUD
              
      FROM 
      (
                  SELECT 
                           NVL(F.APE_PATERNO                          ,' ')                        APE_PATERNO,
                           NVL(F.APE_MATERNO                          ,' ')                        APE_MATERNO,
                           NVL(F.PRI_NOMBRE                           ,' ')                        PRI_NOMBRE,
                           NVL(F.SEG_NOMBRE                           ,' ')                        SEG_NOMBRE,
                           NVL(F.TIP_DOCUM_IDE                        ,0  )                        TIP_DOCUM_IDE,
                           NVL(F.NUM_DOCUM_IDE                        ,' ')                        NUM_DOCUM_IDE,
                           NVL(
                           ( SELECT  P.VAL_CAD_LARGO
                               FROM  PUC_PARAMETROS P
                              WHERE  P.COD_TABLA = 1
                                AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                       DES_DOC_IDE,
                           NVL( 
                           ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                               FROM  PUC_PARAMETROS PA 
                              WHERE  PA.COD_TABLA = 240 
                                AND  PA.Cod_Parametro = LP.Est_Solicitud),' ')                      DES_ESTADO_SOLICITUD,--8
                               
                            NVL(DLD.NRO_SOLICITUD                       ,' ')      	               NRO_SOLICITUD,
                            NVL(LP.COD_TIPO_DESEMBOLSO                  ,0  )                      COD_TIPO_DESEMBOLSO,
                            NVL(TO_CHAR(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY'),' ')                      FEC_SOLICITUD,
                            NVL(LP.NRO_SECUENCIA                       ,0  )                       NRO_SECUENCIA,
                            NVL(LP.COD_INTERNO                         ,' ')                       COD_INTERNO,
                            NVL(LP.TIP_PRODUCTO                        ,0  )                       TIP_PRODUCTO,
                            NVL(LP.NUM_CUENTA_ORIGEN                   ,' ')                       NUM_CUENTA_ORIGEN,
                            NVL(LP.MON_SOLICITADO                      ,0  )                       MON_SOLICITADO,
                            NVL(LP.COD_TASA_COMPRAS                    ,' ')                       COD_TASA_COMPRAS,
                            NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                       COD_TASA_DISP_EFEC,--18
                            NVL(LP.NUM_CUOTA_LP                        ,0  )                       NUM_CUOTA_LP ,
                            NVL(LP.MON_CUOTA_LP                        ,0  )                       MON_CUOTA_LP,
                            NVL(LP.COD_VENDEDOR                        ,0  )                       COD_VENDEDOR,
                            NVL(LP.COD_AGENCIA                         ,0  )                       COD_AGENCIA,
                            
                            NVL(LP.EST_EJECUCION                       ,' ')                       EST_EJECUCION,
                            NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                       FEC_EJECUCION,
                            NVL(LP.EST_SOLICITUD                       ,0  )                       EST_SOLICITUD,
                            NVL(LP.EST_REGISTRO                        ,0  )                       EST_REGISTRO,
                            NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                      FEC_REGISTRO,--28
                            NVL(LP.USU_REGISTRO                        ,' ')                       USU_REGISTRO,
                            NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                    FEC_ACTUALIZACION,
                            NVL(LP.USU_ACTUALIZACION                   ,' ')                       USU_ACTUALIZACION,
                            NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                       NUM_TARJETA_ORIGEN,
                            NVL(
                            ( SELECT  ss.c_desc_sucur 
                                FROM  ESAC.SAC_SUCURSAL   SS  
                               WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA )  ,' ')                       C_DESC_SUCUR,
                            NVL(DLD.MON_DESEMBOLSO,'' )                                            MON_DESEMBOLSO,--34
                            ' '                                                                    DES_OBSERVACION,
                            NVL(
                                (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                                   FROM  PMCP_SALDOS PMS
                                  WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' ) 
                                                                                                   FEC_CORTE,
                            NVL(LP.NUM_CUENTA_LP,' ')                                              NUM_CUENTA_LP,
                            NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
                            NVL(LP.MON_SEGURO,0)                                                   MON_SEGURO,--39
                            NVL(LP.NUM_CUOTA_SEG,0)                                                NUM_CUOTA_SEG,
                            NVL(LP.MON_CUOTA_SEG,0)                                                MON_CUOTA_SEG,
                            NVL(
                                 ( SELECT  DEE.NUM_SECUENCIA_DES 
                                     FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                                    WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_SECUENCIA_DES,
                            NVL(
                                 ( SELECT  DEE.NUM_CAJA_DES 
                                     FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                                    WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                  NUM_CAJA_DES,
                   
                            NVL(
                                 ( SELECT  TD.DES_TIPO_DESEMBOLSO
                                     FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                                    WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
                            NVL(
                                 ( SELECT  PP.DES_ELEMENTO 
                                     FROM  PUC_PARAMETROS PP 
                                    WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                                FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                               WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
                            CASE WHEN DLD.EST_EJECUCION='E' 
                                 THEN 'PROCESADO'
                                 ELSE 'NO PROCESADO'
                            END                                                                     EST_CONCILIACION_DES,
                            CASE WHEN DLD.EST_EJECUCION='E' 
                                 THEN NVL(TO_CHAR(DLD.FEC_EJECUCION,'DD/MM/YYYY'),' ')                       
                                 ELSE NVL( ( SELECT  TO_CHAR(MAX(DLO.FEC_REGISTRO),'DD/MM/YYYY') 
                                               FROM  FINAN_LP_CONCIL_DESEM_LOG DLO
                                              WHERE  DLO.NRO_SOLICITUD=DLD.NRO_SOLICITUD )
                                             ,' ')
                            END                                                                      FEC_PROCESO
                    FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
             INNER  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
             
             INNER  JOIN   PUC_PERSONAS           F
                      ON   F.COD_INTERNO      = LP.COD_INTERNO
                                          
                    WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                      AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                      AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                      AND  DLD.EST_DESEMBOLSO != v_Esta_Anulado
                
         )    VT  
         ORDER BY VT.NRO_SOLICITUD ASC;
  
        ELSE

            -- Establecer variables
            BEGIN

                SELECT COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                INTO v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                FROM
                (
                            SELECT   LP.NRO_SOLICITUD,
                                     DLD.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                                                      
                              WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                                AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                                AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                                AND  DLD.EST_DESEMBOLSO != v_Esta_Anulado
                 ) VT
                          
                   ORDER BY VT.NRO_SOLICITUD ASC; 
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final   := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
               
             SELECT   VT.*
                     ,NVL(v_nTotal_PaginAS         ,0  ) TOTAL_PAGINAS
                     ,NVL(v_nTotal_Registros       ,0  ) TOTAL_REGISTROS
                     ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(VT.NRO_SOLICITUD )),0) AS RN
              FROM  (
                        SELECT     nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                                   nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                                   nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                                   nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                                   NVL(F.TIP_DOCUM_IDE                        ,0) TIP_DOCUM_IDE,
                                   NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                                   NVL(
                                   ( SELECT  P.VAL_CAD_LARGO
                                       FROM  PUC_PARAMETROS P
                                      WHERE  P.COD_TABLA = 1
                                        AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                                   NVL( 
                                   ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                                       FROM  PUC_PARAMETROS PA 
                                      WHERE  PA.COD_TABLA = 240 
                                        AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                                       
                                    NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                                    NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                                    NVL(to_char(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                                    NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                                    NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                                    NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                                    NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
                                    NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                                    NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                                    NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                                    NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                                    NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                                    NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                                    NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                                    NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                                    NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                                    NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                                    NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                                    NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                                    NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                                    NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                                    NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                                    NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                                    NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                                    NVL(
                                    ( SELECT  ss.c_desc_sucur 
                                        FROM  ESAC.SAC_SUCURSAL   SS  
                                       WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA)  ,' ') C_DESC_SUCUR,
                                    NVL(DLD.MON_DESEMBOLSO,'')                       MON_DESEMBOLSO,
                                    ' '                                              DES_OBSERVACION    
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                                                      
                             WHERE   DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                               AND   TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND   (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                               AND   DLD.EST_DESEMBOLSO != v_Esta_Anulado
                               
                   ) VT
                                   
            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY X.NRO_SOLICITUD ASC;

        END IF;
                            
         --
  END;*/
    
  ------------------------------------
  ------------------------------------
  
    PROCEDURE PRC_CON_DESEM_NOCONCIL(     
                                         p_i_vNUMERO_PAGINA   NUMBER DEFAULT null,
                                         p_i_vFEC_INICIO      VARCHAR2,
                                         p_i_vFEC_FINAL       VARCHAR2,
                                         p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE,          
                                         p_o_cResultado       OUT c_Valores
                                        ) IS
  
   /*
    -- *****************************************************************************************
    -- Descripcion: Procedure utilizado en el Sistema IFU para consultar lAS LineAS ParalelAS NO CONCILIADAS CON LA DATA DE MC.
    --              ESQUEMA: EFINAN@FULXT01D
    --
    -- Input Parameters : 
                       p_i_vNUMERO_PAGINA   number default null  --> Numero de Pagina 0 es para obtener todos y mayor de 0 es para paginacion
                       p_i_vFEC_INICIO      varchar2             --> fecha de Inicio
                       p_i_vFEC_FINAL       varchar2             --> fecha final
                       p_i_vCOD_AGENCIA     FINAN_LP_SOLICITUD.Cod_Agencia%TYPE --> Cod Agencia
                      
    -- Output Parameters:  p_o_cResultado   CURSOR     -->  Cursor con el detalle de la consulta.
    -- Author     : Eduardo A.J. Zuñiga Gamarra
    -- Proyecto   : IFU.
    -- Responsable: Oswaldo Valdivia Otiniano.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014       E.Zuñiga           CREACION           XXX
    -- *****************************************************************************************
    ---
    ---
    */
    v_nTOTAL_REGISTROS                     NUMBER;
    v_nTOTAL_PAGINAS                       NUMBER;
    v_nCantidad_Registros                  NUMBER   := 10;   --> Para el numero de registros por paginacion...
    v_nRegistro_Inicial                    NUMBER;
    v_nRegistro_Final                      NUMBER;
    v_bFLAG_VACIO                          BOOLEAN;

    v_FechaInicio                          DATE;
    --
    v_Esta_Anulado                         NUMBER(6):= FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM_X_ELE(240,6,'');
    
    
  BEGIN
       
  v_FechaInicio := TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY');
  
  IF (p_i_vNUMERO_PAGINA IS NULL OR p_i_vNUMERO_PAGINA <= 0) THEN

      OPEN p_o_cResultado FOR
      SELECT  VT.APE_PATERNO,
              VT.APE_MATERNO,
              VT.PRI_NOMBRE,
              VT.SEG_NOMBRE,
              VT.TIP_DOCUM_IDE,
              VT.NUM_DOCUM_IDE,
              VT.DES_DOC_IDE,
              VT.DES_ESTADO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.NRO_SOLICITUD,
              VT.COD_TIPO_DESEMBOLSO,
              VT.FEC_SOLICITUD,
              VT.NRO_SECUENCIA,
              VT.COD_INTERNO,
              VT.TIP_PRODUCTO,
              VT.NUM_CUENTA_ORIGEN,
              VT.MON_SOLICITADO,
              VT.COD_TASA_COMPRAS,
              VT.COD_TASA_DISP_EFEC,
              VT.NUM_CUOTA_LP,
              MON_CUOTA_LP,
              COD_VENDEDOR,
              COD_AGENCIA,
              NUM_CUENTA_LP,
              EST_EJECUCION,
              FEC_EJECUCION,
              EST_SOLICITUD,
              EST_REGISTRO,
              FEC_REGISTRO,--28
              USU_REGISTRO,
              FEC_ACTUALIZACION,
              USU_ACTUALIZACION,
              NUM_TARJETA_ORIGEN,
              C_DESC_SUCUR,
              MON_DESEMBOLSO,
              DES_OBSERVACION,
              FEC_CORTE,
              NUM_CUENTA_LP,
              NUM_TARJETA_LP,
              MON_SEGURO,
              NUM_CUOTA_SEG,
              MON_CUOTA_SEG,
              NUM_SECUENCIA_DES,
              NUM_CAJA_DES,
              DES_TIPO_DESEMBOLSO,
              EST_DESEMBOLSO_DES,
              EST_CONCILIACION_DES,
              FEC_PROCESO,
              DES_ESTADO_SOLICITUD
              
      FROM 
      (
                    SELECT 
                           NVL(F.APE_PATERNO                          ,' ')                        APE_PATERNO,
                           NVL(F.APE_MATERNO                          ,' ')                        APE_MATERNO,
                           NVL(F.PRI_NOMBRE                           ,' ')                        PRI_NOMBRE,
                           NVL(F.SEG_NOMBRE                           ,' ')                        SEG_NOMBRE,
                           NVL(F.TIP_DOCUM_IDE                        ,0  )                        TIP_DOCUM_IDE,
                           NVL(F.NUM_DOCUM_IDE                        ,' ')                        NUM_DOCUM_IDE,
                           NVL(
                           ( SELECT  P.VAL_CAD_LARGO
                               FROM  PUC_PARAMETROS P
                              WHERE  P.COD_TABLA = 1
                                AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ')                       DES_DOC_IDE,
                           NVL( 
                           ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                               FROM  PUC_PARAMETROS PA 
                              WHERE  PA.COD_TABLA = 240 
                                AND  PA.Cod_Parametro = LP.Est_Solicitud),' ')                      DES_ESTADO_SOLICITUD,--8
                               
                            NVL(DLD.NRO_SOLICITUD                       ,' ')      	               NRO_SOLICITUD,
                            NVL(LP.COD_TIPO_DESEMBOLSO                  ,0  )                      COD_TIPO_DESEMBOLSO,
                            NVL(TO_CHAR(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY'),' ')                      FEC_SOLICITUD,
                            NVL(LP.NRO_SECUENCIA                       ,0  )                       NRO_SECUENCIA,
                            NVL(LP.COD_INTERNO                         ,' ')                       COD_INTERNO,
                            NVL(LP.TIP_PRODUCTO                        ,0  )                       TIP_PRODUCTO,
                            NVL(LP.NUM_CUENTA_ORIGEN                   ,' ')                       NUM_CUENTA_ORIGEN,
                            NVL(LP.MON_SOLICITADO                      ,0  )                       MON_SOLICITADO,
                            NVL(LP.COD_TASA_COMPRAS                    ,' ')                       COD_TASA_COMPRAS,
                            NVL(LP.COD_TASA_DISP_EFEC                  ,' ')                       COD_TASA_DISP_EFEC,--18
                            NVL(LP.NUM_CUOTA_LP                        ,0  )                       NUM_CUOTA_LP ,
                            NVL(LP.MON_CUOTA_LP                        ,0  )                       MON_CUOTA_LP,
                            NVL(LP.COD_VENDEDOR                        ,0  )                       COD_VENDEDOR,
                            NVL(LP.COD_AGENCIA                         ,0  )                       COD_AGENCIA,
                            NVL(LP.EST_EJECUCION                       ,' ')                       EST_EJECUCION,
                            NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ')                       FEC_EJECUCION,
                            NVL(LP.EST_SOLICITUD                       ,0  )                       EST_SOLICITUD,
                            NVL(LP.EST_REGISTRO                        ,0  )                       EST_REGISTRO,
                            NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  )                      FEC_REGISTRO,--28
                            NVL(LP.USU_REGISTRO                        ,' ')                       USU_REGISTRO,
                            NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ')                    FEC_ACTUALIZACION,
                            NVL(LP.USU_ACTUALIZACION                   ,' ')                       USU_ACTUALIZACION,
                            NVL(LP.NUM_TARJETA_ORIGEN                  ,' ')                       NUM_TARJETA_ORIGEN,
                            NVL(
                            ( SELECT  ss.c_desc_sucur 
                                FROM  ESAC.SAC_SUCURSAL   SS  
                               WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA )  ,' ')                      C_DESC_SUCUR,
                            NVL(DLD.MON_DESEMBOLSO,'' )                                            MON_DESEMBOLSO,--34
                            ' '                                                                    DES_OBSERVACION,
                            NVL(
                                (SELECT  TO_CHAR(PMS.CIC_FACTURACION) 
                                   FROM  PMCP_SALDOS PMS
                                  WHERE  PMS.NUM_CUENTA_PMCP=LP.NUM_CUENTA_ORIGEN),' ' ) 
                                                                                                   FEC_CORTE,
                            NVL(LP.NUM_CUENTA_LP,' ')                                              NUM_CUENTA_LP,
                            NVL(FINAN_PKG_UTILITARIOS.FNC_OBT_NUM_TARJETA_LP(LP.Num_Cuenta_Lp ),' ') NUM_TARJETA_LP,
                            NVL(LP.MON_SEGURO,0)                                                   MON_SEGURO,--39
                            NVL(LP.NUM_CUOTA_SEG,0)                                                NUM_CUOTA_SEG,
                            NVL(LP.MON_CUOTA_SEG,0)                                                MON_CUOTA_SEG,
                            NVL(
                                 ( SELECT  DEE.NUM_SECUENCIA_DES 
                                     FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                                    WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                 NUM_SECUENCIA_DES,
                            NVL(
                                 ( SELECT  DEE.NUM_CAJA_DES 
                                     FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE 
                                    WHERE  DEE.NRO_SOLICITUD=LP.NRO_SOLICITUD), 0)                 NUM_CAJA_DES,
                            NVL(
                                 ( SELECT  TD.DES_TIPO_DESEMBOLSO
                                     FROM  FINAN_LP_TIPO_DESEMBOLSO TD
                                    WHERE  TD.COD_TIPO_DESEMBOLSO   = LP.COD_TIPO_DESEMBOLSO)  ,' ') DES_TIPO_DESEMBOLSO,
                            NVL(
                                 ( SELECT  PP.DES_ELEMENTO 
                                     FROM  PUC_PARAMETROS PP 
                                    WHERE  PP.COD_PARAMETRO=( SELECT  DEE.EST_DESEMBOLSO
                                                                FROM  FINAN_LP_DESEMBOLSO_ENTEFE DEE
                                                               WHERE  DEE.NRO_SOLICITUD   = LP.NRO_SOLICITUD)), ' ')  EST_DESEMBOLSO_DES,
                            CASE WHEN DLD.EST_EJECUCION='E' 
                                 THEN 'PROCESADO'
                                 ELSE 'NO PROCESADO'
                            END                                                                     EST_CONCILIACION_DES,
                            -- INI - NEW - 15052014
                            /*CASE WHEN DLD.EST_EJECUCION='E' 
                                 THEN NVL( ( SELECT  TO_CHAR(MAX(LC.FEC_PROCESO),'DD/MM/YYYY') 
                                               FROM  PMCP_LOG_CONTABLE LC 
                                              WHERE  LC.NUM_CUENTA_PMCP = LP.NUM_CUENTA_LP )
                                             ,' ')                     
                                 ELSE ' '
                            END                                                                      FEC_PROCESO*/
                            --
                            CASE WHEN DLD.EST_EJECUCION='E' 
                                 THEN NVL( ( SELECT  TO_CHAR(MAX(LC.FEC_PROCESO),'DD/MM/YYYY') 
                                             FROM    PMCP_LOG_CONTABLE LC 
                                             WHERE   LC.NUM_CUENTA_PMCP = LP.NUM_CUENTA_LP
                                                     AND LC.COD_TRX      = 84 
                                                     AND LC.FEC_PROCESO  >= TO_DATE(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY')
                                            )
                                             ,' ')                     
                                 ELSE ' '
                            END                                                                      FEC_PROCESO                            
                            -- FIN - NEW - 15052014
                    FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
             INNER  JOIN   FINAN_LP_SOLICITUD LP 
                      ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
             INNER  JOIN   PUC_PERSONAS           F
                      ON   F.COD_INTERNO       = LP.COD_INTERNO
                                          
                    WHERE  DLD.FEC_DESEMBOLSO BETWEEN  TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                                                  AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                      AND  (LP.COD_AGENCIA 	    = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                      AND  DLD.EST_DESEMBOLSO  != v_Esta_Anulado
                      
                
         )    VT  
         ORDER BY VT.NRO_SOLICITUD ASC;
  
        ELSE

            BEGIN

                SELECT COUNT(1), CEIL(COUNT(1) / v_nCantidad_Registros)
                INTO v_nTOTAL_REGISTROS, v_nTOTAL_PAGINAS
                FROM
                (
                            SELECT   LP.NRO_SOLICITUD,
                                     DLD.FEC_DESEMBOLSO,
                                     LP.COD_AGENCIA
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO       = LP.COD_INTERNO
                                                      
                             WHERE   DLD.FEC_DESEMBOLSO BETWEEN  TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                                                            AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND   (LP.COD_AGENCIA       =  p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                               AND   DLD.EST_DESEMBOLSO   !=  v_Esta_Anulado
                 ) VT
                   ORDER BY VT.NRO_SOLICITUD ASC; 
                   
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
                WHEN OTHERS THEN
                    v_nTOTAL_REGISTROS := 0;
                    v_nTOTAL_PAGINAS := 0;
            END;

            -- ASignando los registros inicial y final de busqueda...
            v_nRegistro_Inicial := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros) - (v_nCantidad_Registros - 1);
            v_nRegistro_Final   := (p_i_vNUMERO_PAGINA * v_nCantidad_Registros);

            OPEN p_o_cResultado FOR
            SELECT X.*
            FROM (
               
             SELECT   VT.*
                     ,NVL(v_nTotal_PaginAS         ,0  ) TOTAL_PAGINAS
                     ,NVL(v_nTotal_Registros       ,0  ) TOTAL_REGISTROS
                     ,NVL(ROW_NUMBER () OVER (ORDER BY TO_NUMBER(VT.NRO_SOLICITUD )),0) AS RN
              FROM  (
                /*
                 SELECT  nvl(F.APE_PATERNO                          ,' ') APE_PATERNO,
                         nvl(F.APE_MATERNO                          ,' ') APE_MATERNO,
                         nvl(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                         nvl(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                         NVL(F.TIP_DOCUM_IDE                        ,0  ) TIP_DOCUM_IDE,
                         NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                         NVL(
                         ( SELECT  P.VAL_CAD_LARGO
                             FROM  PUC_PARAMETROS P
                            WHERE  P.COD_TABLA = 1
                              AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                         NVL( 
                         ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                             FROM  PUC_PARAMETROS PA 
                            WHERE  PA.COD_TABLA = 240 
                              AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                             
                          NVL(DL.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                          NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                          NVL(to_char(DL.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                          NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                          NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                          NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                          NVL(DL.NUM_CUENTA_PMCP                     ,' ') NUM_CUENTA_ORIGEN,
                          NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                          NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                          NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                          NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                          NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                          NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                          NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                          NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                          NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                          NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                          NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                          NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                          NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                          NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                          NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                          NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                          NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                          NVL(
                          ( SELECT  ss.c_desc_sucur 
                              FROM  ESAC.SAC_SUCURSAL   SS  
                             WHERE  SS.N_ID_SUCUR=LP.COD_AGENCIA )  ,' ') C_DESC_SUCUR,
                          NVL(DL.MON_DESEMBOLSO,'')                            MON_DESEMBOLSO,
                          NVL(DL.DES_OBSERVACION,'')                           DES_OBSERVACION                                      
                          
                                FROM   FINAN_LP_CONCIL_DESEM_LOG DL
                          LEFT  JOIN   FINAN_LP_SOLICITUD LP 
                                  ON   DL.NRO_SOLICITUD   =LP.NRO_SOLICITUD
                          
                          LEFT  JOIN   PUC_PERSONAS           F
                                  ON   LP.COD_INTERNO= F.COD_INTERNO
                                  
                          WHERE  DL.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') AND TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                            AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                            
                     UNION ALL
    */
                        SELECT     NVL(F.APE_PATERNO                          ,' ') APE_PATERNO,
                                   NVL(F.APE_MATERNO                          ,' ') APE_MATERNO,
                                   NVL(F.PRI_NOMBRE                           ,' ') PRI_NOMBRE,
                                   NVL(F.SEG_NOMBRE                           ,' ') SEG_NOMBRE,
                                   NVL(F.TIP_DOCUM_IDE                        ,0  ) TIP_DOCUM_IDE,
                                   NVL(F.NUM_DOCUM_IDE                        ,' ') NUM_DOCUM_IDE,
                                   NVL(
                                   ( SELECT  P.VAL_CAD_LARGO
                                       FROM  PUC_PARAMETROS P
                                      WHERE  P.COD_TABLA = 1
                                        AND  P.COD_PARAMETRO = F.TIP_DOCUM_IDE) ,' ') DES_DOC_IDE,
                                   NVL( 
                                   ( SELECT  SUBSTR(NVL(PA.DES_ELEMENTO,' '),0,50) 
                                       FROM  PUC_PARAMETROS PA 
                                      WHERE  PA.COD_TABLA = 240 
                                        AND  PA.Cod_Parametro = LP.Est_Solicitud),' ') DES_ESTADO_SOLICITUD,
                                       
                                    NVL(LP.NRO_SOLICITUD                       ,' ') NRO_SOLICITUD,
                                    NVL(LP.COD_TIPO_DESEMBOLSO                 ,0  ) COD_TIPO_DESEMBOLSO,
                                    NVL(to_char(DLD.FEC_DESEMBOLSO,'DD/MM/YYYY') ,' ') FEC_SOLICITUD,
                                    NVL(LP.NRO_SECUENCIA                       ,0  ) NRO_SECUENCIA,
                                    NVL(LP.COD_INTERNO                         ,' ') COD_INTERNO,
                                    NVL(LP.TIP_PRODUCTO                        ,0  ) TIP_PRODUCTO,
                                    NVL(LP.NUM_CUENTA_ORIGEN                   ,' ') NUM_CUENTA_ORIGEN,
                                    NVL(LP.MON_SOLICITADO                      ,0  ) MON_SOLICITADO,
                                    NVL(LP.COD_TASA_COMPRAS                    ,' ') COD_TASA_COMPRAS,
                                    NVL(LP.COD_TASA_DISP_EFEC                  ,' ') COD_TASA_DISP_EFEC,
                                    NVL(LP.NUM_CUOTA_LP                        ,0  ) NUM_CUOTA_LP ,
                                    NVL(LP.MON_CUOTA_LP                        ,0  ) MON_CUOTA_LP,
                                    NVL(LP.COD_VENDEDOR                        ,0  ) COD_VENDEDOR,
                                    NVL(LP.COD_AGENCIA                         ,0  ) COD_AGENCIA,
                                    NVL(LP.NUM_CUENTA_LP                       ,' ') NUM_CUENTA_LP,
                                    NVL(LP.EST_EJECUCION                       ,' ') EST_EJECUCION,
                                    NVL(to_char(LP.FEC_EJECUCION,'DD/MM/YYYY') ,' ') FEC_EJECUCION,
                                    NVL(LP.EST_SOLICITUD                       ,0  ) EST_SOLICITUD,
                                    NVL(LP.EST_REGISTRO                        ,0  ) EST_REGISTRO,
                                    NVL(to_char(LP.FEC_REGISTRO,'DD/MM/YYYY')  ,''  ) FEC_REGISTRO,
                                    NVL(LP.USU_REGISTRO                        ,' ') USU_REGISTRO,
                                    NVL(to_char(LP.FEC_ACTUALIZACION,'DD/MM/YYYY'),' ') FEC_ACTUALIZACION,
                                    NVL(LP.USU_ACTUALIZACION                   ,' ') USU_ACTUALIZACION,
                                    NVL(LP.NUM_TARJETA_ORIGEN                  ,' ') NUM_TARJETA_ORIGEN,
                                    NVL(
                                    ( SELECT  ss.c_desc_sucur 
                                        FROM  ESAC.SAC_SUCURSAL   SS  
                                       WHERE  SS.N_ID_SUCUR = LP.COD_AGENCIA)  ,' ') C_DESC_SUCUR,
                                    NVL(DLD.MON_DESEMBOLSO,'')                       MON_DESEMBOLSO,
                                    ' '                                              DES_OBSERVACION    
                              FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                       INNER  JOIN   FINAN_LP_SOLICITUD LP 
                                ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                       INNER  JOIN   PUC_PERSONAS           F
                                ON   F.COD_INTERNO      = LP.COD_INTERNO
                                                      
                             WHERE   DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                               AND   TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                               AND   (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                               AND   DLD.EST_DESEMBOLSO != v_Esta_Anulado
                               
                            /*FROM   FINAN_LP_DESEMBOLSO_ENTEFE DLD
                     INNER  JOIN   FINAN_LP_SOLICITUD LP 
                              ON   DLD.NRO_SOLICITUD   = LP.NRO_SOLICITUD
                     INNER  JOIN   PUC_PERSONAS           F
                              ON   F.COD_INTERNO=LP.COD_INTERNO
                            
                      WHERE  DLD.FEC_DESEMBOLSO BETWEEN TO_DATE(p_i_vFEC_INICIO, 'DD/MM/YYYY') 
                        AND  TO_DATE(p_i_vFEC_FINAL, 'DD/MM/YYYY')+1
                        AND  (LP.COD_AGENCIA = p_i_vCOD_AGENCIA OR NVL(p_i_vCOD_AGENCIA,-1) = -1)
                        AND  DLD.EST_EJECUCION='E'*/
                   
                     ) VT
                                   
            ) X
            WHERE X.RN BETWEEN v_nRegistro_Inicial AND v_nRegistro_Final
            ORDER BY X.NRO_SOLICITUD ASC;

        END IF;

  END;
  
  -- FIN - NEW - 15052014...
  
  
    
  -- *****************************************************************************************
    -- Descripcion: Proceso que permitira realizar la simulacion de lAS cuotAS.
    --              Proceso utilizado principalmente en la generacion de cuotAS para Registro de Linea Paralela
    --              ESQUEMA: EPUC@FULXG01D
    --
    -- Input Parameters :  p_i_vCod_Interno                     --> Codigo Interno del cliente PUC_PersonAS
    --                     p_i_vNum_Cuenta                      --> Numero De Cuenta
    --                     p_i_nMonto_Solicitado                --> Monto Solicitado
    --                     p_i_nNum_Cuota                       --> Numero de cuotAS a simular
    --                     p_i_nTASa_DisEfe                     --> TASa utilizada para la simulacion
    --                     p_i_vUsu_Registro                    --> usuario que genera
    -- Output Parameters:  p_o_cResultado                       --> Valora que retornAS lAS cuotAS simuladAS.
    -- Author     : Oswaldo Valdivia Otiniano.
    -- Proyecto   : Plataforma Unica de Clientes (PUC).
    -- Responsable: Miguel Jibaja.
    --
    -- Revisiones
    -- Fecha            Autor         Motivo del cambio      RDC
    -- -----------------------------------------------------------------------------------------
    -- 13/02/2014    O.Valdivia           CREACION           XXX
    -- *****************************************************************************************
    ---
PROCEDURE PRC_CON_MONTO_LP(             p_i_vCod_Interno        IN VARCHAR2 ,
                                           p_i_vNum_Cuenta         IN VARCHAR2 ,
                                           p_i_nMonto_Solicitado   IN NUMBER   ,
                                           p_i_nNum_Cuota          IN NUMBER   ,
                                           p_i_nTASa_DisEfe        IN NUMBER   ,
                                           p_i_vUsu_Registro       IN VARCHAR2 ,
                                           p_i_vFlagseguro         IN NUMBER   ,
                                           p_o_cResultado         OUT c_Valores
                              ) IS
        --
        -- Declaracion de variables de trabajo...
        vContador                               VARCHAR2(2):=0;                 -- Contador...
        p_o_nMonto_Cuota                        NUMBER(10,2) := 0;              -- Monto de la cuota...
        p_o_nMonto_Cuota_Seg                    NUMBER(10,2) := 0;              -- Monto de la cuota...
        vNumMeses                               VARCHAR2(2);                    -- Numero de cuotAS (Meses)...
        v_nNumMeses                             NUMBER;                         -- Numero de cuotAS (Meses)...
        v_nNum_Simulador                        NUMBER := 0;                    -- Numero de simulaciones (Bucle)
        v_nMonto_Solicitado                     NUMBER := 0;                    -- Monto de linea paralela solicitada por el cliente...
        v_nMonto_Seguro                         NUMBER := 0;                    -- Monto Correspondiente del seguro , para un número de cuota especifico (PUC_PARAMETROS COD_TABLA=247)
        v_ncuenta                               NUMBER := 0;                    -- Monto Correspondiente del seguro , para un número de cuota especifico (PUC_PARAMETROS COD_TABLA=247)
   --
   --
   BEGIN
        -- INICIO DEL PROCESO
        --
        -- Inicializando variables de trabajo...
        vNumMeses                 := '';
        v_nNumMeses               := 0;
        v_nNum_Simulador          := 0;
        v_nMonto_Solicitado       := p_i_nMonto_Solicitado;
        v_nMonto_Solicitado       := TO_NUMBER(v_nMonto_Solicitado,'9999999999.99');
        --
        IF ( (p_i_nNum_Cuota IS NOT NULL) AND (p_i_vNum_Cuenta IS NOT NULL) AND (p_i_nTASa_DisEfe IS NOT NULL) AND (v_nMonto_Solicitado IS NOT NULL)) THEN
            -- Eliminando registros de la tabla temporal global...
            DELETE FROM TMP_DET_SIM_CUOTAS_LINPAR;  ---FINAN_TMP_DETALLE_REFINANCIAM;
            -- Inicializando valores...
            vContador:=1;
            --
            -- INICIANDO BUCLE DE SIMULACION DE CUOTAS...
            --
            -- Validar si se efectua la simulacion de lAS cuotAS...
            IF ( v_nMonto_Solicitado > 0 ) THEN
                -- ASignar numero de meses a simular...
                IF ( (p_i_nNum_Cuota IS NULL) OR (p_i_nNum_Cuota = 0) ) THEN

                      v_nNum_Simulador := 4;
                    --v_nNum_Simulador := 5;
                ELSE
                      v_nNum_Simulador := 5;
                    --v_nNum_Simulador := 6;

                END IF;
                --
                -- BUCLE para simular reprogramaciones a 6, 12, y 24 meses...
                FOR  i IN 1 .. v_nNum_Simulador
                LOOP
                    -- Inicializar variables...
                    vNumMeses     := '';
                    --
                    v_nNumMeses   := 0;
                    --
                    -- ASignar valores a variables...
                    -- 12, 18, 24, 30 Y 36
                    CASE
                        WHEN   i = 1   THEN
                               v_nNumMeses := 12;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 2   THEN
                               v_nNumMeses := 18;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 3   THEN
                               v_nNumMeses := 24;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        WHEN   i = 4   THEN
                               v_nNumMeses := 36;
                               vNumMeses   := TO_CHAR(v_nNumMeses);
                        --WHEN   i = 5   THEN
                        --      v_nNumMeses := 36;
                        --       vNumMeses   := TO_CHAR(v_nNumMeses);
                        ELSE
                               v_nNumMeses := p_i_nNum_Cuota;
                               vNumMeses   := TO_CHAR(v_nNumMeses);

                    END CASE;

                    v_nMonto_Solicitado       := p_i_nMonto_Solicitado;
                    v_nMonto_Solicitado       := TO_NUMBER(v_nMonto_Solicitado,'9999999999.99');
                    --

                    -- Obtener el monto a reprograr por cuotAS (24, 30, 36)...

                    PRC_SIMULADOR_CUOTAS_LP (
                                             p_i_vCod_Interno,
                                             v_nNumMeses,
                                             p_i_vNum_Cuenta,
                                             v_nMonto_Solicitado,
                                             p_i_nTASa_DisEfe,
                                             p_i_vUsu_Registro,
                                             p_o_nMonto_Cuota
                                            );

                    -- Evaluamos si se agregara el monto del seguro desgravamen
                    v_nMonto_Seguro     :=0;
                    IF p_i_vFlagseguro = 1 THEN

                       v_nMonto_Seguro     := FINAN_PKG_UTILITARIOS.FINAN_FNC_OBT_VAL_PARAM(247,1,TO_NUMBER(vNumMeses));
                       v_nMonto_Seguro     := TO_NUMBER(v_nMonto_Seguro,'9999999999.99');

                    END IF;

                    -- Obtener el monto a reprograr por cuotAS Para Seguro de Proteccion(24, 30, 36)...

                    PRC_SIMULADOR_CUOTAS_LP (
                                             p_i_vCod_Interno,
                                             v_nNumMeses,
                                             p_i_vNum_Cuenta,
                                             v_nMonto_Seguro,
                                             p_i_nTASa_DisEfe,
                                             p_i_vUsu_Registro,
                                             p_o_nMonto_Cuota_Seg
                                            );
                                         --
                    -- Registrar en tabla de trabajo temporal...
                    INSERT INTO TMP_DET_SIM_CUOTAS_LINPAR  ----TMP_DET_SIM_CUOTAS_LINPAR_F ---
                           (
                            num_cuenta,
                            num_cuota,
                            monto_cuota,
                            MONTO_CUOTA_SEG,
                            usu_registro
                           )
                    VALUES
                          (
                            p_i_vNum_Cuenta,
                            vNumMeses,
                            p_o_nMonto_Cuota,
                            p_o_nMonto_Cuota_Seg,
                            p_i_vUsu_Registro
                          );
                    --
                END LOOP;
                --
            END IF;
            --
            -- Someter los cambios...
            COMMIT;
            --
            -- Presentar la informacion de simulacion de cuotAS de reprogramacion...
            SELECT  COUNT(1)
              INTO  v_ncuenta
              FROM  TMP_DET_SIM_CUOTAS_LINPAR tdr
             WHERE  TDR.NUM_CUENTA       = p_i_vNum_Cuenta
               AND  TDR.USU_REGISTRO     = p_i_vUsu_Registro;

            dbms_output.put_line(to_char(v_ncuenta));

            OPEN p_o_cResultado FOR

                 SELECT  TDR.NUM_CUOTA                           NUMERO_MESES,
                         NVL( SUM(TDR.MONTO_CUOTA), 0)           SLD_REFINANCIAMIENTO,
                         0                                       CUOTA_DEUDA_COMPRAS,
                         NVL( SUM(TDR.MONTO_CUOTA), 0)           CUOTA_DEUDA_DISPEFEC,
                         NVL( SUM(tdr.MONTO_CUOTA_SEG ) , 0)     MON_CUOTA_SEG

                 FROM    TMP_DET_SIM_CUOTAS_LINPAR tdr
                 WHERE   TDR.NUM_CUENTA       = p_i_vNum_Cuenta
                         AND TDR.USU_REGISTRO = p_i_vUsu_Registro
                 GROUP   BY TDR.NUM_CUOTA
                 ORDER   BY NUM_CUOTA, SLD_REFINANCIAMIENTO DESC
                 ;
            --
        ELSE
            -- En cASo de error...
            OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REFINANCIAMIENTO,
                         0               MON_CUOTA_SEG
                 FROM    DUAL;
            --
        END IF;
        ---
        ---
   EXCEPTION


        WHEN No_Data_Found THEN
             --
             dbms_output.put_line(sqlerrm);
             OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REPROGRAMADO,
                         0               MON_CUOTA_SEG
                 FROM    DUAL;
        WHEN OTHERS THEN
             --
             dbms_output.put_line(sqlerrm);
             OPEN p_o_cResultado FOR
                 SELECT  ' '             NUMERO_MESES,
                         0               SLD_REPROGRAMADO,
                         0               MON_CUOTA_SEG
                 FROM    DUAL;
        --

   END PRC_CON_MONTO_LP;


   PROCEDURE PRC_OBT_SEGURO_PROTECCION (
                                        p_i_nCod_Elemento  NUMBER,
                                        p_o_cResultado   OUT c_Valores
                                 )
                                     IS

        -- *****************************************************************************************
        -- Descripcion: PRCOCEDURE que permitira obtener LA VALIDACION DE LOS MONTOS POR SEGURO DE PROTECCION
        --              DE LA TABLA PUC_PARAMETROS con el codigo de tabla y codigo de elemento.
        --              ESQUEMA: EPUC@FULXG01D
        --
        -- Input Parameters :  v_nCod_Tabla            NUMBER       --> Codigo de la tabla (Parametros).
        --                     v_nCod_Elemento         NUMBER       --> Codigo del elemento.
        --
        -- Output Parameters:  v_nCod_Parametro        NUMBER       --> Codigo del parametro.
        -- Author     : Eduardo Zuñiga Gamarra
        -- Proyecto   : IFU.
        -- Responsable: Oswaldo Valdivia Otiniano.
        --
        -- Revisiones
        -- Fecha            Autor         Motivo del cambio      RDC
        -- -----------------------------------------------------------------------------------------
        -- 18/02/2014    E.Zuñiga             CREACION              XXX
        -- *****************************************************************************************
        ---
        ---
        -- Declaracion de variables de trabajo...
        v_nMon_Seguro     number(11,2);
        CERROR           VARCHAR2(200);
        --
        BEGIN
          -- Inicializando la variable a retornar...
          CERROR := 'ESTE NÚMERO DE CUOTA NO TIENE UN VALOR DECIMAL PARA SU SEGURO POR DESEMPLEO';
          v_nMon_Seguro := 0;
          SELECT  pr.val_num_entero
            INTO  v_nMon_Seguro
            FROM  Puc_Parametros pr
           WHERE  pr.Cod_Tabla      = 247
             AND  pr.Cod_Elemento   = p_i_nCod_Elemento;

          --
          OPEN p_o_cResultado FOR SELECT v_nMon_Seguro AS MON_SEGURO FROM DUAL;

      EXCEPTION

      WHEN OTHERS THEN
             ROLLBACK;
             CERROR := LTRIM(RTRIM(SUBSTR(SQLERRM(SQLCODE), 1, 100)));
             OPEN p_o_cResultado FOR SELECT CERROR AS DES_RES_PROC FROM DUAL;
          --
  END PRC_OBT_SEGURO_PROTECCION;



end FINAN_PKG_LIN_PAR_SOLICITUD;
/
