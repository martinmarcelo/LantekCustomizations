-- @#LONGSCRIPT#@

-- IsLastLevel must be calculated for each work package, as the default value (true) will be only valid for work orders.
UPDATE WWPP_WWOO_00000100 SET IsLastLevel = 0 
WHERE EXISTS (SELECT * FROM WWPP_WWOO_00000100 as child WHERE WWPP_WWOO_00000100.OrdRef = child.OriginOrder AND WWPP_WWOO_00000100.Type = 1 AND child.Type = 1)