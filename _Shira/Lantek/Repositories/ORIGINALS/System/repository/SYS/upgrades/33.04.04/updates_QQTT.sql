-- @#LONGSCRIPT#@

-- Update any quotes with root quote empty.
UPDATE QQTT_QQTT_00000100 SET RootQuote = QutRef 
WHERE Version = 1 AND RootQuote = ''

-- For existing project quotes, set invoicing method to invoicing plan.
UPDATE QQTT_QQTT_00000100 SET InvMethod = 1 
WHERE QType = 1