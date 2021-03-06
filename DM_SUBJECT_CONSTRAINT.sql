--------------------------------------------------------
--  Constraints for Table DM_SUBJECT
--------------------------------------------------------

  ALTER TABLE "DM_SUBJECT" ADD CONSTRAINT "PK_DM_SUBJECT" PRIMARY KEY ("DM_SUBJECT_ID") ENABLE;
 
  ALTER TABLE "DM_SUBJECT" MODIFY ("MANDATORY" NOT NULL ENABLE);
 
  ALTER TABLE "DM_SUBJECT" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "DM_SUBJECT" MODIFY ("MULTIPLY" NOT NULL ENABLE);
 
  ALTER TABLE "DM_SUBJECT" MODIFY ("APPENDABLE" NOT NULL ENABLE);
