-- @#LONGSCRIPT#@

-- Outsourcing orders

update SSHH_IINN_00000200 set SOLineNum = OLineNum where ElementType = 1

DECLARE @SOrderLineNum nvarchar(40),@RecID int
DECLARE MainCursor CURSOR FOR
SELECT SOLineNum,RecID FROM SSHH_IINN_00000200 where ElementType = 1
OPEN MainCursor
FETCH MainCursor INTO @SOrderLineNum,@RecID
WHILE (@@FETCH_STATUS = 0 )
    BEGIN

		IF (LEN(@SOrderLineNum) > 1) begin
           set @SOrderLineNum = '0' + @SOrderLineNum
        end
		else
		begin
			set @SOrderLineNum = '00' + @SOrderLineNum
        end
        update SSHH_IINN_00000200 set SOLineNum = @SOrderLineNum where RecID = @RecID
	    FETCH MainCursor INTO @SOrderLineNum,@RecID
    END 
CLOSE MainCursor
DEALLOCATE MainCursor

-- Outsourcing receipts

update SSHH_IINN_00000200 set SSLineNum = SLineNum where ElementType = 1

DECLARE @SShipLineNum nvarchar(40)
DECLARE MainCursor CURSOR FOR
SELECT SSLineNum,RecID FROM SSHH_IINN_00000200 where ElementType = 1
OPEN MainCursor
FETCH MainCursor INTO @SShipLineNum,@RecID
WHILE (@@FETCH_STATUS = 0 )
    BEGIN

		IF (LEN(@SShipLineNum) > 1) begin
           set @SShipLineNum = '0' + @SShipLineNum
        end
		else
		begin
			set @SShipLineNum = '00' + @SShipLineNum
        end
        update SSHH_IINN_00000200 set SSLineNum = @SShipLineNum where RecID = @RecID
	    FETCH MainCursor INTO @SShipLineNum,@RecID
    END 
CLOSE MainCursor
DEALLOCATE MainCursor