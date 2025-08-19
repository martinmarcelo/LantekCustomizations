-- @#LONGSCRIPT#@

DECLARE @RecID int

SET @RecID = IsNull((SELECT TOP(1) RecID FROM SYST_AARR_00000300 ORDER BY RecID DESC), 1)
SET @RecID = @RecID + 1
INSERT INTO SYST_AARR_00000300 (EType,EName,TblRef,FldRef,Subclasses,AtRName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				                   (-1,'','PPMM_PPMM_00000100','PrjRef','Template','Projects','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)		
SET @RecID = @RecID + 1
INSERT INTO SYST_AARR_00000300 (EType,EName,TblRef,FldRef,Subclasses,AtRName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				                   (-1,'','PPMM_PPMM_00000150','WBSRef','WBSTemplate','WBS','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)		
SET @RecID = @RecID + 1
INSERT INTO SYST_AARR_00000300 (EType,EName,TblRef,FldRef,Subclasses,AtRName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecSec,CntID,RecID) VALUES 
				                   (-1,'','PPMM_PPMM_00000200','ActRef','ActivityTemplate','Activities','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','0','0',@RecID)