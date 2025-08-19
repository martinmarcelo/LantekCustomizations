
DECLARE @CusRef nvarchar(40)
DECLARE @SuppRef nvarchar(40)
DECLARE @ComRef nvarchar(40)
DECLARE @Bank nvarchar(255)
DECLARE @AccNumber nvarchar(255)
DECLARE @SwiftCode nvarchar(255)
DECLARE @Iban nvarchar(255)
DECLARE @SuppBank nvarchar(255)
DECLARE @SuppAccNumber nvarchar(255)
DECLARE @SuppSwiftCode nvarchar(255)
DECLARE @SuppIban nvarchar(255)
DECLARE @RecID int
DECLARE @RecState smallint
DECLARE @CrtDate datetime
DECLARE @LastDate datetime
DECLARE @CrtUser nvarchar(40)
DECLARE @LastUser nvarchar(40)
DECLARE @Owner nvarchar(40)
DECLARE @RecEnt nvarchar(40)
DECLARE @RecOU nvarchar(40)
DECLARE @RecSec int
DECLARE @CntID int
DECLARE @IsCust tinyint
DECLARE @IsSupp tinyint
DECLARE @SameBankAccount tinyint
DECLARE @CompanyCurName nvarchar(80)
DECLARE @BankAccountReference nvarchar(255)
DECLARE @OUName nvarchar(40)
DECLARE @AccPrdRef nvarchar(40)
DECLARE @AccChartRef nvarchar(40)
DECLARE @AccCatRef nvarchar(40)
DECLARE @AccountRef nvarchar(40)
DECLARE @SuppOUName nvarchar(40)
DECLARE @SuppAccPrdRef nvarchar(40)
DECLARE @SuppAccChartRef nvarchar(40)
DECLARE @SuppAccCatRef nvarchar(40)
DECLARE @SuppAccountRef nvarchar(40)
DECLARE @CompanyRecID int
DECLARE @BankAccountRecID int
DECLARE @BankingRef nvarchar(255)
DECLARE @SuppBankAccountRecID int
DECLARE @SuppBankingRef nvarchar(255)
DECLARE @CountRegisters int
DECLARE @AATTIsLoaded tinyint
DECLARE @DefaultReceivable tinyint
DECLARE @DefaultPayable tinyint
DECLARE @Type int

--AACC_AACC_00000300--

