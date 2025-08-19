DECLARE @lbToKgFactor float
SELECT @lbToKgFactor=MFactor FROM SYST_UUMM_00000500 WHERE UntNameOrg = 'lb' AND UntNameDst = 'kg' AND UCtName = 'WGH'

UPDATE MMNN_PPOO_00000300 
SET 
	StdQuan = StdQuan*@lbToKgFactor,
	StdCostU = StdCostU/@lbToKgFactor,
	CurQuan = CurQuan*@lbToKgFactor,
	CurCostU = CurCostU/@lbToKgFactor,
	UntName = 'kg'
WHERE CType=100 AND UntName='lb' AND UCtName='WGH'


UPDATE MMNN_MMOO_00000400 
SET 
	StdQuan = StdQuan*@lbToKgFactor, 
	StdCostU = StdCostU/@lbToKgFactor,
	CurQuan = CurQuan*@lbToKgFactor,
	CurCostU = CurCostU/@lbToKgFactor,
	AvlQuan = AvlQuan*@lbToKgFactor,
	AvlCostU = AvlCostU/@lbToKgFactor,
	UntName = 'kg'
WHERE CType=100 AND UntName='lb' AND UCtName='WGH'