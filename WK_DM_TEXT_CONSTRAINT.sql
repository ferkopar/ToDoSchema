--------------------------------------------------------
--  Constraints for Table WK_DM_TEXT
--------------------------------------------------------

  ALTER TABLE "WK_DM_TEXT" ADD CONSTRAINT "PK_WK_DM_TEXT" PRIMARY KEY ("DM_TEXT_ID") ENABLE;
 
  ALTER TABLE "WK_DM_TEXT" MODIFY ("DM_TEXT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "WK_DM_TEXT" MODIFY ("STATUS_ID" NOT NULL ENABLE);
