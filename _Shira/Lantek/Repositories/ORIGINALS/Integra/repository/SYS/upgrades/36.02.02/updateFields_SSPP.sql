UPDATE RuleDetail set OriginRule = isnull(cast(tariffRule.RecID as nvarchar(40)),'') from [dbo].[SSPP_TTRR_00000400] as RuleDetail left join [dbo].[SSPP_TTRR_00000400] as TariffRule
ON RuleDetail.TarRef = TariffRule.TarRef and RuleDetail.Version = TariffRule.Version and RuleDetail.[OriginRule] = TariffRule.[Rule]
