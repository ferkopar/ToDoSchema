--------------------------------------------------------
--  Constraints for Table SUBJ_PARAM
--------------------------------------------------------

  ALTER TABLE "SUBJ_PARAM" ADD CONSTRAINT "PK_SUBJ_PARAM" PRIMARY KEY ("SUBJ_PARAM_ID") ENABLE;
 
  ALTER TABLE "SUBJ_PARAM" MODIFY ("SUBJ_PARAM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "SUBJ_PARAM" MODIFY ("FROM_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "SUBJ_PARAM" MODIFY ("TO_DATE" NOT NULL ENABLE);
