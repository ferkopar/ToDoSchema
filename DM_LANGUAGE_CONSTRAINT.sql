--------------------------------------------------------
--  Constraints for Table DM_LANGUAGE
--------------------------------------------------------

  ALTER TABLE "DM_LANGUAGE" ADD CONSTRAINT "CKC_RL_DM_LANGU" CHECK (RL IS NULL OR (RL IN ('R','L'))) ENABLE;
 
  ALTER TABLE "DM_LANGUAGE" ADD CONSTRAINT "PK_DM_LANGUAGE" PRIMARY KEY ("LANGUAGE_ID") ENABLE;
 
  ALTER TABLE "DM_LANGUAGE" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_LANGUAGE" MODIFY ("LANGUAGE_ID" NOT NULL ENABLE);
