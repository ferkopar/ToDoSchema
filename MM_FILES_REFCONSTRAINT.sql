--------------------------------------------------------
--  Ref Constraints for Table MM_FILES
--------------------------------------------------------

  ALTER TABLE "MM_FILES" ADD CONSTRAINT "FK_EPIS_MMFS" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
