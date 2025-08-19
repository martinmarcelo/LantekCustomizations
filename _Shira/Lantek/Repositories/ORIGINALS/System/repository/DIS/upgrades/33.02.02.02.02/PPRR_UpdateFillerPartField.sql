-- @#LONGSCRIPT#@
-- Update DIS_FillerPart field with 1 when value was 2 becasuse is obsolete

update PPRR_PPRR_00000100 set DIS_FillerPart = 1 where DIS_FillerPart = 2

-- Fix Expert a Integra field problems

update PPRR_PPRR_00000100 set DIS_Rotations = SUBSTRING(DIS_Rotations,1, 10) + '11' + SUBSTRING(DIS_Rotations,13, LEN(DIS_Rotations)) where DIS_FillerPart = 1 and SUBSTRING(DIS_Rotations,11, 2) <> '11'
update PPRR_PPRR_00000100 set DIS_FillerPart = 1 where SUBSTRING(DIS_Rotations,11, 2) = '11' and DIS_FillerPart <> 1