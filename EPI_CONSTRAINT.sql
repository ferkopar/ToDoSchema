--------------------------------------------------------
--  Constraints for Table EPI
--------------------------------------------------------

  ALTER TABLE "EPI" ADD CONSTRAINT "PK_EPI" PRIMARY KEY ("EPI_ID") ENABLE;
 
  ALTER TABLE "EPI" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "EPI" MODIFY ("EPI_ID" NOT NULL ENABLE);
