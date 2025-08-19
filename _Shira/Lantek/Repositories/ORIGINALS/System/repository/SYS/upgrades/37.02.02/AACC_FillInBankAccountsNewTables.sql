
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

--AACC_AACC_00000400--

SET @RecID=1

DECLARE CurInvoicingAuxiliaryData CURSOR FOR SELECT CusRef,BnkDsc,BnkAcc,SwCode,Iban,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID FROM SSAA_CCUU_00000100 WHERE BnkDsc != ''
OPEN CurInvoicingAuxiliaryData
FETCH NEXT FROM CurInvoicingAuxiliaryData INTO @CusRef,@Bank,@AccNumber,@SwiftCode,@Iban,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @IsCust=IsCust,@IsSupp=IsSupp,@CompanyCurName=CurName FROM CCOO_CCOO_00000100 WHERE ComRef=@CusRef
    IF (@IsCust=1)
	BEGIN
		SET @SameBankAccount = 0
		IF (@CompanyCurName = '') SET @CompanyCurName='EUR'
		IF (@IsSupp=1)
		BEGIN
			SELECT @SuppBank=BnkDsc,@SuppAccNumber=BnkAcc, @SuppSwiftCode=SwCode, @SuppIban=Iban FROM SSHH_SSPP_00000100 WHERE SuppRef=@CusRef
			IF ((@SuppBank = @Bank) AND (@SuppAccNumber = @AccNumber)) SET @SameBankAccount = 1
			IF ((@SuppBank != '') AND (@SameBankAccount = 0))
			BEGIN
				SET @BankAccountReference = @SuppBank
				IF (@SuppBank = @Bank) SET @BankAccountReference = @SuppBank + ', ' + @SuppAccNumber
				INSERT INTO AACC_AACC_00000400 (Reference,ComRef,Bank,AccountNumber,SwiftCode,Iban,CurName,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
								VALUES (@BankAccountReference,@CusRef,@SuppBank,@SuppAccNumber,@SuppSwiftCode,@SuppIban,@CompanyCurName,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
		        SET @RecID=@RecID+1
			END
		END
        INSERT INTO AACC_AACC_00000400 (Reference,ComRef,Bank,AccountNumber,SwiftCode,Iban,CurName,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
		                        VALUES (@Bank,@CusRef,@Bank,@AccNumber,@SwiftCode,@Iban,@CompanyCurName,'1',@SameBankAccount,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
		SET @RecID=@RecID+1
	END
	FETCH NEXT FROM CurInvoicingAuxiliaryData INTO @CusRef,@Bank,@AccNumber,@SwiftCode,@Iban,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
END
CLOSE CurInvoicingAuxiliaryData
DEALLOCATE CurInvoicingAuxiliaryData

DECLARE CurSupplierAuxiliarData CURSOR FOR SELECT SuppRef,BnkDsc,BnkAcc,SwCode,Iban,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID FROM SSHH_SSPP_00000100 WHERE BnkDsc != ''
OPEN CurSupplierAuxiliarData
FETCH NEXT FROM CurSupplierAuxiliarData INTO @SuppRef,@Bank,@AccNumber,@SwiftCode,@Iban,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @IsCust=IsCust,@IsSupp=IsSupp,@CompanyCurName=CurName FROM CCOO_CCOO_00000100 WHERE ComRef=@SuppRef
    IF ((@IsSupp=1) AND (@IsCust=0))
	BEGIN
		IF (@CompanyCurName = '') SET @CompanyCurName='EUR'
        INSERT INTO AACC_AACC_00000400 (Reference,ComRef,Bank,AccountNumber,SwiftCode,Iban,CurName,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
		                        VALUES (@Bank,@SuppRef,@Bank,@AccNumber,@SwiftCode,@Iban,@CompanyCurName,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
		SET @RecID=@RecID+1
	END
	FETCH NEXT FROM CurSupplierAuxiliarData INTO @SuppRef,@Bank,@AccNumber,@SwiftCode,@Iban,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
END
CLOSE CurSupplierAuxiliarData
DEALLOCATE CurSupplierAuxiliarData


--AACC_AACC_00000300--

SET @RecID=1
SET @AATTIsLoaded=0

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AATT_AATT_00000550')
BEGIN
	SELECT @CountRegisters=COUNT(*) FROM AATT_AATT_00000550
	IF (@CountRegisters>0) SET @AATTIsLoaded=1
END

IF (@AATTIsLoaded=0)
BEGIN
	DECLARE CurBankingInvoicingAuxiliaryData CURSOR FOR SELECT CusRef,BankingRef,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID FROM SSAA_CCUU_00000100 WHERE BankingRef != ''
	OPEN CurBankingInvoicingAuxiliaryData
	FETCH NEXT FROM CurBankingInvoicingAuxiliaryData INTO @CusRef,@BankingRef,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @IsCust=IsCust,@IsSupp=IsSupp,@CompanyRecID=RecID FROM CCOO_CCOO_00000100 WHERE ComRef=@CusRef
		IF (@IsCust=1)
		BEGIN
			SET @SameBankAccount = 0
			IF (@IsSupp=1)
			BEGIN
				SELECT @SuppBankingRef=BankingRef FROM SSHH_SSPP_00000100 WHERE SuppRef=@CusRef
				IF (@SuppBankingRef = @BankingRef) SET @SameBankAccount = 1
				IF ((@SuppBankingRef != '') AND (@SameBankAccount = 0))
				BEGIN
					INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
									VALUES (@SuppBankingRef,@CusRef,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
					SET @RecID=@RecID+1
				END
			END
			INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
					VALUES (@BankingRef,@CusRef,'1',@SameBankAccount,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)
			SET @RecID=@RecID+1
		END
		FETCH NEXT FROM CurBankingInvoicingAuxiliaryData INTO @CusRef,@BankingRef,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	END
	CLOSE CurBankingInvoicingAuxiliaryData
	DEALLOCATE CurBankingInvoicingAuxiliaryData

	DECLARE CurBankingSupplierAuxiliarData CURSOR FOR SELECT SuppRef,BankingRef,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID FROM SSHH_SSPP_00000100 WHERE BankingRef != ''
	OPEN CurBankingSupplierAuxiliarData
	FETCH NEXT FROM CurBankingSupplierAuxiliarData INTO @SuppRef,@BankingRef,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @IsCust=IsCust,@IsSupp=IsSupp,@CompanyRecID=RecID FROM CCOO_CCOO_00000100 WHERE ComRef=@SuppRef
		IF ((@IsSupp=1) AND (@IsCust=0))
		BEGIN
			INSERT INTO AACC_AACC_00000300 (BankingRef,ComRef,DefaultReceivables,DefaultPayables,RecState,CrtDate,LastDate,CrtUser,LastUser,[Owner],RecEnt,RecOU,RecSec,CntID,RecID)
					VALUES (@BankingRef,@SuppRef,'0','1',@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID,@RecID)

			SET @RecID=@RecID+1
		END
		FETCH NEXT FROM CurBankingSupplierAuxiliarData INTO @SuppRef,@BankingRef,@RecState,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecSec,@CntID
	END
	CLOSE CurBankingSupplierAuxiliarData
	DEALLOCATE CurBankingSupplierAuxiliarData
END