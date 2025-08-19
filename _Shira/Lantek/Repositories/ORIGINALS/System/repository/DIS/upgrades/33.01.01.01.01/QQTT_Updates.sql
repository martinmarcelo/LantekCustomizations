-- @#LONGSCRIPT#@

-- QQTT_QQTT_00000200
DECLARE 
	@QutRef1			varchar(40) ,
	@LineNum1			varchar(40) ,
	@PrdRef				varchar(40)	,
	@Cost				float		,
	@Weight				float		,
	@UnitPrice			float		,
	@WrkCost			float		,
	@MatCost			float		,
	@OtherCost			float

DECLARE QuoteLineCursor CURSOR FOR
SELECT QutRef,LineNum from QQTT_QQTT_00000200 order by QutRef,LineNum

OPEN QuoteLineCursor
FETCH NEXT FROM QuoteLineCursor into @QutRef1, @LineNum1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Cost =		  (select Cost			 from QQTT_QQTT_00000200 where (QutRef = @QutRef1) and (LineNum = @LineNum1))
		SET @Weight =	  (select Weight		 from QQTT_QQTT_00000200 where (QutRef = @QutRef1) and (LineNum = @LineNum1))
		SET @UnitPrice =  (select UPrice		 from QQTT_QQTT_00000200 where (QutRef = @QutRef1) and (LineNum = @LineNum1))
		SET @PrdRef =     (select PrdRef		 from QQTT_QQTT_00000200 where (QutRef = @QutRef1) and (LineNum = @LineNum1))

		if (@PrdRef !='')
		BEGIN
			SET @WrkCost	= (select SUM(StdCostT)  from MMNN_PPOO_00000300 where (PrdRef = @PrdRef) and ((CType = 0 ) or (CType = 1)))
			SET @MatCost	= (select SUM(StdCostT)  from MMNN_PPOO_00000300 where (PrdRef = @PrdRef) and ((CType = 100)))
			SET @OtherCost  = (IsNull((select SUM(StdCostT)  from MMNN_PPOO_00000300 where (PrdRef = @PrdRef) and ((CType = 2 ) or (CType = 4) or (CType = 5) or (CType = 6))),0))
			if (@WrkCost > 0) update QQTT_QQTT_00000200 set DIS_WrkCost = @WrkCost	where (QutRef = @QutRef1) and (LineNum= @LineNum1)
			if (@MatCost > 0) update QQTT_QQTT_00000200 set DIS_MatCost = @MatCost	where (QutRef = @QutRef1) and (LineNum= @LineNum1)
			if (@OtherCost > 0) update QQTT_QQTT_00000200 set DIS_OtherCost = @OtherCost	where (QutRef = @QutRef1) and (LineNum= @LineNum1)
		END

		if @Weight > 0
		BEGIN
			update QQTT_QQTT_00000200 set DIS_WGHCost = (@Cost / @Weight)		 where (QutRef = @QutRef1) and (LineNum= @LineNum1)
			update QQTT_QQTT_00000200 set DIS_WGHUPrice = (@UnitPrice / @Weight) where (QutRef = @QutRef1) and (LineNum= @LineNum1)
		END
		if @Weight = 0
		BEGIN
			update QQTT_QQTT_00000200 set DIS_WGHCost = 0	where (QutRef = @QutRef1) and (LineNum= @LineNum1)
			update QQTT_QQTT_00000200 set DIS_WGHUPrice = 0	where (QutRef = @QutRef1) and (LineNum= @LineNum1)
		END
		FETCH NEXT FROM QuoteLineCursor into @QutRef1, @LineNum1
	END
CLOSE QuoteLineCursor
DEALLOCATE QuoteLineCursor


-- QQTT_QQTT_00000100
DECLARE 
	@LineNumOrg			varchar(40)	,
	@CountLines			int			,
	@LineParentCount    int			,
	@RealLineQuantity   int			,
	@LineQuantity		float		,
	@LineCost			float		,
	@ParentQuantity		float

DECLARE QuoteCursor CURSOR FOR
SELECT QutRef from QQTT_QQTT_00000100 order by QutRef

OPEN QuoteCursor
FETCH NEXT FROM QuoteCursor into @QutRef1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Cost = 0

		DECLARE QuoteLineCursor CURSOR FOR
		SELECT LineNum from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (DIS_IsComponent = 0)) order by QutRef,LineNum
		OPEN QuoteLineCursor
		FETCH NEXT FROM QuoteLineCursor into @LineNum1
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (@LineNum1 != '')
			BEGIN
				SET @CountLines = (select COUNT(*) from QQTT_QQTT_00000200 where ((QutRef = @QutRef1)and (LineNumOrg = @LineNum1) and (DIS_IsComponent = 0)))
				IF (@CountLines = 0)
				BEGIN
					SET @LineQuantity = (select Quantity from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (LineNum = @LineNum1)))
					SET @LineCost	  = (select Cost     from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (LineNum = @LineNum1)))
					SET @LineNumOrg   = (select LineNumOrg from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (LineNum = @LineNum1)))
					SET @RealLineQuantity = 1.0
					
								
					WHILE (@LineNumOrg != '')
					BEGIN										
						SET @ParentQuantity = (select Quantity from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (LineNum = @LineNumOrg)))
						SET @RealLineQuantity = @RealLineQuantity * @ParentQuantity
						SET @LineNumOrg = (select LineNumOrg from QQTT_QQTT_00000200 where ((QutRef = @QutRef1) and (LineNum = @LineNumOrg)))
					END
					SET @RealLineQuantity	= @RealLineQuantity * @LineQuantity
					SET @Cost = @Cost + (@RealLineQuantity * @LineCost)
				END
			END
			FETCH NEXT FROM QuoteLineCursor into @LineNum1		
		END
		CLOSE QuoteLineCursor
		DEALLOCATE QuoteLineCursor

		
		if (@Cost > 0)
		BEGIN
			update QQTT_QQTT_00000100 set TCost = @Cost where (QutRef = @QutRef1)
		END

		FETCH NEXT FROM QuoteCursor into @QutRef1
	END
CLOSE QuoteCursor
DEALLOCATE QuoteCursor
