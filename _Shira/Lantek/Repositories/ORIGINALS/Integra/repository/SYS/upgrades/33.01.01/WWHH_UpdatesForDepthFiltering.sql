-- @#LONGSCRIPT#@

--Sale delivery note
UPDATE WWHH_MMVV_00000100
SET WWHH_MMVV_00000100.MainOriginFilter = ISNULL((
												  SELECT TOP 1 SSAA_SSHH_00000100.OrdRef
												  FROM SSAA_SSHH_00000100
												  WHERE SSAA_SSHH_00000100.ShpRef = WWHH_MMVV_00000100.Reference AND
														WWHH_MMVV_00000100.Category = 200
												), ''), 
	MainOriginTypeFilter = 2
WHERE (Category = 200) AND (Reference <> '')
