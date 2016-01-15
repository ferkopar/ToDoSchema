--------------------------------------------------------
--  Constraints for Table TIME_TABLE
--------------------------------------------------------

  ALTER TABLE "TIME_TABLE" ADD CONSTRAINT "PK_TIME_TABLE" PRIMARY KEY ("TIME_ID") ENABLE;
 
  ALTER TABLE "TIME_TABLE" MODIFY ("TIME_ID" NOT NULL DISABLE);
