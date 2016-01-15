--------------------------------------------------------
--  Constraints for Table ALERT_PARAM
--------------------------------------------------------

  ALTER TABLE "ALERT_PARAM" ADD CONSTRAINT "PK_ALERT_PARAM" PRIMARY KEY ("ALERT_PARAM_ID") ENABLE;
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("ALERT_PARAM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("ALERT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ALERT_PARAM" MODIFY ("PARAM_TYPE_ID" NOT NULL ENABLE);
