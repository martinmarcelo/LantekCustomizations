-- @#LONGSCRIPT#@

-- Build conditions for Rules field of SSPP_TTRR_00000400 according to existing values in fields MinQuan and ItemGroup.
UPDATE SSPP_TTRR_00000400
SET SSPP_TTRR_00000400.Rules = '<CONDITIONS><CONDITION><EXPRESSION><FIELD FldRef="Quantity" /></EXPRESSION><GREATERTHAN /><EXPRESSION><CONSTANT Value="' + CAST(SSPP_TTRR_00000400.MinQuan AS VARCHAR) + '" Type="100" /></EXPRESSION></CONDITION><AND /><CONDITION><EXPRESSION><FIELD FldRef="CostGroup" /></EXPRESSION><EQUAL /><EXPRESSION><CONSTANT Value="' + SSPP_TTRR_00000400.ItemGroup  + '" Type="20" /></EXPRESSION></CONDITION></CONDITIONS>'

--Create SSPP_TTRR_00000400 records from SSPP_TTRR_00000500 records
DECLARE @TarRef nvarchar(40), @Version nvarchar(40), @Rule nvarchar(40), @CType smallint, @Group nvarchar(40),
@Markup float, @Margin float, @RecState smallint, @CrtDate datetime, @LastDate datetime, @CrtUser nvarchar(40), 
@LastUser nvarchar(40), @Owner nvarchar(40), @RecEnt nvarchar(40), @RecOU nvarchar(40), @RecSec int, @CntID int, @RecID int,
@RecIDToCreate int, @Conditions nvarchar(max), @Priority smallint, @NewRule nvarchar(40), @NumDetails int, @Rules nvarchar(max)
SET @RecIDToCreate = (SELECT TOP(1) RecID FROM SSPP_TTRR_00000400 ORDER BY RecID DESC)
Declare CurrentDetailedRule CURSOR FOR
SELECT *
FROM SSPP_TTRR_00000500
OPEN CurrentDetailedRule
	FETCH NEXT FROM CurrentDetailedRule INTO @TarRef, @Version, @Rule, @CType, @Group, @Markup, @Margin, @RecState, @CrtDate, @LastDate, @CrtUser, @LastUser, @Owner, @RecEnt, @RecOU, @RecSec, @CntID, @RecID
    WHILE @@FETCH_STATUS = 0
    BEGIN
		-- Build conditions for new record.
		IF @Group <> ''
		BEGIN
			IF @CType = 100
			BEGIN
				SET @Conditions = '<CONDITIONS><CONDITION><EXPRESSION><FIELD FldRef="MaterialCostGroup" /></EXPRESSION><EQUAL /><EXPRESSION><CONSTANT Value="' + @Group  + '" Type="20" /></EXPRESSION></CONDITION></CONDITIONS>'
			END
			ELSE
			BEGIN
				SET @Conditions = '<CONDITIONS><CONDITION><EXPRESSION><FIELD FldRef="OperationCostGroup" /></EXPRESSION><EQUAL /><EXPRESSION><CONSTANT Value="' + @Group  + '" Type="20" /></EXPRESSION></CONDITION></CONDITIONS>'
			END
		END
		ELSE
		BEGIN
			SET @Conditions = ''
		END

		-- Update next RecID to use.
		SET @RecIDToCreate = @RecIDToCreate + 1

		-- Get last priority used.
		SET @Priority = ISNULL((SELECT TOP(1) [Priority] FROM SSPP_TTRR_00000400
						 WHERE TarRef = @TarRef AND [Version] = @Version AND OriginRule = @Rule  ORDER BY [Priority] DESC),0)
		SET @Priority = @Priority + 1

		-- Get new Rule name.
		SET @NumDetails = (SELECT COUNT(*) FROM SSPP_TTRR_00000400 WHERE TarRef = @TarRef AND [Version] = @Version AND OriginRule = @Rule)
		SET @NewRule =  @Rule + '_'
		SET @NewRule = @NewRule + CAST(@NumDetails+1 AS VARCHAR);

		INSERT INTO SSPP_TTRR_00000400 (TarRef, [Version], [Rule], [Priority], Markup, Margin, RecState, CrtDate, LastDate, CrtUser, LastUser, [Owner], RecEnt, RecOU, RecSec, CntID, RecID, CType, OriginRule, Rules)
		VALUES (@TarRef, @Version, @NewRule, @Priority, @Markup, @Margin, @RecState, @CrtDate, @LastDate, @CrtUser, @LastUser, @Owner, @RecEnt, @RecOU, @RecSec, @CntID, @RecIDToCreate, @CType, @Rule, @Conditions)
        FETCH NEXT FROM CurrentDetailedRule INTO @TarRef, @Version, @Rule, @CType, @Group, @Markup, @Margin, @RecState, @CrtDate, @LastDate, @CrtUser, @LastUser, @Owner, @RecEnt, @RecOU, @RecSec, @CntID, @RecID
    END
CLOSE CurrentDetailedRule
DEALLOCATE CurrentDetailedRule

-- Mark SSPP_TTRR_00000500 table as DEL.
IF EXISTS  (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SSPP_TTRR_00000500')
BEGIN
    EXEC sp_rename 'SSPP_TTRR_00000500', 'DEL_SSPP_TTRR_00000500';
END