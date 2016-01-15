--------------------------------------------------------
--  Ref Constraints for Table WK_TREATM_REL
--------------------------------------------------------

  ALTER TABLE "WK_TREATM_REL" ADD CONSTRAINT "FK_EPIS_TRTR_COPY" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
