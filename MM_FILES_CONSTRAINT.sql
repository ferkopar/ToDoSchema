--------------------------------------------------------
--  Constraints for Table MM_FILES
--------------------------------------------------------

  ALTER TABLE "MM_FILES" ADD CONSTRAINT "PK_MM_FILES" PRIMARY KEY ("MM_ID") ENABLE;
 
  ALTER TABLE "MM_FILES" MODIFY ("MM_ID" NOT NULL DISABLE);
 
  ALTER TABLE "MM_FILES" ADD CHECK ("MM_HYPL" IS NOT NULL) DISABLE;
