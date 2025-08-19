-- @#LONGSCRIPT#@
-- Updates in MMNN_MMOO_00000100 for displaying associated element according to manufacturing configuration parameter "Associated element to display"
DECLARE @MainRef nvarchar(40), @MainName nvarchar(255), @PackageRef nvarchar(40), @PackageName nvarchar(255), @OrderRef nvarchar(40), @OrderName nvarchar(255), @Reference nvarchar(40), @LineNum varchar(40), @ElementIdentifier int

--  Manufacturing orders
Declare CurPOperation CURSOR FOR
SELECT Distinct (OrdRef)
FROM MMNN_MMOO_00000100
WHERE (OrdRef<>'') AND (Origin=2) 
OPEN CurPOperation
    FETCH NEXT FROM CurPOperation INTO @Reference
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @PackageRef=''
        SET @PackageName=''
        SET @MainRef=''
        SET @MainName=''
        --  Package data retrieval
        SELECT @PackageRef=WWPP100.OriginOrder, @PackageName=WWPP100_PARENT.OrdName FROM WWPP_WWOO_00000100 WWPP100_PARENT
        INNER JOIN WWPP_WWOO_00000100 WWPP100 ON WWPP100.OriginOrder = WWPP100_PARENT.OrdRef
        WHERE WWPP100.OrdRef = @Reference 
        UPDATE MMNN_MMOO_00000100
        SET WorkPackage = @PackageRef, WorkPackageName=@PackageName
        WHERE OrdRef = @Reference AND Origin=2
        -- Main package data retrieval
        SELECT @MainRef=WWPP100.RootOrder, @MainName=WWPP100_PARENT.OrdName FROM WWPP_WWOO_00000100 WWPP100_PARENT
        INNER JOIN WWPP_WWOO_00000100 WWPP100 ON WWPP100.RootOrder = WWPP100_PARENT.OrdRef
        WHERE WWPP100.OrdRef = @Reference 
        UPDATE MMNN_MMOO_00000100
        SET MainPackage = @MainRef, MainPackageName=@MainName
        WHERE OrdRef = @Reference AND Origin=2
        FETCH NEXT FROM CurPOperation INTO @Reference
    END
CLOSE CurPOperation
DEALLOCATE CurPOperation

-- Manufacturing operations
Declare CurPOperation CURSOR FOR
SELECT Distinct (OrdRef)
FROM MMNN_MMOO_00000300
WHERE (OrdRef<>'') AND (Origin=2) 
OPEN CurPOperation
    FETCH NEXT FROM CurPOperation INTO @Reference
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @MainRef=''
        SET @MainName=''
        -- Main package data retrieval
        SELECT @MainRef=WWPP100.RootOrder, @MainName=WWPP100_PARENT.OrdName FROM WWPP_WWOO_00000100 WWPP100_PARENT
        INNER JOIN WWPP_WWOO_00000100 WWPP100 ON WWPP100.RootOrder = WWPP100_PARENT.OrdRef
        WHERE WWPP100.OrdRef = @Reference 
        UPDATE MMNN_MMOO_00000300
        SET MainPackage = @MainRef, MainPackageName=@MainName
        WHERE OrdRef = @Reference AND Origin=2
        FETCH NEXT FROM CurPOperation INTO @Reference
    END
CLOSE CurPOperation
DEALLOCATE CurPOperation