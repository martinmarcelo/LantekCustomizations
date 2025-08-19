-- @#LONGSCRIPT#@

-- Set time sheets' end date with time sheets' start date, given that its default value is set to '1900-01-01 00:00:00'
UPDATE TTSS_TTSS_00000100 SET TTSS_TTSS_00000100.TSheetEDate = TTSS_TTSS_00000100.TSheetSDate WHERE TTSS_TTSS_00000100.TSheetEDate = '1900-01-01 00:00:00'