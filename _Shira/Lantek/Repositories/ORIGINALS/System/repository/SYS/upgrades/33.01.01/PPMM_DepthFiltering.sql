-- @#LONGSCRIPT#@

--Updates related to projects
UPDATE PPBB_PPBB_00000100
SET PPBB_PPBB_00000100.MainOriginFilter = PPBB_PPBB_00000100.Reference,
	PPBB_PPBB_00000100.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100
													  WHERE PPMM_PPMM_00000100.PrjRef = PPBB_PPBB_00000100.Reference AND
															PPBB_PPBB_00000100.Type = 2
													  ), ''),
	PPBB_PPBB_00000100.MainOriginTypeFilter = 1
WHERE PPBB_PPBB_00000100.Reference <> '' AND PPBB_PPBB_00000100.Type = 2

UPDATE SSHH_PPOO_00000200
SET SSHH_PPOO_00000200.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100
												  WHERE PPMM_PPMM_00000100.RecID = SSHH_PPOO_00000200.RecordID AND
												        SSHH_PPOO_00000200.AssocElementType = 1
												), ''),
	SSHH_PPOO_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_PPOO_00000200.RecordID AND 
															SSHH_PPOO_00000200.AssocElementType = 1
													 ), ''),
	SSHH_PPOO_00000200.MainOriginTypeFilter = 1
WHERE SSHH_PPOO_00000200.RecordID > 0 AND SSHH_PPOO_00000200.AssocElementType = 1

UPDATE SSHH_PPOO_00000200
SET SSHH_PPOO_00000200.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
												  WHERE PPMM_PPMM_00000100.RecID = SSHH_PPOO_00000200.RecordID AND 
												        PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
														SSHH_PPOO_00000200.AssocElementType = 2
												  ), ''),
	SSHH_PPOO_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_PPOO_00000200.RecordID AND 
															PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
															SSHH_PPOO_00000200.AssocElementType = 2
													), ''),
	SSHH_PPOO_00000200.MainOriginTypeFilter = 1
WHERE SSHH_PPOO_00000200.RecordID > 0 AND SSHH_PPOO_00000200.AssocElementType = 2

--Updates in purchase invoice lines
UPDATE SSHH_IINN_00000200
SET SSHH_IINN_00000200.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100
												   WHERE PPMM_PPMM_00000100.RecID = SSHH_IINN_00000200.RecordID AND 
												         SSHH_IINN_00000200.AssocElement2 = 1
												), ''),
	SSHH_IINN_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_IINN_00000200.RecordID AND 
													        SSHH_IINN_00000200.AssocElement2 = 1
												), ''),
	SSHH_IINN_00000200.MainOriginTypeFilter = 1
WHERE SSHH_IINN_00000200.RecordID > 0 AND SSHH_IINN_00000200.AssocElement2 = 1

UPDATE SSHH_IINN_00000200
SET SSHH_IINN_00000200.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
												  WHERE PPMM_PPMM_00000100.RecID = SSHH_IINN_00000200.RecordID AND 
														PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
														SSHH_IINN_00000200.AssocElement2 = 2
											     ), ''),
	SSHH_IINN_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_IINN_00000200.RecordID AND 
															PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
															SSHH_IINN_00000200.AssocElement2 = 2
													 ), ''),
	SSHH_IINN_00000200.MainOriginTypeFilter = 1
WHERE SSHH_IINN_00000200.RecordID > 0 AND SSHH_IINN_00000200.AssocElement2 = 2

--Updates in good receipt lines
UPDATE SSHH_SSHH_00000200
SET SSHH_SSHH_00000200.MainOriginFilter = ISNULL((
											      SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100
												  WHERE PPMM_PPMM_00000100.RecID = SSHH_SSHH_00000200.RecordID AND 
														SSHH_SSHH_00000200.AssocElementType = 1
												 ), ''),
	SSHH_SSHH_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_SSHH_00000200.RecordID AND 
															SSHH_SSHH_00000200.AssocElementType = 1
													), ''),
	SSHH_SSHH_00000200.MainOriginTypeFilter = 1
WHERE SSHH_SSHH_00000200.RecordID > 0 AND SSHH_SSHH_00000200.AssocElementType = 1

