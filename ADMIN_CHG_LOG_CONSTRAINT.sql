--------------------------------------------------------
--  Constraints for Table ADMIN_CHG_LOG
--------------------------------------------------------

  ALTER TABLE "ADMIN_CHG_LOG" ADD CONSTRAINT "PK_ADMIN_CHG_LOG" PRIMARY KEY ("CHG_LOG_ID") ENABLE;
 
  ALTER TABLE "ADMIN_CHG_LOG" MODIFY ("CHG_LOG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_CHG_LOG" MODIFY ("TABLE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ADMIN_CHG_LOG" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
