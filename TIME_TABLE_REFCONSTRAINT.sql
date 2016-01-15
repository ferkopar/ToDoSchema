--------------------------------------------------------
--  Ref Constraints for Table TIME_TABLE
--------------------------------------------------------

  ALTER TABLE "TIME_TABLE" ADD CONSTRAINT "FK_ALRT_TIMT" FOREIGN KEY ("ALERT_ID")
	  REFERENCES "ALERT" ("ALERT_ID") DISABLE;
 
  ALTER TABLE "TIME_TABLE" ADD CONSTRAINT "FK_EPIS_TIMT" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
