--------------------------------------------------------
--  Ref Constraints for Table EPI_REL
--------------------------------------------------------

  ALTER TABLE "EPI_REL" ADD CONSTRAINT "FK_EPIS_EPIR_C" FOREIGN KEY ("EPI_ID1")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
 
  ALTER TABLE "EPI_REL" ADD CONSTRAINT "FK_EPIS_EPIR_P" FOREIGN KEY ("EPI_ID2")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
