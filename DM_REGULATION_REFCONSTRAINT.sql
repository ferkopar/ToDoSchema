--------------------------------------------------------
--  Ref Constraints for Table DM_REGULATION
--------------------------------------------------------

  ALTER TABLE "DM_REGULATION" ADD CONSTRAINT "FK_DMRO_DMRG" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DM_ROLE" ("ROLE_ID") DISABLE;
