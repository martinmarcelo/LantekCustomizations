
CREATE TABLE #QuoteLines
(QuoteReference nvarchar(255),
 QuoteLine nvarchar(255)) 

insert into #QuoteLines select QQTT_QQTT_00000200.QutRef, QQTT_QQTT_00000200.LineNum from QQTT_QQTT_00000200 LEFT JOIN MMNN_MMOO_00000100 ON QQTT_QQTT_00000200.QutRef = MMNN_MMOO_00000100.OrdRef and QQTT_QQTT_00000200.LineNum = MMNN_MMOO_00000100.OLineNum
where QQTT_QQTT_00000200.AddData <> '' and (MMNN_MMOO_00000100.MnoRef is NULL or MMNN_MMOO_00000100.MnoRef = '' or MMNN_MMOO_00000100.DIS_IsQuote = 0)
order by QQTT_QQTT_00000200.QutRef, QQTT_QQTT_00000200.LineNum

DECLARE @QuoteLines CURSOR
DECLARE @QuoteReference nvarchar(255)
DECLARE @QuoteLine nvarchar(255)

SET @QuoteLines = CURSOR FOR select * from #QuoteLines order by #QuoteLines.QuoteReference, #QuoteLines.QuoteLine

OPEN @QuoteLines

FETCH NEXT FROM @QuoteLines INTO @QuoteReference, @QuoteLine

WHILE (@@FETCH_STATUS = 0)

BEGIN	

	update top (1) MMNN_MMOO_00000100 set MMNN_MMOO_00000100.OrdRef=@QuoteReference, MMNN_MMOO_00000100.OLineNum = @QuoteLine from
	QQTT_QQTT_00000200 INNER JOIN MMNN_MMOO_00000300 ON QQTT_QQTT_00000200.AddData = MMNN_MMOO_00000300.DIS_JobRef and QQTT_QQTT_00000200.PrdRef = MMNN_MMOO_00000300.PrdRefDst 
					   INNER JOIN MMNN_MMOO_00000100 ON MMNN_MMOO_00000300.MnoRef = MMNN_MMOO_00000100.MnoRef
	where MMNN_MMOO_00000100.OrdRef = '' and MMNN_MMOO_00000100.OLineNum='' and MMNN_MMOO_00000100.DIS_IsQuote = 1 and
		  QQTT_QQTT_00000200.QutRef = @QuoteReference and QQTT_QQTT_00000200.LineNum = @QuoteLine

	FETCH NEXT FROM @QuoteLines INTO @QuoteReference, @QuoteLine

END 

CLOSE @QuoteLines
DEALLOCATE @QuoteLines
DROP TABLE #QuoteLines