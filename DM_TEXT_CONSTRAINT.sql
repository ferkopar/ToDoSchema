--------------------------------------------------------
--  Constraints for Table DM_TEXT
--------------------------------------------------------

  ALTER TABLE "DM_TEXT" ADD CONSTRAINT "PK_DM_TEXT" PRIMARY KEY ("DM_TEXT_ID") ENABLE;
 
  ALTER TABLE "DM_TEXT" MODIFY ("DM_TEXT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_TEXT" MODIFY ("STATUS_ID" NOT NULL ENABLE);
