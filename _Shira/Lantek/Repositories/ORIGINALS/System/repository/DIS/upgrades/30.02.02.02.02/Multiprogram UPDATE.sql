-- @#LONGSCRIPT#@

UPDATE DIS_MMPP_MMPP_00000100 SET Type = 4 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000300 WHERE NCategory = 5 OR NCategory = 6)


DECLARE 
@RecID bigint,
@RecIDAux bigint

DECLARE CurMP300 CURSOR FOR 
SELECT RecID FROM DIS_MMPP_MMPP_00000300 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000100 WHERE Type > 1)

SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM DIS_NEST_NEST_00000100),0)
OPEN CurMP300
FETCH NEXT FROM CurMP300 INTO @RecID
WHILE @@FETCH_STATUS = 0
   BEGIN
		SET @RecIDAux = @RecIDAux + 1
		INSERT INTO DIS_NEST_NEST_00000100 (MltPrgRef, NstRef, NstPRef, CopyIndx, WrkRef, OprRef, NOrder, CDate, NCategory, CNC, ShtRef, ShtRefOrg, RealSht, MatRef, SLength, SWidth, SThickness, Sarea, 
        SUArea, SWeight, SUWeight, SXMax, SYMax, SPriority, SProfit, SProfitS, SMSQuant, ETime, Quantity, UData1, UData2, Descrip, NstCpyRef, UnitaryNest, Var1, Var2, 
        Var3, Var4, Var5, CamLastDate, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, RecSec, CntID, RecID)
		SELECT MlpRef, NstRef, NstPRef, CopyIndx, WrkRef, OprRef, NOrder, CDate, NCategory, CNC, ShtRef, ShtRefOrg, RealSht, MatRef, SLength, SWidth, SThickness, Sarea, 
        SUArea, SWeight, SUWeight, SXMax, SYMax, SPriority, SProfit, SProfitS, SMSQuant, ETime, Quantity, UData1, UData2, Descrip, NstCpyRef, UnitaryNest, Var1, Var2, 
        Var3, Var4, Var5, CamLastDate, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, RecSec, CntID, @RecIDAux
		FROM DIS_MMPP_MMPP_00000300 WHERE RecID = @RecID

		FETCH NEXT FROM CurMP300 INTO @RecID
   END
CLOSE CurMP300
DEALLOCATE CurMP300

DECLARE CurMP400 CURSOR FOR 
SELECT RecID FROM DIS_MMPP_MMPP_00000400 WHERE NstRef IN 
(SELECT NstRef FROM DIS_MMPP_MMPP_00000300 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000100 WHERE Type > 1))

SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM DIS_NEST_NEST_00000200),0)
OPEN CurMP400
FETCH NEXT FROM CurMP400 INTO @RecID
WHILE @@FETCH_STATUS = 0
   BEGIN
		SET @RecIDAux = @RecIDAux + 1
		INSERT INTO DIS_NEST_NEST_00000200 (NstRef, MCode, MsgDesc, MsgNum, ValType, UCtName, USCName, UntName, DValue, CValue, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, 
        RecOU, RecSec, CntID, RecID)
		SELECT NstRef, MCode, MsgDesc, MsgNum, ValType, UCtName, USCName, UntName, DValue, CValue, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, 
        RecOU, RecSec, CntID, @RecIDAux FROM DIS_MMPP_MMPP_00000400 WHERE RecID = @RecID

		FETCH NEXT FROM CurMP400 INTO @RecID
   END
CLOSE CurMP400
DEALLOCATE CurMP400

DECLARE CurMP500 CURSOR FOR 
SELECT RecID FROM DIS_MMPP_MMPP_00000500 WHERE NstRef IN 
(SELECT NstRef FROM DIS_MMPP_MMPP_00000300 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000100 WHERE Type > 1))

SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM DIS_NEST_NEST_00000300),0)
OPEN CurMP500
FETCH NEXT FROM CurMP500 INTO @RecID
WHILE @@FETCH_STATUS = 0
   BEGIN
		SET @RecIDAux = @RecIDAux + 1
		INSERT INTO DIS_NEST_NEST_00000300 ( NstRef, ShtRef, RIndex, Quantity, Var1, Var2, Var3, Var4, Var5, RecState, CrtDate, LastDate, CrtUser, LastUser, 
		Owner, RecEnt, RecOU, RecSec, CntID, RecID)
		SELECT  NstRef, ShtRef, RIndex, Quantity, Var1, Var2, Var3, Var4, Var5, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, 
		RecSec, CntID,@RecIDAux FROM DIS_MMPP_MMPP_00000500 WHERE RecID = @RecID

		FETCH NEXT FROM CurMP500 INTO @RecID
   END
CLOSE CurMP500
DEALLOCATE CurMP500

DECLARE CurMP600 CURSOR FOR 
SELECT RecID FROM DIS_MMPP_MMPP_00000600 WHERE NstRef IN 
(SELECT NstRef FROM DIS_MMPP_MMPP_00000300 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000100 WHERE Type > 1))

SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM DIS_NEST_NEST_00000400),0)
OPEN CurMP600
FETCH NEXT FROM CurMP600 INTO @RecID
WHILE @@FETCH_STATUS = 0
   BEGIN
		SET @RecIDAux = @RecIDAux + 1
		INSERT INTO DIS_NEST_NEST_00000400 (NstRef, WrkRef, TurrRef, TPosition, MltRef, MPosition, PunchRef, DieRef, PAngle, IsUsed, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, 
        RecSec, CntID, RecID)
		SELECT NstRef, WrkRef, TurrRef, TPosition, MltRef, MPosition, PunchRef, DieRef, PAngle, IsUsed, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, 
        RecSec, CntID, @RecIDAux
		FROM DIS_MMPP_MMPP_00000600 WHERE RecID = @RecID

		FETCH NEXT FROM CurMP600 INTO @RecID
   END
CLOSE CurMP600
DEALLOCATE CurMP600

DECLARE CurMP700 CURSOR FOR 
SELECT RecID FROM DIS_MMPP_MMPP_00000700 WHERE NstRef IN 
(SELECT NstRef FROM DIS_MMPP_MMPP_00000300 WHERE MlpRef IN (SELECT MlpRef FROM DIS_MMPP_MMPP_00000100 WHERE Type > 1))

SET @RecIDAux = ISNULL((SELECT MAX(RecID) FROM DIS_NEST_NEST_00000500),0)
OPEN CurMP700
FETCH NEXT FROM CurMP700 INTO @RecID
WHILE @@FETCH_STATUS = 0
   BEGIN
		SET @RecIDAux = @RecIDAux + 1
		INSERT INTO DIS_NEST_NEST_00000500 ( NstRef, PrdRefDst, Quantity, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, 
		RecSec, CntID, RecID)
		SELECT  NstRef, PrdRefDst, Quantity, RecState, CrtDate, LastDate, CrtUser, LastUser, Owner, RecEnt, RecOU, RecSec, CntID, @RecIDAux
		FROM DIS_MMPP_MMPP_00000700 WHERE RecID = @RecID

		FETCH NEXT FROM CurMP700 INTO @RecID
   END
CLOSE CurMP700
DEALLOCATE CurMP700


-- Arreglillos
DROP INDEX [dbo].[DIS_NEST_NEST_00000600].PK_DIS_NEST_NEST_00000600
CREATE NONCLUSTERED INDEX PK_DIS_NEST_NEST_00000600 ON [dbo].[DIS_NEST_NEST_00000600] ([NstRef],[RecordID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
