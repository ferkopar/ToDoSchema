--------------------------------------------------------
--  Constraints for Table DM_XL_REL
--------------------------------------------------------

  ALTER TABLE "DM_XL_REL" ADD CONSTRAINT "PK_DM_XL_REL" PRIMARY KEY ("DM_XL_REL_ID") DISABLE;
 
  ALTER TABLE "DM_XL_REL" ADD CHECK ("DM_XL_ID1" IS NOT NULL) DISABLE;
 
  ALTER TABLE "DM_XL_REL" ADD CHECK ("DM_XL_ID2" IS NOT NULL) DISABLE;
