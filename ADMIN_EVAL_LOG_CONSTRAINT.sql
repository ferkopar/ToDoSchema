--------------------------------------------------------
--  Constraints for Table ADMIN_EVAL_LOG
--------------------------------------------------------

  ALTER TABLE "ADMIN_EVAL_LOG" ADD CONSTRAINT "PK_ADMIN_EVAL_LOG" PRIMARY KEY ("EVAL_LOG_ID") ENABLE;
 
  ALTER TABLE "ADMIN_EVAL_LOG" MODIFY ("EVAL_LOG_ID" NOT NULL ENABLE);
