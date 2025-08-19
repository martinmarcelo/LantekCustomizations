DECLARE @RecID int
SET @RecID = ISNULL((SELECT TOP(1) RecID FROM SYST_AARR_00000100 ORDER BY RecID DESC), 0)

SET @RecID = @RecID + 1
INSERT INTO SYST_AARR_00000100 (AtRName,TblRef,IsMandatory,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				               ('AccidentPreventions','AASS_AASS_00000300',0,'0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)

SET @RecID = IsNull((SELECT TOP(1) RecID FROM SYST_AARR_00000200 ORDER BY RecID DESC), 1)
SET @RecID = @RecID + 1

INSERT INTO SYST_AARR_00000200 (AtRName,TblRef,FOrder,FType,FValue,FIniVal,FEndVal,FZeros,FChars,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				               ('AccidentPreventions','AASS_AASS_00000300',1,1,'ACC','','',1,0,'0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)

SET @RecID = @RecID + 1

INSERT INTO SYST_AARR_00000200 (AtRName,TblRef,FOrder,FType,FValue,FIniVal,FEndVal,FZeros,FChars,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				               ('AccidentPreventions','AASS_AASS_00000300',2,3,'1','000001','999999',0,6,'0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)

SET @RecID = IsNull((SELECT TOP(1) RecID FROM SYST_AARR_00000300 ORDER BY RecID DESC), 1)
SET @RecID = @RecID + 1

INSERT INTO SYST_AARR_00000300 (EType,EName,TblRef,FldRef,Subclasses,AtRName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				               (-1,'','AASS_AASS_00000300','AccRef','','AccidentPreventions','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)