-- @#LONGSCRIPT#@

--Sale delivery note lines
UPDATE SSAA_SSHH_00000200
SET MainOriginFilter = OrdRef, 
	MainOriginTypeFilter = 2
WHERE OrdRef <> ''