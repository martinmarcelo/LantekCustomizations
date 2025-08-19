-- @#LONGSCRIPT#@

UPDATE PPBB_PPBB_00000100
SET
    OriginRef     = ISNULL((
                        SELECT TOP 1 Reference
                        FROM PPBB_PPBB_00000100 AS "PPBB_PPBB_0000100_BIS"
			            WHERE "PPBB_PPBB_0000100_BIS"."RecID" = "PPBB_PPBB_00000100"."RecordID"), ''),
    OriginLineNum = ISNULL((
                        SELECT  TOP 1 LineNum 
                        FROM PPBB_PPBB_00000100 AS "PPBB_PPBB_0000100_BIS"
			            WHERE "PPBB_PPBB_0000100_BIS"."RecID" = "PPBB_PPBB_00000100"."RecordID"), ''),
    OriginType = ISNULL((
                        SELECT  TOP 1 Type
                        FROM PPBB_PPBB_00000100 AS "PPBB_PPBB_0000100_BIS"
			            WHERE "PPBB_PPBB_0000100_BIS"."RecID" = "PPBB_PPBB_00000100"."RecordID"), 1)
WHERE "PPBB_PPBB_00000100"."RecordID" > 0