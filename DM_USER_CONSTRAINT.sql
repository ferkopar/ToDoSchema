--------------------------------------------------------
--  Constraints for Table DM_USER
--------------------------------------------------------

  ALTER TABLE "DM_USER" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_USER" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "DM_USER" ADD CONSTRAINT "UK_DMUS" PRIMARY KEY ("USER_ID") ENABLE;
