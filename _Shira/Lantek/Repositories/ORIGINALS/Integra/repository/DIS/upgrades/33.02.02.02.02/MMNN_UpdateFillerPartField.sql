-- @#LONGSCRIPT#@
-- Update DIS_FillerPart field with 1 when value was 2 becasuse is obsolete

update MMNN_MMOO_00000100 set DIS_FillerPart = 1 where DIS_FillerPart = 2