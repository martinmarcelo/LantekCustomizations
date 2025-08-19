-- @#LONGSCRIPT#@

-- Build conditions for Rules field of QQTT_QQTT_00000300 according to existing values in field ConceptLines.
UPDATE QQTT_QQTT_00000300
SET QQTT_QQTT_00000300.Rules = '<CONDITIONS><CONDITION><EXPRESSION><FIELD FldRef="ConceptLine" /></EXPRESSION><EQUAL /><EXPRESSION><CONSTANT Value="' + CAST(QQTT_QQTT_00000300.ConceptLines AS VARCHAR) + '" Type="10" /></EXPRESSION></CONDITION></CONDITIONS>'
WHERE QQTT_QQTT_00000300.ConceptLines = 0

-- Set QType according to the type of quote they belong to.
UPDATE QuoteExtraCost
SET QuoteExtraCost.QType = Quote.QType
FROM QQTT_QQTT_00000300 QuoteExtraCost INNER JOIN QQTT_QQTT_00000100 Quote ON
QuoteExtraCost.QutRef = Quote.QutRef