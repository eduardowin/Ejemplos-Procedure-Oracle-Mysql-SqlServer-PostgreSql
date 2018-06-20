USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[Es_Sp_PacientexCriterio_Sel]    Script Date: 20/06/2018 0:05:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Es_Sp_PacientexCriterio_Sel]
@pDataCabeceraXml XML 
AS
BEGIN
	DECLARE		@vNombre_Pac	VARCHAR(100),
				@vDNI_Pac		VARCHAR(10),
				@vRUC_Cia       VARCHAR(11)

	SELECT  TOP 1 
				@vRUC_Cia		= Tab.Col.value('@RUC_Cia', 'VARCHAR(11)') ,
				@vDNI_Pac		= Tab.Col.value('@Criterio_Dni', 'VARCHAR(10)') ,
				@vNombre_Pac	= Tab.Col.value('@Criterio_Nombre', 'VARCHAR(100)')   
	FROM		@pDataCabeceraXml.nodes('/Root/DataCabeceraXml') as Tab(Col)

	SELECT TOP 100
		 P.PacienteId
		,P.TipoPaciente
		,P.DNI_Pac
		,P.ApePaterno_Pac
		,P.ApeMaterno_Pac
		,P.NombreCompleto_Pac
		,P.Direccion_Pac
		,P.CorreoElectronico_Pac
		,P.Telefono1_Pac
		,P.Sexo_Pac
		,P.Activo_Pac
		,P.Des_Activo_Pac
		,P.Completo_Pac
		,P.HistoriaClinicaId_Pac
	FROM (
		SELECT	
					0 AS PacienteId,
					TipoPaciente, 
					DNI_Pac, 
					ApePaterno_Pac, 
					ApeMaterno_Pac, 
					NombreCompleto_Pac, 
					Direccion_Pac, 
					CorreoElectronico_Pac,  
					Telefono1_Pac, 
					Convert(INT,Sexo_Pac) AS Sexo_Pac, 
					Convert(INT,Activo_Pac) AS Activo_Pac,
					CASE 
						WHEN Activo_Pac = 1
							THEN 'Activo'
						else 'Inactivo'
					END AS Des_Activo_Pac,
					PA.ApePaterno_Pac + ' ' + PA.ApeMaterno_Pac + ' ,'+ PA.NombreCompleto_Pac  AS Completo_Pac,
					HistoriaClinicaId_Pac
		FROM		eDenPaciente PA
		JOIN		eDenTipoPaciente TP
					ON TP.TipoPacienteId = PA.TipoPaciente
		WHERE		PA.DNI_Pac LIKE '%' + @vDNI_Pac + '%' AND
					(PA.ApePaterno_Pac + ' ' + PA.ApeMaterno_Pac + ' '+ PA.NombreCompleto_Pac LIKE '%'+@vNombre_Pac+'%' OR ISNULL(@vNombre_Pac,'')= '') AND
					 PA.RUC_Cia = @vRUC_Cia
		UNION ALL
		SELECT		
					PA.PacienteId,
					1 AS TipoPaciente, 
					'' AS DNI_Pac, 
					ApePaterno_Pac, 
					ApeMaterno_Pac, 
					NombreCompleto_Pac, 
					Direccion_Pac, 
					'' AS CorreoElectronico_Pac,  
					Telefono1_Pac, 
					Convert(INT,Sexo_Pac) AS Sexo_Pac, 
					1 Activo_Pac,
					'Activo' AS Des_Activo_Pac,
					PA.ApePaterno_Pac + ' ' + PA.ApeMaterno_Pac + ' ,'+ PA.NombreCompleto_Pac  AS Completo_Pac,
					'' AS HistoriaClinicaId_Pac
		FROM		eDenPaciente_Temp PA
		WHERE		(PA.ApePaterno_Pac + ' ' + PA.ApeMaterno_Pac + ' ,'+ PA.NombreCompleto_Pac LIKE '%'+@vNombre_Pac+'%' OR ISNULL(@vNombre_Pac,'')= '')
	)P
END





GO


