--------------------------------------------------------
--  Ref Constraints for Table EPI_TREATM
--------------------------------------------------------

  ALTER TABLE "EPI_TREATM" ADD CONSTRAINT "FK_EPIS_EPTR" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
