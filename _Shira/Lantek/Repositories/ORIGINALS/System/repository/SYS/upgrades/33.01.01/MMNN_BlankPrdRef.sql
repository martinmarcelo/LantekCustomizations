-- @#LONGSCRIPT#@

--Updates production order operations

-- Item.
UPDATE MMNN_MMOO_00000300 
SET MMNN_MMOO_00000300.PrdRef = ISNULL((SELECT TOP 1 MMNN_MMOO_00000100.PrdRef
                                       FROM MMNN_MMOO_00000100 
                                       WHERE MMNN_MMOO_00000100.MnORef = MMNN_MMOO_00000300.MnORef AND 
                                            (MMNN_MMOO_00000100.MnORoot = MMNN_MMOO_00000100.MnORef OR MMNN_MMOO_00000100.MnORoot = '')), '')
WHERE MMNN_MMOO_00000300.PrdRef = '' 

-- Complex item.
UPDATE MMNN_MMOO_00000300
SET MMNN_MMOO_00000300.PrdRef = ISNULL((SELECT TOP 1 MN_MO_100_ROOT.PrdRef 
                                       FROM MMNN_MMOO_00000100 MN_MO_100 INNER JOIN MMNN_MMOO_00000100 MN_MO_100_ROOT ON MN_MO_100_ROOT.MnORef = MN_MO_100.MnORoot
                                       WHERE MN_MO_100.MnORef = MMNN_MMOO_00000300.MnORef 
                                       AND MN_MO_100.MnORoot <> MN_MO_100.MnORef), '')
WHERE MMNN_MMOO_00000300.PrdRef = '' 