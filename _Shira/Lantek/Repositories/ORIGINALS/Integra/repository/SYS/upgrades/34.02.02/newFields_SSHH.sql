-- @#LONGSCRIPT#@

declare @texto as nvarchar(4000)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SSHH_SSPP_00000100' AND COLUMN_NAME = 'SwCode')
BEGIN
	ALTER TABLE SSHH_SSPP_00000100 ADD SwCode nvarchar(50) NOT NULL DEFAULT N''
END
ELSE BEGIN

	ALTER TABLE SSHH_SSPP_00000100 ALTER COLUMN SwCode nvarchar(50) NOT NULL
	--SwCode
	select @texto='alter table SSHH_SSPP_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.SSHH_SSPP_00000100')) and syscolumns.name = 'SwCode')
	exec (@texto)
	ALTER TABLE SSHH_SSPP_00000100 ADD CONSTRAINT DF_SSHH_SSPP_00000100_SwCode DEFAULT N'' FOR  SwCode

END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SSHH_SSPP_00000100' AND COLUMN_NAME = 'Iban')
BEGIN
	ALTER TABLE SSHH_SSPP_00000100 ADD Iban nvarchar(50) NOT NULL DEFAULT N''
END
ELSE BEGIN

	ALTER TABLE SSHH_SSPP_00000100 ALTER COLUMN Iban nvarchar(50) NOT NULL
	--Iban
	select @texto='alter table SSHH_SSPP_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.SSHH_SSPP_00000100')) and syscolumns.name = 'Iban')
	exec (@texto)
	ALTER TABLE SSHH_SSPP_00000100 ADD CONSTRAINT DF_SSHH_SSPP_00000100_Iban DEFAULT N'' FOR  Iban

END
