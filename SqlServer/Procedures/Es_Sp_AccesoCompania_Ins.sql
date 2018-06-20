USE [DB_9FE35F_EsDentalProduccion]
GO

/****** Object:  StoredProcedure [dbo].[Es_Sp_AccesoCompania_Ins]    Script Date: 20/06/2018 0:06:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Es_Sp_AccesoCompania_Ins]
@pDataAccesoXml XML 
AS
BEGIN

	DECLARE		@vAccesoId	INT, 
				@vRUC_Cia	VARCHAR(11),
				@vSucursalId	VARCHAR(10)

	SELECT  TOP 1 
				@vRUC_Cia		= Tab.Col.value('@RUC_Cia', 'VARCHAR(11)') , 
				@vSucursalId	= Tab.Col.value('@SucursalId', 'VARCHAR(10)')  
	fROM		@pDataAccesoXml.nodes('/Root/Accesos') as Tab(Col)

	UPDATE	eDenControlMenuxCompania 
	SET		Est_Registro = 0
	WHERE	RUC_Cia			= @vRUC_Cia
			AND SucursalId	= @vSucursalId 
	
	INSERT INTO eDenControlMenuxCompania
	(	 
		ControlMenuId, 
		RUC_Cia, 
		SucursalId, 
		Est_Registro
	)
	SELECT
	Convert(int,Tab.Col.value('@ControlMenuId', 'VARCHAR(10)')) as ControlMenuId,
	Tab.Col.value('@RUC_Cia', 'VARCHAR(11)') as RUC_Cia, 
	Tab.Col.value('@SucursalId', 'VARCHAR(10)') as SucursalId,
    1
    
	from @pDataAccesoXml.nodes('/Root/Accesos') as Tab(Col)

	SELECT 'Ok' as Mensaje
END
GO


