--------------------------------------------------------
--  Constraints for Table DM_ROLE
--------------------------------------------------------

  ALTER TABLE "DM_ROLE" ADD CONSTRAINT "PK_DM_ROLE" PRIMARY KEY ("ROLE_ID") ENABLE;
 
  ALTER TABLE "DM_ROLE" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_ROLE" MODIFY ("ROLE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_ROLE" MODIFY ("ROLE_NAME" NOT NULL ENABLE);
