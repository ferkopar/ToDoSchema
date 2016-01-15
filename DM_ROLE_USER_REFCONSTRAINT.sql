--------------------------------------------------------
--  Ref Constraints for Table DM_ROLE_USER
--------------------------------------------------------

  ALTER TABLE "DM_ROLE_USER" ADD CONSTRAINT "FK_DMRU_DMRO" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DM_ROLE" ("ROLE_ID") DISABLE;
