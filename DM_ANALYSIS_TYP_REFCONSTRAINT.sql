--------------------------------------------------------
--  Ref Constraints for Table DM_ANALYSIS_TYP
--------------------------------------------------------

  ALTER TABLE "DM_ANALYSIS_TYP" ADD CONSTRAINT "FK_DMAN_DMAN" FOREIGN KEY ("ANALYSIS_GROUP_ID")
	  REFERENCES "DM_ANALYSIS_TYP" ("ANALYSIS_TYPE_ID") DISABLE;
