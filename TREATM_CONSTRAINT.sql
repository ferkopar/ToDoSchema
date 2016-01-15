--------------------------------------------------------
--  Constraints for Table TREATM
--------------------------------------------------------

  ALTER TABLE "TREATM" ADD CONSTRAINT "PK_TREATM" PRIMARY KEY ("TREATM_ID") ENABLE;
 
  ALTER TABLE "TREATM" MODIFY ("TREATM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "TREATM" MODIFY ("FROM_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "TREATM" MODIFY ("TO_DATE" NOT NULL ENABLE);
