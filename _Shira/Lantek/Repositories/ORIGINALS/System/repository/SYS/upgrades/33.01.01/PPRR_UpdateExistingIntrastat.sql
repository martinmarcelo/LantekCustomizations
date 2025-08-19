-- @#LONGSCRIPT#@

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'PPRR_PPRR_00000100' AND COLUMN_NAME = 'DEL_CommCode')
BEGIN
	exec sp_executesql N'UPDATE PPRR_PPRR_00000100 SET CommCode = DEL_CommCode'
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'PPRR_PPRR_00000100' AND COLUMN_NAME = 'DEL_OCountry')
BEGIN
	exec sp_executesql N'UPDATE PPRR_PPRR_00000100 SET OCountry = DEL_OCountry'
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DEL_PPRR_PPRR_00001200')
BEGIN
	DECLARE 
	@Code nvarchar(80),
	@Descrip nvarchar(255),
	@RecState smallint,
	@CrtDate datetime,
	@LastDate datetime,
	@CrtUser varchar(40),
	@LastUser varchar(40),
	@Owner varchar(40),
	@RecEnt varchar(40),
	@RecOU varchar(40),
	@RecSec int,
	@CntID int,
	@RecID int

	DECLARE CurCommodityCodes CURSOR FOR 
	SELECT Code,Descrip,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecEnt,RecOU,RecSec,CntID FROM DEL_PPRR_PPRR_00001200
	OPEN CurCommodityCodes
	FETCH NEXT FROM CurCommodityCodes INTO @Code,@Descrip,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @RecID = ISNULL((SELECT MAX(RecID) FROM PPRR_PPRR_00001200),0) + 1
		INSERT INTO PPRR_PPRR_00001200 (Code,Descrip,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecEnt,RecOU,RecSec,CntID,RecID)
		VALUES (@Code,@Descrip,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
		FETCH NEXT FROM CurCommodityCodes INTO @Code,@Descrip,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	END
	CLOSE CurCommodityCodes 
	DEALLOCATE CurCommodityCodes
END
