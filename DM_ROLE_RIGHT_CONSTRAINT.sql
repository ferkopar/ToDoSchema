--------------------------------------------------------
--  Constraints for Table DM_ROLE_RIGHT
--------------------------------------------------------

  ALTER TABLE "DM_ROLE_RIGHT" ADD CONSTRAINT "PK_DM_ROLE_RIGHT" PRIMARY KEY ("ROLE_RIGHT_ID") ENABLE;
 
  ALTER TABLE "DM_ROLE_RIGHT" MODIFY ("ROLE_ID" NOT NULL ENABLE);
