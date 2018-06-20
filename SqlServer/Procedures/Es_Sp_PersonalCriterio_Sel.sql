USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[Es_Sp_PersonalCriterio_Sel]    Script Date: 20/06/2018 0:05:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Es_Sp_PersonalCriterio_Sel]
@pRUC_Cia VARCHAR(11),
@pDNI VARCHAR(15),
@pNombreCompleto_Per VARCHAR(350)
AS
BEGIN
	SET @pDNI = @pDNI + '%'
	SET @pNombreCompleto_Per = @pNombreCompleto_Per + '%'

	SELECT
		 C.DNI_Per
		,C.NombreCompleto_Per
		,C.Especializacion_Per
		,C.Telefono1_Per
	FROM eDenPersonal C
	WHERE C.Activo_Per = 1 AND
	C.RUC_Cia = @pRUC_Cia AND
	C.DNI_Per LIKE @pDNI AND
	C.NombreCompleto_Per LIKE @pNombreCompleto_Per
END



GO


