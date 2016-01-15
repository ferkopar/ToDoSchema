--------------------------------------------------------
--  Ref Constraints for Table DM_NAMES
--------------------------------------------------------

  ALTER TABLE "DM_NAMES" ADD CONSTRAINT "FK_DMNA_DMNA" FOREIGN KEY ("LANGUAGE_ID")
	  REFERENCES "DM_LANGUAGE" ("LANGUAGE_ID") DISABLE;
