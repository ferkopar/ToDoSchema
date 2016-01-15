--------------------------------------------------------
--  Ref Constraints for Table DM_ROLE_RIGHT
--------------------------------------------------------

  ALTER TABLE "DM_ROLE_RIGHT" ADD CONSTRAINT "FK_DMR_DMRO" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DM_ROLE" ("ROLE_ID") DISABLE;
