-- @#LONGSCRIPT#@

-- Update carrier charges.

DECLARE

@UCtName nvarchar(80),
@UntName nvarchar(80),
@Price float,
@RecID Integer

DECLARE CurCarrierCharges CURSOR FOR
SELECT UCtName, UntName, Price, RecID FROM SSPP_SSPP_00000600

OPEN CurCarrierCharges
FETCH NEXT FROM CurCarrierCharges INTO @UCtName, @UntName, @Price, @RecID
WHILE @@FETCH_STATUS = 0
BEGIN
	
	if (@UCtName = 'WGH') begin
		
		update SSPP_SSPP_00000600 set WeightPrice = @Price, Price = 0 where RecID = @RecID

	end
	else begin

		update SSPP_SSPP_00000600 set UCtName = 'WGH', UntName = 'kg' where RecID = @RecID		

	end

	FETCH NEXT FROM CurCarrierCharges INTO @UCtName, @UntName, @Price, @RecID

END

CLOSE CurCarrierCharges
DEALLOCATE CurCarrierCharges