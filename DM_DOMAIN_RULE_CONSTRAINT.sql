--------------------------------------------------------
--  Constraints for Table DM_DOMAIN_RULE
--------------------------------------------------------

  ALTER TABLE "DM_DOMAIN_RULE" ADD CONSTRAINT "PK_DM_DOMAIN_RULE" PRIMARY KEY ("DOMAIN_RULE_ID") ENABLE;
 
  ALTER TABLE "DM_DOMAIN_RULE" MODIFY ("DOMAIN_RULE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DM_DOMAIN_RULE" MODIFY ("DOMAIN_ID" NOT NULL ENABLE);
