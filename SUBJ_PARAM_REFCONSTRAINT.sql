--------------------------------------------------------
--  Ref Constraints for Table SUBJ_PARAM
--------------------------------------------------------

  ALTER TABLE "SUBJ_PARAM" ADD CONSTRAINT "FK_SUBJ_PARAM_SUBJECT_SUBJ_ID" FOREIGN KEY ("SUBJ_ID")
	  REFERENCES "SUBJECT" ("SUBJ_ID") ON DELETE CASCADE ENABLE;
