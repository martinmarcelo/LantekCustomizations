-- @#LONGSCRIPT#@

update QQTT_QQTT_00000300 SET CurName = q.CurName  from QQTT_QQTT_00000300 ec join QQTT_QQTT_00000100 q on (ec.QutRef = q.QutRef)