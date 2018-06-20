USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[Es_Sp_UsuarioCriterio_Sel]    Script Date: 20/06/2018 0:04:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Es_Sp_UsuarioCriterio_Sel]
@pRUC_Cia VARCHAR(11),
@pUsuarioId VARCHAR(25),
@pNombre_Usu VARCHAR(100)
AS
BEGIN
	SET @pUsuarioId = @pUsuarioId +'%'
	SET @pNombre_Usu = @pNombre_Usu +'%'
	
	SELECT 
			 U.UsuarioId
			,U.DNI_Per
			,P.NombreCompleto_Per AS NombrePersonal
	FROM	eDenUsuario U
	JOIN eDenPersonal P ON U.DNI_Per = P.DNI_Per AND U.RUC_Cia = P.RUC_Cia
	WHERE   U.RUC_Cia = @pRUC_Cia
	AND U.UsuarioId LIKE @pUsuarioId
	AND P.NombreCompleto_Per LIKE @pNombre_Usu			 
END


GO


