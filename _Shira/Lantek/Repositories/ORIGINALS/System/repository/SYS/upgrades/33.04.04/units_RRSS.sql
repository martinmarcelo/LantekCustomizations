DECLARE @RecID int
SET @RecID = ISNULL((SELECT TOP(1) RecID FROM SYST_UUMM_00000800 ORDER BY RecID DESC), 0)
		
SET @RecID = @RecID + 1
INSERT INTO SYST_UUMM_00000800 (TblRef,FldRef,USyName,UCtName,UntName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecEnt,RecOU,RecSec,CntID,RecID) VALUES 
				('RRSS_RRSS_00000100','Cost','MET','TIM','h','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','ment','ment','1','0',@RecID)			

SET @RecID = @RecID + 1
INSERT INTO SYST_UUMM_00000800 (TblRef,FldRef,USyName,UCtName,UntName,RecState,CrtDate,LastDate,CrtUser,LastUser,Owner,RecEnt,RecOU,RecSec,CntID,RecID) VALUES 
				('RRSS_PPFF_00000100','Cost','MET','TIM','h','0','01/01/1900','01/01/1900','SYSADM','SYSADM','SYSADM','ment','ment','1','0',@RecID)	
		
