USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[ES_Sp_Cita_Ins]    Script Date: 20/06/2018 0:06:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ES_Sp_Cita_Ins]
@pRUC_Cia VARCHAR(11),
@pDNI_Pac VARCHAR(10),
@pFecha_Cit VARCHAR(24),
@pHora_Cit VARCHAR(24),
@pUsuarioId_Per VARCHAR(25),
@pTipoSolicitudServicioId INT,
@pDuracion_Cit INT,
@pComentario_Cit VARCHAR(350),
@pEstadoCitaId INT,
@pSucursalId VARCHAR(10),
@pDNI_Per VARCHAR(15),
@pMedioPagoId INT,
@pMonedaId VARCHAR(4),
@pTotal NUMERIC(19,5)
AS
BEGIN
	DECLARE @rCitaId BIGINT = 0,
			@rTipoAlertaId INT,
			@rUltimaCita VARCHAR(12),
			@rSiguienteCita VARCHAR(12),
			@rDiaSiguienteCita INT=0,
			@rApePaterno_Pac VARCHAR(80),
			@rHistoria INT=0

	-- Ini E.Z. 20180522
	DECLARE @vFecha_Ale DATE
	-- Ini E.Z. 20180522
	SELECT 
		@rCitaId = MAX(C.CitaId) + 1
	FROM eDenCita C

	IF ISNULL(@rCitaId,0) = 0
		SET @rCitaId = 1

	INSERT INTO eDenCita(CitaId,
						 RUC_Cia,
						 DNI_Pac,
						 Fecha_Cit,
						 Hora_Cit,
						 UsuarioId_Per,
						 TipoSolicitudServicioId,
						 Duracion_Cit,
						 Comentario_Cit,
						 EstadoCitaId,
						 SucursalId,
						 DNI_Per,
						 MedioPagoId,
						 MonedaId,
						 Total)
	VALUES(@rCitaId,
		   @pRUC_Cia,
		   @pDNI_Pac,
		   Convert(datetime,@pFecha_Cit,103),
		   Convert(datetime,@pHora_Cit,103),
		   @pUsuarioId_Per,
		   @pTipoSolicitudServicioId,
		   @pDuracion_Cit,
		   @pComentario_Cit,
		   @pEstadoCitaId,
		   @pSucursalId,
		   @pDNI_Per,
		   @pMedioPagoId,
		   @pMonedaId,
		   @pTotal
	)

	--Valido si el paciente tien H.C.

	IF EXISTS (SELECT 1 FROM eDenPaciente P WHERE P.DNI_Pac = @pDNI_Pac AND ISNULL(HistoriaClinicaId_Pac,'') ='')
	BEGIN
		SELECT
			@rApePaterno_Pac = P.ApePaterno_Pac
		FROM eDenPaciente P
		WHERE P.DNI_Pac = @pDNI_Pac

		IF @rApePaterno_Pac LIKE 'CH%'
		BEGIN
			SELECT 
				@rHistoria = MAX(A.Secuencia)
			FROM (
				SELECT 
					MAX(REPLACE(P.HistoriaClinicaId_Pac,'CH','')) + 1 AS Secuencia
				FROM eDenPaciente P
				WHERE P.HistoriaClinicaId_Pac LIKE 'CH%' AND P.ApePaterno_Pac NOT LIKE '%-%'
				UNION ALL
				SELECT 
					MAX(REPLACE(P.Historia,'CH','')) + 1 AS Secuencia
				FROM eDenPaciente_Temp P
				WHERE P.Historia LIKE 'CH%' AND P.ApePaterno_Pac NOT LIKE '%-%'
			)A

			IF ISNULL(@rHistoria,0)=0 
				SET @rHistoria = 1

			UPDATE eDenPaciente
				SET
					HistoriaClinicaId_Pac = 'CH'+CONVERT(VARCHAR(50),@rHistoria)
			WHERE DNI_Pac = @pDNI_Pac
		END
		ELSE IF @rApePaterno_Pac LIKE 'LL%'
		BEGIN
			SELECT 
				@rHistoria = MAX(A.Secuencia)
			FROM (
				SELECT 
					MAX(REPLACE(P.HistoriaClinicaId_Pac,'LL','')) + 1 AS Secuencia
				FROM eDenPaciente P
				WHERE P.HistoriaClinicaId_Pac LIKE 'LL%' AND P.ApePaterno_Pac NOT LIKE '%-%'
				UNION ALL
				SELECT 
					MAX(REPLACE(P.Historia,'LL','')) + 1 AS Secuencia
				FROM eDenPaciente_Temp P
				WHERE P.Historia LIKE 'LL%' AND P.ApePaterno_Pac NOT LIKE '%-%'
			)A

			IF ISNULL(@rHistoria,0)=0 
				SET @rHistoria = 1

			UPDATE eDenPaciente
				SET
					HistoriaClinicaId_Pac = 'LL'+CONVERT(VARCHAR(50),@rHistoria)
			WHERE DNI_Pac = @pDNI_Pac
		END
		ELSE
		BEGIN
			SET @rApePaterno_Pac = SUBSTRING(@rApePaterno_Pac,1,1)

			SELECT 
				@rHistoria = MAX(A.Secuencia)
			FROM (
				SELECT 
					MAX(REPLACE(P.HistoriaClinicaId_Pac,@rApePaterno_Pac,'')) + 1 AS Secuencia
				FROM eDenPaciente P
				WHERE P.HistoriaClinicaId_Pac LIKE @rApePaterno_Pac+'%' AND P.ApePaterno_Pac NOT LIKE '%-%'
				UNION ALL
				SELECT 
					MAX(REPLACE(P.Historia,@rApePaterno_Pac,'')) + 1 AS Secuencia
				FROM eDenPaciente_Temp P
				WHERE P.Historia LIKE @rApePaterno_Pac+'%' AND P.ApePaterno_Pac NOT LIKE '%-%'
			)A
			
			IF ISNULL(@rHistoria,0)=0 
				SET @rHistoria = 1

			UPDATE eDenPaciente
				SET
					HistoriaClinicaId_Pac = @rApePaterno_Pac+CONVERT(VARCHAR(50),@rHistoria)
			WHERE DNI_Pac = @pDNI_Pac
		END
	END
	--Fin H.C.

	UPDATE eDenPaciente
		SET
			TipoPaciente = 2
	WHERE DNI_Pac = @pDNI_Pac

	-- Ini E.Z. 20180522
	--IF @pEstadoCitaId = 3 AND (@pTipoSolicitudServicioId = 2 OR @pTipoSolicitudServicioId = 3)
	--BEGIN
	--	IF @pTipoSolicitudServicioId = 2
	--	BEGIN
	--		SET @rTipoAlertaId = 1			
	--		SELECT 
	--			@rDiaSiguienteCita = CONVERT(INT,P.Auxiliar1)
	--		FROM eDenParametro P
	--		WHERE P.GrupoId = 1 AND P.Secuencia = 1
	--	END
	--	IF @pTipoSolicitudServicioId = 3
	--	BEGIN
	--		SET @rTipoAlertaId = 2
	--		SELECT 
	--			@rDiaSiguienteCita = CONVERT(INT,P.Auxiliar1)
	--		FROM eDenParametro P
	--		WHERE P.GrupoId = 1 AND P.Secuencia = 2
	--	END

	--	SET @rSiguienteCita = CONVERT(VARCHAR(10),DATEADD(DAY, @rDiaSiguienteCita, Convert(datetime,@pFecha_Cit,103)),102)
	--	SET @rUltimaCita = CONVERT(VARCHAR(10), Convert(datetime,@pFecha_Cit,103), 102)

	--	EXEC Es_Sp_Alerta_Ins @pRUC_Cia, @rTipoAlertaId,@pDNI_Pac, @rCitaId, @rUltimaCita , @rSiguienteCita,'','',@pSucursalId
	--END

	IF @pEstadoCitaId = 1 AND (@pTipoSolicitudServicioId =	1 OR @pTipoSolicitudServicioId = 2 OR @pTipoSolicitudServicioId =3 ) 
	-- Para los Pendientes de confirmacion y con tipo de servicio consulta, tratamiento y orto
	BEGIN
 
		SET @vFecha_Ale		= Convert(DATE,Convert(datetime,@pFecha_Cit,103), 102)
		SET	@rTipoAlertaId	= 3 -- Cita No realizada aun, que necesita confirmacion por eso su alerta
		EXEC Es_Sp_AlertaNotifica_Ins @pRUC_Cia, @pSucursalId, @pTipoSolicitudServicioId,@rTipoAlertaId,@pDNI_Pac, @rCitaId, @vFecha_Ale 
	END

	IF  @pTipoSolicitudServicioId =	1 -- Consulta
	BEGIN
		SET @vFecha_Ale		= CONVERT(DATE,DATEADD(DAY, @rDiaSiguienteCita, Convert(datetime,@pFecha_Cit,103)),102)
		SET	@rTipoAlertaId	= 4 -- Consulta de Citas Inconclusas
		EXEC Es_Sp_AlertaNotifica_Ins @pRUC_Cia, @pSucursalId, @pTipoSolicitudServicioId,@rTipoAlertaId,@pDNI_Pac, @rCitaId, @vFecha_Ale 
	
	END
	IF  @pTipoSolicitudServicioId =	2 AND @pEstadoCitaId = 3  -- Control Tratamiento Realizado
	BEGIN
		SET @vFecha_Ale		= CONVERT(DATE,DATEADD(DAY, @rDiaSiguienteCita, Convert(datetime,@pFecha_Cit,103)),102)
		SET	@rTipoAlertaId	= 1 -- Control Tratamiento
		EXEC Es_Sp_AlertaNotifica_Ins @pRUC_Cia, @pSucursalId, @pTipoSolicitudServicioId,@rTipoAlertaId,@pDNI_Pac, @rCitaId, @vFecha_Ale 
	
	END
	IF  @pTipoSolicitudServicioId =	3 AND @pEstadoCitaId = 3  -- Ortodoncia Realizado
	BEGIN
		SET @vFecha_Ale		= CONVERT(DATE,DATEADD(DAY, @rDiaSiguienteCita, Convert(datetime,@pFecha_Cit,103)),102)
		SET	@rTipoAlertaId	= 2 -- Control Ortodoncia
		EXEC Es_Sp_AlertaNotifica_Ins @pRUC_Cia, @pSucursalId, @pTipoSolicitudServicioId,@rTipoAlertaId,@pDNI_Pac, @rCitaId, @vFecha_Ale 
	
	END
	-- Ini E.Z. 20180522

	SELECT	'Ok'		AS Resultado,
			@rCitaId	AS CitaId
END
GO


