
-- Update fixed prices

DECLARE

@PrdRef nvarchar(40)

DECLARE CurItems CURSOR FOR
SELECT Prdref FROM PPRR_PPRR_00000100 WHERE StdCost = 0.0 and FixPrice = 0

OPEN CurItems
FETCH NEXT FROM CurItems INTO @PrdRef
WHILE @@FETCH_STATUS = 0
BEGIN
	
	if ((select count(*) from SSPP_TTRR_00000200 where PrdRef = @PrdRef and PPrice <> 0.0) > 0) begin

		update PPRR_PPRR_00000100 set FixPrice = 1 where PrdRef = @PrdRef

	end

	FETCH NEXT FROM CurItems INTO @PrdRef

END

CLOSE CurItems
DEALLOCATE CurItems