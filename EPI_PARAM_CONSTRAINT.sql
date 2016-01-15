--------------------------------------------------------
--  Constraints for Table EPI_PARAM
--------------------------------------------------------

  ALTER TABLE "EPI_PARAM" ADD CONSTRAINT "PK_EPI_SUBJ_PARAM" PRIMARY KEY ("EPI_SUBJ_ID") ENABLE;
 
  ALTER TABLE "EPI_PARAM" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "EPI_PARAM" MODIFY ("EPI_SUBJ_ID" NOT NULL DISABLE);
