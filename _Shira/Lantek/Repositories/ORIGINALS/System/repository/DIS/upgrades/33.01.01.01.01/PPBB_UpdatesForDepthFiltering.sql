-- @#LONGSCRIPT#@

--Updates in product backlog lines
UPDATE PPBB_PPBB_00000100
SET PPBB_PPBB_00000100.MainOriginFilter =ISNULL((
												 SELECT TOP 1 SSAA_SSOO_00000100.OrdRef
												 FROM SSAA_SSOO_00000100, MMNN_MMOO_00000100
												 WHERE SSAA_SSOO_00000100.OrdRef = MMNN_MMOO_00000100.OrdRef AND
												       MMNN_MMOO_00000100.Origin = 1 AND 
													   PPBB_PPBB_00000100.Reference = MMNN_MMOO_00000100.MnORef AND
													   PPBB_PPBB_00000100.Type = 3
												), ''),
	PPBB_PPBB_00000100.MainOriginTypeFilter = 2
WHERE PPBB_PPBB_00000100.Reference <> '' AND PPBB_PPBB_00000100.Type = 3