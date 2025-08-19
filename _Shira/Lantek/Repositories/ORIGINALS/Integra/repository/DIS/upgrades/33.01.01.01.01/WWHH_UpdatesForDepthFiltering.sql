-- @#LONGSCRIPT#@

--Updates in warehouse movements
UPDATE WWHH_MMVV_00000100
SET WWHH_MMVV_00000100.MainOriginFilter =ISNULL(( 
												 SELECT TOP 1 SSAA_SSOO_00000100.OrdRef
												 FROM SSAA_SSOO_00000100, MMNN_MMOO_00000100
												 WHERE SSAA_SSOO_00000100.OrdRef = MMNN_MMOO_00000100.OrdRef AND
													   MMNN_MMOO_00000100.Origin = 1 AND
													   WWHH_MMVV_00000100.Reference = MMNN_MMOO_00000100.MnORef AND
													   WWHH_MMVV_00000100.Category = 500
												), ''),
	WWHH_MMVV_00000100.MainOriginTypeFilter = 2
WHERE WWHH_MMVV_00000100.Reference <> '' AND WWHH_MMVV_00000100.Category = 500
