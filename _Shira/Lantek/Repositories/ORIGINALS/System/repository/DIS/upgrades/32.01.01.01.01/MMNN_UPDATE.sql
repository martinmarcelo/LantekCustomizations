-- @#LONGSCRIPT#@

--Si (PPRR_PPRR_000000100.DIS_Rotations.bit11 == 0)                                                     -> MMNN_MMOO_00000100. DIS_FillerPart = 0
--Si ((PPRR_PPRR_000000100.DIS_Rotations.bit11 == 1) && (PPRR_PPRR_000000100.DIS_Rotations.bit12 == 0)) -> MMNN_MMOO_00000100. DIS_FillerPart = 0
--                                                                                                      -> MMNN_MMOO_00000300. PPriority = 99
--Si ((PPRR_PPRR_000000100.DIS_Rotations.bit11 == 1) && (PPRR_PPRR_000000100.DIS_Rotations.bit12 == 1)) -> MMNN_MMOO_00000100. DIS_FillerPart = 1

UPDATE MMNN_MMOO_00000100
SET DIS_FillerPart = 0
Where (PrdRef in (SELECT PrdRef FROM PPRR_PPRR_00000100
                  WHERE SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,11,1) = '0'))

UPDATE MMNN_MMOO_00000100
SET DIS_FillerPart = 0
Where (PrdRef in (SELECT PrdRef FROM PPRR_PPRR_00000100
                  WHERE SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,11,1) = '1' and
                        SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,12,1) = '0'))
        
UPDATE MMNN_MMOO_00000300
SET PPriority = 99
Where (PrdRefDst in (SELECT PrdRef FROM PPRR_PPRR_00000100
                     WHERE SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,11,1) = '1' and
                           SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,12,1) = '0'))
       
UPDATE MMNN_MMOO_00000100
SET DIS_FillerPart = 1
Where (PrdRef in (SELECT PrdRef FROM PPRR_PPRR_00000100
                  WHERE SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,11,1) = '1' and
                        SUBSTRING(PPRR_PPRR_00000100.DIS_Rotations,12,1) = '1'))