SET @RecID=1
SET @AATTIsLoaded=0

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AATT_AATT_00000550')
BEGIN
	SELECT @CountRegisters=COUNT(*) FROM AATT_AATT_00000550
	IF (@CountRegisters>0)
	BEGIN
		SET @AATTIsLoaded=1
		DECLARE CurAssociatedAccounts CURSOR FOR SELECT AATT_AATT_00000550.OUName,AATT_AATT_00000550.AccPrdRef,AATT_AATT_00000550.AccChartRef,AATT_AATT_00000550.AccCatRef,AATT_AATT_00000550.AccountRef,AATT_AATT_00000550.RecordID,AATT_AATT_00000550.RecState,AATT_AATT_00000550.CrtDate,AATT_AATT_00000550.LastDate,AATT_AATT_00000550.CrtUser,AATT_AATT_00000550.LastUser,AATT_AATT_00000550.[Owner],AATT_AATT_00000550.RecEnt,AATT_AATT_00000550.RecOU,AATT_AATT_00000550.RecSec,AATT_AATT_00000550.CntID 
												 FROM AATT_AATT_00000550 INNER JOIN AATT_AATT_00000100
												 ON AATT_AATT_00000550.OUName = AATT_AATT_00000100.OUName
												 AND AATT_AATT_00000550.AccPrdRef = AATT_AATT_00000100.AccPrdRef
												 WHERE AATT_AATT_00000100.Closed=0
												 AND AATT_AATT_00000550.TblRef='CCOO_CCOO_00000100'
												 AND AATT_AATT_00000550.Type=13
		OPEN CurAssociatedAccounts
		FETCH NEXT FROM CurAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@CompanyRecID,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		WHILE @@FETCH_STATUS = 0
		BEGIN	
			SELECT @ComRef=ComRef,@IsCust=IsCust,@IsSupp=IsSupp FROM CCOO_CCOO_00000100 WHERE RecID=@CompanyRecID
			IF (@IsCust=1)
			BEGIN
				SET @SameBankAccount = 0
				SELECT @BankAccountRecID=RecordID FROM AATT_AATT_00000550 WHERE TblRef='AACC_AACC_00000100' AND OUName=@OUName AND AccPrdRef=@AccPrdRef AND AccChartRef=@AccChartRef AND AccCatRef=@AccCatRef AND AccountRef=@AccountRef
				IF (@BankAccountRecID > 0)
				BEGIN
					SELECT @BankingRef=BankingRef FROM AACC_AACC_00000100 WHERE RecID=@BankAccountRecID
					IF (@BankingRef != '')
					BEGIN		
						IF (@IsSupp=1)
						BEGIN
							SET @SameBankAccount = 0
							SELECT  @SuppOUName=AATT_AATT_00000550.OUName,@SuppAccPrdRef=AATT_AATT_00000550.AccPrdRef,@SuppAccChartRef=AATT_AATT_00000550.AccChartRef,@SuppAccCatRef=AATT_AATT_00000550.AccCatRef,@SuppAccountRef=AATT_AATT_00000550.AccountRef 
									FROM AATT_AATT_00000550 INNER JOIN AATT_AATT_00000100
									ON AATT_AATT_00000550.OUName = AATT_AATT_00000100.OUName
									AND AATT_AATT_00000550.AccPrdRef = AATT_AATT_00000100.AccPrdRef
									WHERE AATT_AATT_00000100.Closed=0
									AND AATT_AATT_00000550.TblRef='CCOO_CCOO_00000100'
									AND AATT_AATT_00000550.RecordID=@CompanyRecID
									AND AATT_AATT_00000550.Type=14
							IF ((@SuppOUName = @OUName) AND (@SuppAccPrdRef = @AccPrdRef) AND (@SuppAccChartRef = @AccChartRef) AND (@SuppAccCatRef = @AccCatRef) AND (@SuppAccountRef = @AccountRef)) SET @SameBankAccount = 1
							IF ((@SuppOUName != '') AND (@SuppAccPrdRef != '') AND (@SuppAccChartRef != '') AND (@SuppAccCatRef != '') AND (@SuppAccountRef != '') AND (@SameBankAccount = 0))
							BEGIN
								SELECT @SuppBankAccountRecID=RecordID FROM AATT_AATT_00000550 WHERE TblRef='AACC_AACC_00000100' AND OUName=@SuppOUName AND AccPrdRef=@SuppAccPrdRef AND AccChartRef=@SuppAccChartRef AND AccCatRef=@SuppAccCatRef AND AccountRef=@SuppAccountRef
								IF (@SuppBankAccountRecID > 0)
								BEGIN
									SELECT @SuppBankingRef=BankingRef FROM AACC_AACC_00000100 WHERE RecID=@SuppBankAccountRecID
									INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
															VALUES (@SuppBankingRef,@ComRef,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
									SET @RecID=@RecID+1
								END
							END
						END
						INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
									VALUES (@BankingRef,@ComRef,'1',@SameBankAccount,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
						SET @RecID=@RecID+1
					END
				END
			END
			FETCH NEXT FROM CurAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@CompanyRecID,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		END
		CLOSE CurAssociatedAccounts
		DEALLOCATE CurAssociatedAccounts

		DECLARE CurSuppAssociatedAccounts CURSOR FOR SELECT AATT_AATT_00000550.OUName,AATT_AATT_00000550.AccPrdRef,AATT_AATT_00000550.AccChartRef,AATT_AATT_00000550.AccCatRef,AATT_AATT_00000550.AccountRef,AATT_AATT_00000550.RecordID,AATT_AATT_00000550.RecState,AATT_AATT_00000550.CrtDate,AATT_AATT_00000550.LastDate,AATT_AATT_00000550.CrtUser,AATT_AATT_00000550.LastUser,AATT_AATT_00000550.[Owner],AATT_AATT_00000550.RecEnt,AATT_AATT_00000550.RecOU,AATT_AATT_00000550.RecSec,AATT_AATT_00000550.CntID 
												 FROM AATT_AATT_00000550 INNER JOIN AATT_AATT_00000100
												 ON AATT_AATT_00000550.OUName = AATT_AATT_00000100.OUName
												 AND AATT_AATT_00000550.AccPrdRef = AATT_AATT_00000100.AccPrdRef
												 WHERE AATT_AATT_00000100.Closed=0
												 AND AATT_AATT_00000550.TblRef='CCOO_CCOO_00000100'
												 AND AATT_AATT_00000550.Type=14
		OPEN CurSuppAssociatedAccounts
		FETCH NEXT FROM CurSuppAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@CompanyRecID,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		WHILE @@FETCH_STATUS = 0
		BEGIN	
			SELECT @ComRef=ComRef,@IsCust=IsCust,@IsSupp=IsSupp FROM CCOO_CCOO_00000100 WHERE RecID=@CompanyRecID
			IF ((@IsCust=0) AND (@IsSupp=1))
			BEGIN
				SELECT @BankAccountRecID=RecordID FROM AATT_AATT_00000550 WHERE TblRef='AACC_AACC_00000100' AND OUName=@OUName AND AccPrdRef=@AccPrdRef AND AccChartRef=@AccChartRef AND AccCatRef=@AccCatRef AND AccountRef=@AccountRef
				IF (@BankAccountRecID > 0)
				BEGIN
					SELECT @BankingRef=BankingRef FROM AACC_AACC_00000100 WHERE RecID=@BankAccountRecID
					IF (@BankingRef != '')
					BEGIN		
						INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
									VALUES (@BankingRef,@ComRef,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
						SET @RecID=@RecID+1
					END
				END
			END
			FETCH NEXT FROM CurSuppAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@CompanyRecID,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		END
		CLOSE CurSuppAssociatedAccounts
		DEALLOCATE CurSuppAssociatedAccounts

		DECLARE CurGeneralCustomerBankAssociatedAccounts CURSOR FOR SELECT AATT_AATT_00000550.OUName,AATT_AATT_00000550.AccPrdRef,AATT_AATT_00000550.AccChartRef,AATT_AATT_00000550.AccCatRef,AATT_AATT_00000550.AccountRef,AATT_AATT_00000550.[Type],AATT_AATT_00000550.RecState,AATT_AATT_00000550.CrtDate,AATT_AATT_00000550.LastDate,AATT_AATT_00000550.CrtUser,AATT_AATT_00000550.LastUser,AATT_AATT_00000550.[Owner],AATT_AATT_00000550.RecEnt,AATT_AATT_00000550.RecOU,AATT_AATT_00000550.RecSec,AATT_AATT_00000550.CntID 
												 FROM AATT_AATT_00000550 INNER JOIN AATT_AATT_00000100
												 ON AATT_AATT_00000550.OUName = AATT_AATT_00000100.OUName
												 AND AATT_AATT_00000550.AccPrdRef = AATT_AATT_00000100.AccPrdRef
												 WHERE AATT_AATT_00000100.Closed=0
												 AND AATT_AATT_00000550.TblRef=''
												 AND AATT_AATT_00000550.Type IN (13,14)
		OPEN CurGeneralCustomerBankAssociatedAccounts
		FETCH NEXT FROM CurGeneralCustomerBankAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@Type,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		WHILE @@FETCH_STATUS = 0
		BEGIN	
			SELECT @BankAccountRecID=RecordID FROM AATT_AATT_00000550 WHERE TblRef='AACC_AACC_00000100' AND OUName=@OUName AND AccPrdRef=@AccPrdRef AND AccChartRef=@AccChartRef AND AccCatRef=@AccCatRef AND AccountRef=@AccountRef
			IF (@BankAccountRecID > 0)
			BEGIN
				SELECT @BankingRef=BankingRef FROM AACC_AACC_00000100 WHERE RecID=@BankAccountRecID
				IF (@BankingRef != '')
				BEGIN
				    SET @DefaultReceivable = 0
					SET @DefaultPayable = 0
					IF (@Type=13) SET @DefaultReceivable = 1
					IF (@Type=14) SET @DefaultPayable = 1 		
					INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
								VALUES (@BankingRef,'',@DefaultReceivable,@DefaultPayable,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
					SET @RecID=@RecID+1
				END
			END
			FETCH NEXT FROM CurGeneralCustomerBankAssociatedAccounts INTO @OUName,@AccPrdRef,@AccChartRef,@AccCatRef,@AccountRef,@Type,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
		END
		CLOSE CurGeneralCustomerBankAssociatedAccounts
		DEALLOCATE CurGeneralCustomerBankAssociatedAccounts
	END
END