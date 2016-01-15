--------------------------------------------------------
--  Ref Constraints for Table TREATM_REL
--------------------------------------------------------

  ALTER TABLE "TREATM_REL" ADD CONSTRAINT "FK_EPIS_TRTR" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
