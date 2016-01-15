--------------------------------------------------------
--  Ref Constraints for Table PRT_IC_HEAD
--------------------------------------------------------

  ALTER TABLE "PRT_IC_HEAD" ADD CONSTRAINT "FK_EPIS_PRIH" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
