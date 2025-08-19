-- @#LONGSCRIPT#@

--Updates in item tracking
UPDATE GLS_IITT_IITT_00000200
SET GLS_IITT_IITT_00000200.MainOriginFilter = ISNULL((
													  SELECT TOP 1 SSAA_SSHH_00000100.OrdRef
													  FROM SSAA_SSHH_00000100
													  WHERE GLS_IITT_IITT_00000200.Reference = SSAA_SSHH_00000100.ShpRef AND
													        GLS_IITT_IITT_00000200.Category = 54)
												     , ''),
	GLS_IITT_IITT_00000200.MainOriginTypeFilter = 2
WHERE GLS_IITT_IITT_00000200.Reference <> '' AND GLS_IITT_IITT_00000200.Category = 54