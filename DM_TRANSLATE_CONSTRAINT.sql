--------------------------------------------------------
--  Constraints for Table DM_TRANSLATE
--------------------------------------------------------

  ALTER TABLE "DM_TRANSLATE" ADD CONSTRAINT "PK_DM_TRANSLATE" PRIMARY KEY ("TRANSLATE_ID") ENABLE;
 
  ALTER TABLE "DM_TRANSLATE" MODIFY ("STATUS_ID" NOT NULL ENABLE);
