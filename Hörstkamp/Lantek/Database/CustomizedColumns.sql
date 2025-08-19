ALTER TABLE CCOO_CCOO_00000100
ADD END_CompanySageTemplate  NVARCHAR(120) NULL;

ALTER TABLE SYST_OORR_00000100
ADD END_MainBankName NVARCHAR(120) NULL,
END_MainBankAccount NVARCHAR(120) NULL,
END_SecondaryBank NVARCHAR(120) NULL,
END_SecondaryBankAccount NVARCHAR(120) NULL,
END_MainBankAccountAdditionalData NVARCHAR(120) NULL,
END_SecondaryBankAccountAdditionalData NVARCHAR(120) NULL,
END_StandardQuoteMessage NVARCHAR(120) NULL,
END_StandardQuoteDeliveryMessage NVARCHAR(120) NULL;

ALTER TABLE QQTT_QQTT_00000100
ADD END_RequestForQuotation NVARCHAR(30) NULL, 
END_DeliveryTime NVARCHAR(30) NULL, 
END_StandardQuoteMessage NVARCHAR(500) NULL DEFAULT 'wir danken für Ihre Anfrage und bieten Ihnen unter Zugrundelegung unserer bekannten Verkaufs-und Lieferbedingung wie folgt freibleibend an :' WITH VALUES;

ALTER TABLE SSHH_PPOO_00000100
ADD END_CostGroup NVARCHAR(50);

ALTER TABLE OOSS_OOOO_00000100
ADD END_CostGroup NVARCHAR(50);