-- @#LONGSCRIPT#@

-- Remove constraints for SDeep

declare @texto as nvarchar(4000)
select @texto='alter table DIS_PPTT_WWCC_00000100 drop constraint ' + name from sysobjects where id =
(select sysconstraints.constid from sysconstraints inner join syscolumns on sysconstraints.id = syscolumns.id and
sysconstraints.colid = syscolumns.colid and syscolumns.id = (SELECT OBJECT_ID(N'dbo.DIS_PPTT_WWCC_00000100')) and syscolumns.name = 'SDeep')
exec (@texto)

-- Change default type and value

ALTER TABLE DIS_PPTT_WWCC_00000100 ALTER COLUMN SDeep float NOT NULL

ALTER TABLE DIS_PPTT_WWCC_00000100 ADD  DEFAULT ((0)) FOR SDeep

-- Fix SDeep value: take the decimal part from SftTyp

DECLARE @RecID integer,
@SftTyp int,
@SDeep float,
@TemporalString nvarchar(4),
@TemporalSDeep nvarchar(3),
@TemporalSDeepValue nvarchar(max),
@TemporalSftTyp nvarchar(1)

DECLARE CurWorkCenterPunch CURSOR FOR
SELECT      RecID, SftTyp, SDeep
FROM         DIS_PPTT_WWCC_00000100

OPEN CurWorkCenterPunch
FETCH NEXT FROM CurWorkCenterPunch INTO @RecID, @SftTyp, @SDeep
WHILE @@FETCH_STATUS = 0
BEGIN

	IF (@SftTyp >= 10) BEGIN

		SET @TemporalString = cast(@SftTyp as nvarchar(4))
		SET @TemporalSDeep = SUBSTRING(@TemporalString, 0, 4)
		SET @TemporalSftTyp = SUBSTRING(@TemporalString, 4, 1)

		SET @TemporalSDeepValue = cast(@SDeep as nvarchar(max)) + '.' + @TemporalSDeep

		UPDATE DIS_PPTT_WWCC_00000100 SET SftTyp = cast(@TemporalSftTyp as int) where RecID = @RecID

		UPDATE DIS_PPTT_WWCC_00000100 SET SDeep = CONVERT(float, @TemporalSDeepValue) where RecID = @RecID

	END

	FETCH NEXT FROM CurWorkCenterPunch INTO @RecID, @SftTyp, @SDeep

END

CLOSE CurWorkCenterPunch
DEALLOCATE CurWorkCenterPunch