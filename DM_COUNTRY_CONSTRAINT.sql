--------------------------------------------------------
--  Constraints for Table DM_COUNTRY
--------------------------------------------------------

  ALTER TABLE "DM_COUNTRY" ADD CONSTRAINT "PK_DM_COUNTRY" PRIMARY KEY ("COUNTRY_ID") ENABLE;
 
  ALTER TABLE "DM_COUNTRY" MODIFY ("COUNTRY_ID" NOT NULL ENABLE);
