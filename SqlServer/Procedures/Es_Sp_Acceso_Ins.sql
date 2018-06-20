USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[Es_Sp_Acceso_Ins]    Script Date: 20/06/2018 0:05:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Es_Sp_Acceso_Ins]
@pRolId VARCHAR(10),
@pDataAccesoXml XML 
AS
BEGIN

	DECLARE		@vAccesoId	INT,
				@vUsuarioId	VARCHAR(50),
				@vRolId		VARCHAR(10),
				@vRUC_Cia	VARCHAR(11),
				@vSucursalId	VARCHAR(10)

	SELECT  TOP 1 
				@vRUC_Cia		= Tab.Col.value('@RUC_Cia', 'VARCHAR(50)') ,
				@vRolId			= Tab.Col.value('@RolId', 'VARCHAR(10)')  ,
				@vUsuarioId		= Tab.Col.value('@UsuarioId', 'VARCHAR(50)')  ,
				@vSucursalId	= Tab.Col.value('@SucursalId', 'VARCHAR(10)')  
	fROM		@pDataAccesoXml.nodes('/Root/Accesos') as Tab(Col)

	SET @vAccesoId = (	SELECT	ISNULL(MAX(Convert(INT,SUBSTRING( D.AccesoId,3,9))),1)
						FROM	eDenAcceso D
						)
	DELETE 
	FROM	eDenAcceso 
	WHERE	UsuarioId	= @vUsuarioId
			AND RUC_Cia = @vRUC_Cia
			AND SucursalId = @vSucursalId
			AND RolId	= @vRolId
	
	INSERT INTO eDenAcceso
	(	 
		AccesoId,
		RUC_Cia,
		RolId,
		MenuId,
		UsuarioId,
		SucursalId
	)
	SELECT
	'AC'+Convert(varchar(9),@vAccesoId+1),
    Tab.Col.value('@RUC_Cia', 'VARCHAR(11)') as RUC_Cia,
    Tab.Col.value('@RolId', 'VARCHAR(10)') as RolId,
    Tab.Col.value('@MenuId', 'int') as MenuId,
    Tab.Col.value('@UsuarioId', 'VARCHAR(50)') as UsuarioId,
    Tab.Col.value('@SucursalId', 'VARCHAR(10)') as UsuarioId
	from @pDataAccesoXml.nodes('/Root/Accesos') as Tab(Col)

	SELECT 'Ok' as Mensaje
END


GO


