-- @#LONGSCRIPT#@
DECLARE @RecID as int
DECLARE @Quantity as float
DECLARE @FactorConversion as float
DECLARE @PurchaseUnit as varchar(80)
DECLARE @ItemUnit as varchar(80)
DECLARE @ItemCategory as varchar(80)

-- SSHH_PPOO_00000200
UPDATE SSHH_PPOO_00000200
SET
    QUANUCtName = ISNULL((SELECT TOP 1 UCtName FROM PPRR_PPRR_00000100 WHERE SSHH_PPOO_00000200.PrdRef = PPRR_PPRR_00000100.PrdRef), 'UNT'),
    QUANUntName = ISNULL((SELECT TOP 1 UntName FROM PPRR_PPRR_00000100 WHERE SSHH_PPOO_00000200.PrdRef = PPRR_PPRR_00000100.PrdRef), 'unt')

DECLARE CurPurchases CURSOR FOR SELECT RecID,Quantity,UntName,QUANUntName,QUANUCtName FROM SSHH_PPOO_00000200 WHERE UCtName = QUANUCtName ORDER BY RecID
OPEN CurPurchases
FETCH NEXT FROM CurPurchases INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@PurchaseUnit = @ItemUnit)
        BEGIN
            UPDATE SSHH_PPOO_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    ELSE 
        BEGIN
            SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
            SET @Quantity = @Quantity * @FactorConversion
            UPDATE SSHH_PPOO_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    FETCH NEXT FROM CurPurchases INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurPurchases
DEALLOCATE CurPurchases



-- SSHH_SSHH_00000200
UPDATE SSHH_SSHH_00000200
SET
    QUANUCtName = ISNULL((SELECT TOP 1 UCtName FROM PPRR_PPRR_00000100 WHERE SSHH_SSHH_00000200.PrdRef = PPRR_PPRR_00000100.PrdRef), 'UNT'),
    QUANUntName = ISNULL((SELECT TOP 1 UntName FROM PPRR_PPRR_00000100 WHERE SSHH_SSHH_00000200.PrdRef = PPRR_PPRR_00000100.PrdRef), 'unt')

DECLARE CurReceipts CURSOR FOR SELECT RecID,Quantity,UntName,QUANUntName,QUANUCtName FROM SSHH_SSHH_00000200 WHERE UCtName = QUANUCtName ORDER BY RecID
OPEN CurReceipts
FETCH NEXT FROM CurReceipts INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@PurchaseUnit = @ItemUnit)
        BEGIN
            UPDATE SSHH_SSHH_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    ELSE 
        BEGIN
            SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
            SET  @Quantity = @Quantity * @FactorConversion
            UPDATE SSHH_SSHH_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    FETCH NEXT FROM CurReceipts INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurReceipts
DEALLOCATE CurReceipts


                      
-- SSHH_IINN_00000200
UPDATE SSHH_IINN_00000200
SET
    QUANUCtName = CASE WHEN (AssocElement = 2) THEN 'UNT' 
                       ELSE ISNULL((SELECT TOP 1 UCtName FROM PPRR_PPRR_00000100 WHERE SSHH_IINN_00000200.AssocElementCode = PPRR_PPRR_00000100.PrdRef), 'UNT')
                  END,
    QUANUntName = CASE WHEN (AssocElement = 2) THEN 'unt'
                       ELSE ISNULL((SELECT TOP 1 UntName FROM PPRR_PPRR_00000100 WHERE SSHH_IINN_00000200.AssocElementCode = PPRR_PPRR_00000100.PrdRef), 'unt')
                  END

DECLARE CurInvoices CURSOR FOR SELECT RecID,Quantity,UntName,QUANUntName,QUANUCtName FROM SSHH_IINN_00000200 WHERE UCtName = QUANUCtName ORDER BY RecID
OPEN CurInvoices
FETCH NEXT FROM CurInvoices INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
WHILE @@FETCH_STATUS = 0
BEGIN
    IF (@PurchaseUnit = @ItemUnit)
        BEGIN
            UPDATE SSHH_IINN_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    ELSE 
        BEGIN
            SET @FactorConversion = ISNULL((SELECT TOP 1 MFactor FROM SYST_UUMM_00000500 WHERE UCtName = @ItemCategory AND UntNameOrg = @ItemUnit AND UntNameDst = @PurchaseUnit), '1')
            SET @Quantity = @Quantity * @FactorConversion
            UPDATE SSHH_IINN_00000200 SET TotalUnits=@Quantity WHERE RecID=@RecID
        END
    FETCH NEXT FROM CurInvoices INTO @RecID,@Quantity,@PurchaseUnit,@ItemUnit,@ItemCategory
END
CLOSE CurInvoices
DEALLOCATE CurInvoices