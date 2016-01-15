--------------------------------------------------------
--  Ref Constraints for Table INVENT_PARAM
--------------------------------------------------------

  ALTER TABLE "INVENT_PARAM" ADD CONSTRAINT "FK_EPI" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
 
  ALTER TABLE "INVENT_PARAM" ADD CONSTRAINT "FK_EPIV_EINP" FOREIGN KEY ("INVENT_ID")
	  REFERENCES "INVENT" ("INVENT_ID") DISABLE;
