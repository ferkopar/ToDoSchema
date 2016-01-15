--------------------------------------------------------
--  Ref Constraints for Table PRT_IC_ITEM
--------------------------------------------------------

  ALTER TABLE "PRT_IC_ITEM" ADD CONSTRAINT "FK_EPIS_PRII" FOREIGN KEY ("EPI_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
 
  ALTER TABLE "PRT_IC_ITEM" ADD CONSTRAINT "FK_PRIH_PRII" FOREIGN KEY ("IC_ID")
	  REFERENCES "PRT_IC_HEAD" ("IC_ID") DISABLE;
