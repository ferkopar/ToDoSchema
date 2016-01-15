--------------------------------------------------------
--  Constraints for Table ALERT
--------------------------------------------------------

  ALTER TABLE "ALERT" ADD CONSTRAINT "PK_ALERT" PRIMARY KEY ("ALERT_ID") ENABLE;
 
  ALTER TABLE "ALERT" MODIFY ("ALERT_ID" NOT NULL ENABLE);
