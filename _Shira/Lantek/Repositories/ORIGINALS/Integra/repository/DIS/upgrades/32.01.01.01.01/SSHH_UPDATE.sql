-- @#LONGSCRIPT#@
DECLARE @RecID as int
DECLARE @Quantity as float
DECLARE @Weight as float
DECLARE @FactorConversion as float
DECLARE @PurchaseUnit as varchar(80)
DECLARE @ItemUnit as varchar(80)
DECLARE @ItemCategory as varchar(80)

-- SSHH_PPOO_00000200
UPDATE SSHH_PPOO_00000200
SET 
    DIS_WGHUntName = CASE WHEN (DIS_IsWeightBased = 1) THEN UntName
	                      ELSE (SELECT TOP 1 UntName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
    			     END
WHERE DIS_WGHUntName = ''
UPDATE SSHH_PPOO_00000200
SET
    DIS_WGHUCtName = CASE WHEN (DIS_IsWeightBased = 1) THEN UCtName
						  ELSE (SELECT TOP 1 UCtName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
				     END
WHERE DIS_WGHUCtName = ''

DECLARE CurPurchases CURSOR FOR SELECT RecID,Quantity,Weight,UntName,QUANUntName,QUANUCtName FROM SSHH_PPOO_00000200 WHERE UCtName='WGH' ORDER BY RecID
OPEN CurPurchases
FETCH NEXT FROM CurPurchases INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@ItemCategory = 'WGH')
        BEGIN
            IF (@ItemUnit <> @PurchaseUnit) 
                BEGIN
                    SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
                    SET @Quantity = @Quantity * @FactorConversion
                    UPDATE SSHH_PPOO_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
               END
        END
    ELSE
        BEGIN
            UPDATE SSHH_PPOO_00000200 SET TotalUnits=@Weight WHERE RecID=@RecID
        END
    FETCH NEXT FROM CurPurchases INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurPurchases
DEALLOCATE CurPurchases



-- SSHH_SSHH_00000200
UPDATE SSHH_SSHH_00000200
SET 
    DIS_WGHUntName = CASE WHEN (DIS_IsWeightBased = 1) THEN UntName
						  ELSE (SELECT TOP 1 UntName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
					 END
WHERE DIS_WGHUntName = ''
UPDATE SSHH_SSHH_00000200
SET 
    DIS_WGHUCtName = CASE WHEN (DIS_IsWeightBased = 1) THEN UCtName
						  ELSE (SELECT TOP 1 UCtName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
					 END
WHERE DIS_WGHUCtName = ''

DECLARE CurReceipts CURSOR FOR SELECT RecID,Quantity,Weight,UntName,QUANUntName,QUANUCtName FROM SSHH_SSHH_00000200 WHERE UCtName='WGH' ORDER BY RecID
OPEN CurReceipts
FETCH NEXT FROM CurReceipts INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@ItemCategory = 'WGH')
        BEGIN
            IF (@ItemUnit <> @PurchaseUnit) 
                BEGIN
                    SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
                    SET @Quantity = @Quantity * @FactorConversion
                    UPDATE SSHH_SSHH_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
               END
        END
    ELSE
        BEGIN
            UPDATE SSHH_SSHH_00000200 SET TotalUnits=@Weight WHERE RecID=@RecID
        END
    FETCH NEXT FROM CurReceipts INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurReceipts
DEALLOCATE CurReceipts



-- SSHH_IINN_00000200
UPDATE SSHH_IINN_00000200
SET 
    DIS_WGHUntName = CASE WHEN (DIS_IsWeightBased = 1) THEN UntName
						  ELSE (SELECT TOP 1 UntName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
					 END
WHERE DIS_WGHUntName = ''
UPDATE SSHH_IINN_00000200
SET DIS_WGHUCtName = CASE WHEN (DIS_IsWeightBased = 1) THEN UCtName
						  ELSE (SELECT TOP 1 UCtName FROM SYST_UUMM_00000800 WHERE SYST_UUMM_00000800.TblRef = 'PPRR_PPRR_00000100' AND SYST_UUMM_00000800.FldRef = 'Weight' AND SYST_UUMM_00000800.USyName = 'MET')
				     END
WHERE DIS_WGHUCtName = ''

DECLARE CurInvoices CURSOR FOR SELECT RecID,Quantity,DIS_Weight,UntName,QUANUntName,QUANUCtName FROM SSHH_IINN_00000200 WHERE UCtName='WGH' ORDER BY RecID
OPEN CurInvoices
FETCH NEXT FROM CurInvoices INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@ItemCategory = 'WGH')
        BEGIN
            IF (@ItemUnit <> @PurchaseUnit) 
                BEGIN
                    SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
                    SET @Quantity = @Quantity * @FactorConversion
                    UPDATE SSHH_IINN_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
               END
        END
    ELSE
        BEGIN
            UPDATE SSHH_IINN_00000200 SET TotalUnits=@Weight WHERE RecID=@RecID
        END
	FETCH NEXT FROM CurInvoices INTO @RecID,@Quantity,@Weight,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurInvoices
DEALLOCATE CurInvoices