--------------------------------------------------------
--  Ref Constraints for Table USERS_DEFAULTS
--------------------------------------------------------

  ALTER TABLE "USERS_DEFAULTS" ADD CONSTRAINT "FK_EPIS_USDE" FOREIGN KEY ("USER_ID")
	  REFERENCES "EPI" ("EPI_ID") DISABLE;
