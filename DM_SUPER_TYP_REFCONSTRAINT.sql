--------------------------------------------------------
--  Ref Constraints for Table DM_SUPER_TYP
--------------------------------------------------------

  ALTER TABLE "DM_SUPER_TYP" ADD FOREIGN KEY ("GROUP_ID")
	  REFERENCES "DM_SUPER_TYP" ("SUPER_TYP_ID") DISABLE;
