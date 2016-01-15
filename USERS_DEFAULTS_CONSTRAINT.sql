--------------------------------------------------------
--  Constraints for Table USERS_DEFAULTS
--------------------------------------------------------

  ALTER TABLE "USERS_DEFAULTS" ADD CONSTRAINT "PK_USERS_DEFAULTS" PRIMARY KEY ("USDEFAULTS_ID") ENABLE;
 
  ALTER TABLE "USERS_DEFAULTS" MODIFY ("USDEFAULTS_ID" NOT NULL DISABLE);
