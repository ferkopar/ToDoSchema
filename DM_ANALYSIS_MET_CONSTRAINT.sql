--------------------------------------------------------
--  Constraints for Table DM_ANALYSIS_MET
--------------------------------------------------------

  ALTER TABLE "DM_ANALYSIS_MET" ADD CONSTRAINT "PK_DM_ANALYSIS_MET" PRIMARY KEY ("ANALYSIS_MET_ID") ENABLE;
 
  ALTER TABLE "DM_ANALYSIS_MET" MODIFY ("ANALYSIS_MET_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_ANALYSIS_MET" MODIFY ("STATUS_ID" NOT NULL ENABLE);
