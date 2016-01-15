--------------------------------------------------------
--  Constraints for Table PRT_IC_HEAD
--------------------------------------------------------

  ALTER TABLE "PRT_IC_HEAD" ADD CONSTRAINT "PK_PRT_IC_HEAD" PRIMARY KEY ("IC_ID") ENABLE;
 
  ALTER TABLE "PRT_IC_HEAD" MODIFY ("IC_ID" NOT NULL DISABLE);
 
  ALTER TABLE "PRT_IC_HEAD" MODIFY ("IC_SOURCE" NOT NULL DISABLE);
 
  ALTER TABLE "PRT_IC_HEAD" MODIFY ("IC_TIMESTAMP" NOT NULL DISABLE);
