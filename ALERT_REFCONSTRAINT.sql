--------------------------------------------------------
--  Ref Constraints for Table ALERT
--------------------------------------------------------

  ALTER TABLE "ALERT" ADD CONSTRAINT "FK_DMMG_ALRT" FOREIGN KEY ("MESSAGE_ID")
	  REFERENCES "DM_MESSAGE" ("MESSAGE_ID") DISABLE;
 
  ALTER TABLE "ALERT" ADD CONSTRAINT "FK_EPIS_ALRT" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
