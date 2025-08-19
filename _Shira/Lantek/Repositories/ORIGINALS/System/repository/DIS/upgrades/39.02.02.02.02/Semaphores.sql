DECLARE @date DATETIME, @user NVARCHAR(40), @recEnt NVARCHAR(40), @recOU NVARCHAR(40), @recID int
SET @date = GETDATE()
SET @user = 'SYSADM'
SELECT TOP(1) @recEnt = RecEnt, @recOU = RecOU FROM SYST_CCPP_00000100 ORDER BY RecID ASC
SELECT TOP(1) @recID = RecID FROM SYST_CCPP_00000100 ORDER BY RecID DESC
SET @recID = @recID + 1

IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_ValidationProcess') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                       ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_ValidationProcess', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_ChangeNestingStatus') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                         ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_ChangeNestingStatus', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_PPRR_PPRR_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_PPRR_PPRR_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_PPRR_PPRR_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_PPRR_PPRR_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_OOPP_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_OOPP_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_OOPP_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_OOPP_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_PPOO_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_PPOO_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_PPOO_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_PPOO_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_PPOO_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_PPOO_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_MMNN_MMOO_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_MMNN_MMOO_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_MMOO_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_MMOO_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_MMOO_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_MMOO_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_MMNN_MMOO_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_MMNN_MMOO_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_WWCC_WWCC_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_WWCC_WWCC_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_CCTT_TTLL_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_CCTT_TTLL_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_CCTT_TTLL_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_CCTT_TTLL_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTLL_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTLL_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTLL_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTLL_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTLL_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTLL_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTLL_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTLL_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000500') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000500', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000700') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000700', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000800') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000800', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_TTRR_00000900') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_TTRR_00000900', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000500') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000500', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000700') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000700', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000800') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000800', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00000900') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00000900', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00001000') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00001000', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00001100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00001100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPTT_WWCC_00001200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPTT_WWCC_00001200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_MMTT_MMTT_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_MMTT_MMTT_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_MMTT_MMTT_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_MMTT_MMTT_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_GGEE_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_GGEE_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_GGEE_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_GGEE_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_GGEE_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_GGEE_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_GGEE_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_GGEE_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000500') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000500', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000700') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000700', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000800') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000800', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00000900') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00000900', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_FFEE_00001000') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_FFEE_00001000', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000500') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000500', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000700') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000700', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000800') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000800', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00000900') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00000900', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00001000') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00001000', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00001100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00001100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00001200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00001200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00001300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00001300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_DUCT_CFGS_00001400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_DUCT_CFGS_00001400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000400') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000400', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000500') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000500', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_NEST_NEST_00000600') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_NEST_NEST_00000600', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_MMPP_MMPP_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_MMPP_MMPP_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_PPFF_PPFF_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_PPFF_PPFF_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_SHPR_PPTT_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_SHPR_PPTT_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_SHPR_PPMM_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_SHPR_PPMM_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_DIS_SHPR_MMMM_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_DIS_SHPR_MMMM_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_GLS_IITT_IIVV_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                                   ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_GLS_IITT_IIVV_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_SYST_AARR_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_SYST_AARR_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_SYST_AARR_00000200') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_SYST_AARR_00000200', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_SYST_AARR_00000300') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_SYST_AARR_00000300', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END
IF NOT EXISTS(SELECT * FROM SYST_CCPP_00000100 where ParName = 'Semaphore_Insert_SYST_OWND_00000100') BEGIN
	INSERT INTO SYST_CCPP_00000100 (EType, ParName,                               ParValue, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt,  RecOU,  RecID)
							 VALUES(-1   , 'Semaphore_Insert_SYST_OWND_00000100', '',       @date,   @date,    @user,   @user,    @user, @recEnt, @recOU, @recID)
	SET @recID = @recID + 1
END