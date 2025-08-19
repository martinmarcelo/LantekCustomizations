-- @#LONGSCRIPT#@

-- Create new zones from companies.

DECLARE @Zone as varchar(80), @RecIDAux bigint
DECLARE CurCompanies CURSOR FOR SELECT DISTINCT Zone FROM CCOO_CCOO_00000100 WHERE Zone <> '' AND Zone NOT IN(SELECT Name FROM AADD_AADD_00000200)
SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM AADD_AADD_00000200),0)
OPEN CurCompanies
FETCH NEXT FROM CurCompanies INTO @Zone
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @RecIDAux = @RecIDAux + 1
	INSERT INTO AADD_AADD_00000200 (Name, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, RecSec, CntID, RecID) 
	VALUES (@Zone, '0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','ment','ment','1','0',@RecIDAux)
    FETCH NEXT FROM CurCompanies INTO @Zone
END
CLOSE CurCompanies