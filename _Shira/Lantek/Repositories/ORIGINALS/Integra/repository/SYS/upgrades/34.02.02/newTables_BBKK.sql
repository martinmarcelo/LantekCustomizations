-- @#LONGSCRIPT#@

declare @texto as nvarchar(4000)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BBKK_MNDT_00000100')
BEGIN
	CREATE TABLE BBKK_MNDT_00000100 (
		ComRef nvarchar(40) NOT NULL DEFAULT N'',
		ComName nvarchar(255) NOT NULL DEFAULT N'',
		ManRef nvarchar(40) NOT NULL DEFAULT N'',
		ManType smallint NOT NULL DEFAULT 0,
		BankNorm smallint NOT NULL DEFAULT 0,
		ManDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		ManEndDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		DebitDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		Descrip ntext NOT NULL DEFAULT N'',
		IsActive tinyint NOT NULL DEFAULT 1,
		RecState smallint NOT NULL DEFAULT 0,
		CrtDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		LastDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		CrtUser nvarchar(40) NOT NULL DEFAULT N'',
		LastUser nvarchar(40) NOT NULL DEFAULT N'',
		Owner nvarchar(40) NOT NULL DEFAULT N'',
		RecEnt nvarchar(40) NOT NULL DEFAULT N'',
		RecOU nvarchar(40) NOT NULL DEFAULT N'',
		RecSec int NOT NULL DEFAULT 0,
		CntID int NOT NULL DEFAULT -1,
		RecID int NOT NULL DEFAULT 0
	)

	CREATE NONCLUSTERED INDEX [PK_BBKK_MNDT_00000100] ON [dbo].[BBKK_MNDT_00000100] 
	(
		[ManRef] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	CREATE UNIQUE CLUSTERED INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000100] 
	(
		[RecID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE BEGIN

	DROP INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000100] WITH ( ONLINE = OFF )
	DROP INDEX [PK_BBKK_MNDT_00000100] ON [dbo].[BBKK_MNDT_00000100]

	--ComRef
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'ComRef')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_ComRef DEFAULT N'' FOR  ComRef

	--ComName
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'ComName')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_ComName DEFAULT N'' FOR  ComName

	--ManRef
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'ManRef')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_ManRef DEFAULT N'' FOR  ManRef

	--Descrip
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'Descrip')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_Descrip DEFAULT N'' FOR  Descrip

	--CrtUser
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'CrtUser')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_CrtUser DEFAULT N'' FOR  CrtUser

	--LastUser
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'LastUser')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_LastUser DEFAULT N'' FOR  LastUser

	--Owner
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'Owner')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_Owner DEFAULT N'' FOR  Owner

	--RecEnt
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'RecEnt')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_RecEnt DEFAULT N'' FOR  RecEnt

	--RecOU
	select @texto='alter table BBKK_MNDT_00000100 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000100')) and syscolumns.name = 'RecOU')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000100 ADD CONSTRAINT DF_BBKK_MNDT_00000100_RecOU DEFAULT N'' FOR  RecOU

	CREATE UNIQUE CLUSTERED INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000100]
	(
		[RecID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	CREATE NONCLUSTERED INDEX [PK_BBKK_MNDT_00000100] ON [dbo].[BBKK_MNDT_00000100]
	(
		[ManRef] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BBKK_MNDT_00000200')
BEGIN

	CREATE TABLE BBKK_MNDT_00000200 (
		ManRef nvarchar(40) NOT NULL DEFAULT N'',
		LineNum int NOT NULL DEFAULT 0,
		Reason smallint NOT NULL DEFAULT 0,
		Value nvarchar(255) NOT NULL DEFAULT N'',
		IsSent tinyint NOT NULL DEFAULT 0,
		RemittanceID int NOT NULL DEFAULT 0,
		CDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		RecState smallint NOT NULL DEFAULT 0,
		CrtDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		LastDate datetime NOT NULL DEFAULT ('1900-01-01 00:00:00'),
		CrtUser nvarchar(40) NOT NULL DEFAULT N'',
		LastUser nvarchar(40) NOT NULL DEFAULT N'',
		Owner nvarchar(40) NOT NULL DEFAULT N'',
		RecEnt nvarchar(40) NOT NULL DEFAULT N'',
		RecOU nvarchar(40) NOT NULL DEFAULT N'',
		RecSec int NOT NULL DEFAULT 0,
		CntID int NOT NULL DEFAULT -1,
		RecID int NOT NULL DEFAULT 0
	)

	CREATE NONCLUSTERED INDEX [PK_BBKK_MNDT_00000200] ON [dbo].[BBKK_MNDT_00000200] 
	(
		[ManRef] ASC,
		[LineNum] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	CREATE UNIQUE CLUSTERED INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000200] 
	(
		[RecID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE BEGIN

DROP INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000200] WITH ( ONLINE = OFF )
DROP INDEX [PK_BBKK_MNDT_00000200] ON [dbo].[BBKK_MNDT_00000200]

	--ManRef
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'ManRef')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_ManRef DEFAULT N'' FOR  ManRef

	--Value
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'Value')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_Value DEFAULT N'' FOR  Value

	--CrtUser
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'CrtUser')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_CrtUser DEFAULT N'' FOR  CrtUser

	--LastUser
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'LastUser')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_LastUser DEFAULT N'' FOR  LastUser

	--Owner
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'Owner')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_Owner DEFAULT N'' FOR  Owner

	--RecEnt
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'RecEnt')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_RecEnt DEFAULT N'' FOR  RecEnt

	--RecOU
	select @texto='alter table BBKK_MNDT_00000200 drop constraint ' + name from sysobjects where id =
	(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
	sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.BBKK_MNDT_00000200')) and syscolumns.name = 'RecOU')
	exec (@texto)
	ALTER TABLE BBKK_MNDT_00000200 ADD CONSTRAINT DF_BBKK_MNDT_00000200_RecOU DEFAULT N'' FOR  RecOU

	CREATE UNIQUE CLUSTERED INDEX [INRecID] ON [dbo].[BBKK_MNDT_00000200]
	(
		[RecID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	CREATE NONCLUSTERED INDEX [PK_BBKK_MNDT_00000200] ON [dbo].[BBKK_MNDT_00000200]
	(
		[ManRef] ASC,
		[LineNum] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

END
