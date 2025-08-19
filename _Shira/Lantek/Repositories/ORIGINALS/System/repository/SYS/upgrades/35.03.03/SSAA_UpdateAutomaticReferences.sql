-- @#LONGSCRIPT#@

-- Modify sale order automatic reference subclass name
UPDATE SYST_AARR_00000300
SET Subclasses = 'SaleOrder'
WHERE TblRef = 'SSAA_SSOO_00000100'