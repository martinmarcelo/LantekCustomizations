
DECLARE @oUName NVARCHAR(40)
SELECT @oUName = OUName FROM SYST_OORR_00000100 where RecID = 1

DECLARE @date DATETIME
DECLARE @user NVARCHAR(40)
DECLARE @recEnt NVARCHAR(40)
DECLARE @recOU NVARCHAR(40)
DECLARE @recID int

SET @date = GETDATE()
SET @user = 'SYSADM'

SELECT TOP(1) @recEnt = RecEnt, @recOU = RecOU, @recID = RecID FROM SYST_SSRR_00000200 ORDER BY RecID DESC
SET @recID = @recID + 1

INSERT INTO SYST_SSRR_00000200(UsrName, OUName, IsSysUsr, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, CntID, RecID) VALUES('LantekA2N', @oUName, 0, @date, @date, @user, @user, @user, @recEnt, @recOU, 0, @recID)

SET @recID = @recID + 1

INSERT INTO SYST_SSRR_00000200(UsrName, OUName, IsSysUsr, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, CntID, RecID) VALUES('LantekBend', @oUName, 0, @date, @date, @user, @user, @user, @recEnt, @recOU, 0, @recID)
