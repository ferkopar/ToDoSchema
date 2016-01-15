--------------------------------------------------------
--  Ref Constraints for Table DM_MESSAGE
--------------------------------------------------------

  ALTER TABLE "DM_MESSAGE" ADD CONSTRAINT "FK_DMLA_DMMG" FOREIGN KEY ("LANGUAGE_ID")
	  REFERENCES "DM_LANGUAGE" ("LANGUAGE_ID") DISABLE;
