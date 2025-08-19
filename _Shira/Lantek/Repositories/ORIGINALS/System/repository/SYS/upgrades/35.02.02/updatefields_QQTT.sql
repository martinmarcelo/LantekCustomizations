
-- Update new fields values.

UPDATE QQTT_QQTT_00000200 SET TariffMarkup = BaseMarkup, TariffUPrice = BaseUPrice

declare @texto as nvarchar(4000)
select @texto='alter table QQTT_QQTT_00000100 drop constraint ' + name from sysobjects where id =
(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.QQTT_QQTT_00000100')) and syscolumns.name = 'ExtraCostsSynchronized')
exec (@texto)

ALTER TABLE QQTT_QQTT_00000100 ALTER COLUMN ExtraCostsSynchronized tinyint NOT NULL
ALTER TABLE QQTT_QQTT_00000100 ADD CONSTRAINT DEF_VALUE_CONSTRAINT_ExtraCostsSynchronized DEFAULT 1 FOR ExtraCostsSynchronized

select @texto='alter table QQTT_QQTT_00000500 drop constraint ' + name from sysobjects where id =
(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.QQTT_QQTT_00000500')) and syscolumns.name = 'Description')
exec (@texto)

ALTER TABLE QQTT_QQTT_00000500 ALTER COLUMN Description ntext NOT NULL
ALTER TABLE QQTT_QQTT_00000500 ADD CONSTRAINT DEF_VALUE_CONSTRAINT_Description DEFAULT (N'') FOR Description