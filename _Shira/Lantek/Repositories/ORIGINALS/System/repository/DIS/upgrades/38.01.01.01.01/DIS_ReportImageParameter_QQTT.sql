IF EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'DIS_SAM_ReportImage' and ParValue='1')
	
	BEGIN
		DECLARE @date DATETIME
		DECLARE @user NVARCHAR(40)
		DECLARE @recEnt NVARCHAR(40)
		DECLARE @recOU NVARCHAR(40)
		DECLARE @recID int

		SET @date = GETDATE()
		SET @user = 'SYSADM'

		SELECT TOP(1) @recEnt = RecEnt, @recOU = RecOU, @recID = RecID FROM SYST_CCPP_00000100 ORDER BY RecID DESC
		SET @recID = @recID + 1

		INSERT INTO SYST_CCPP_00000100 (EType, ParName, ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, RecID) VALUES(-1, 'DIS_CRM_ReportImage', '1', @date, @date, @user, @user, @user, @recEnt, @recOU, @recID)
	END

