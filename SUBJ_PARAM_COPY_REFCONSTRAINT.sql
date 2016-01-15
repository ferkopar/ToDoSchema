--------------------------------------------------------
--  Ref Constraints for Table SUBJ_PARAM_COPY
--------------------------------------------------------

  ALTER TABLE "SUBJ_PARAM_COPY" ADD CONSTRAINT "FK_SUBJ_PARAM_COPY_SUBJECT" FOREIGN KEY ("SUBJ_ID")
	  REFERENCES "SUBJECT" ("SUBJ_ID") ON DELETE CASCADE ENABLE;