UPDATE SSHH_SSHH_00000200
SET SSHH_SSHH_00000200.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
												  WHERE PPMM_PPMM_00000100.RecID = SSHH_SSHH_00000200.RecordID AND 
													    PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
														SSHH_SSHH_00000200.AssocElementType = 2
												), ''),
	SSHH_SSHH_00000200.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200
													  WHERE PPMM_PPMM_00000100.RecID = SSHH_SSHH_00000200.RecordID AND 
															PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
															SSHH_SSHH_00000200.AssocElementType = 2
													  ), ''),
	SSHH_SSHH_00000200.MainOriginTypeFilter = 1
WHERE SSHH_SSHH_00000200.RecordID > 0 AND SSHH_SSHH_00000200.AssocElementType = 2

UPDATE WWHH_MMVV_00000100
SET WWHH_MMVV_00000100.MainOriginFilter = WWHH_MMVV_00000100.Reference,
	WWHH_MMVV_00000100.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100
													  WHERE PPMM_PPMM_00000100.PrjRef = WWHH_MMVV_00000100.Reference AND 
															WWHH_MMVV_00000100.Category = 300
													 ), ''),
	WWHH_MMVV_00000100.MainOriginTypeFilter = 1
WHERE WWHH_MMVV_00000100.Reference <> '' AND WWHH_MMVV_00000100.Category = 300

--Good receipt

UPDATE WWHH_MMVV_00000100
SET WWHH_MMVV_00000100.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000100.PrjRef
												  FROM PPMM_PPMM_00000100, SSHH_SSHH_00000200
												  WHERE SSHH_SSHH_00000200.RecordID = PPMM_PPMM_00000100.RecID AND 
													    SSHH_SSHH_00000200.AssocElementType = 1 AND 
														SSHH_SSHH_00000200.OrdRef = WWHH_MMVV_00000100.Reference AND 
														WWHH_MMVV_00000100.Category = 100
											), ''),
	WWHH_MMVV_00000100.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
													  FROM PPMM_PPMM_00000100, SSHH_SSHH_00000200
													  WHERE SSHH_SSHH_00000200.RecordID = PPMM_PPMM_00000100.RecID AND 
															SSHH_SSHH_00000200.AssocElementType = 1 AND 
															SSHH_SSHH_00000200.OrdRef = WWHH_MMVV_00000100.Reference AND 
															WWHH_MMVV_00000100.Category = 100
													), ''),
	WWHH_MMVV_00000100.MainOriginTypeFilter = 1
WHERE WWHH_MMVV_00000100.Reference <> '' AND WWHH_MMVV_00000100.Category = 100

UPDATE WWHH_MMVV_00000100
SET WWHH_MMVV_00000100.MainOriginFilter = ISNULL((
												  SELECT TOP 1 PPMM_PPMM_00000200.PrjRef
												  FROM PPMM_PPMM_00000200, SSHH_SSHH_00000200
												  WHERE SSHH_SSHH_00000200.RecordID = PPMM_PPMM_00000200.RecID AND 
														SSHH_SSHH_00000200.AssocElementType = 2 AND 
														SSHH_SSHH_00000200.OrdRef = WWHH_MMVV_00000100.Reference AND 
														WWHH_MMVV_00000100.Category = 100
												  ), ''),
	WWHH_MMVV_00000100.MainOriginNameFilter = ISNULL((
													  SELECT TOP 1 PPMM_PPMM_00000100.Project
														FROM PPMM_PPMM_00000100, PPMM_PPMM_00000200, SSHH_SSHH_00000200
														WHERE SSHH_SSHH_00000200.RecordID = PPMM_PPMM_00000200.RecID AND 
															  PPMM_PPMM_00000100.PrjRef = PPMM_PPMM_00000200.PrjRef AND 
															  SSHH_SSHH_00000200.AssocElementType = 2 AND 
															  SSHH_SSHH_00000200.OrdRef = WWHH_MMVV_00000100.Reference AND 
															  WWHH_MMVV_00000100.Category = 100
													), ''),
	WWHH_MMVV_00000100.MainOriginTypeFilter = 1
WHERE WWHH_MMVV_00000100.Reference <> '' AND WWHH_MMVV_00000100.Category = 100