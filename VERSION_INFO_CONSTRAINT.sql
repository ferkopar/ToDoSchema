--------------------------------------------------------
--  Constraints for Table VERSION_INFO
--------------------------------------------------------

  ALTER TABLE "VERSION_INFO" ADD CONSTRAINT "PK_VERSION_INFO" PRIMARY KEY ("DB_VER_INFO", "VER_INFO_ID") ENABLE;
 
  ALTER TABLE "VERSION_INFO" MODIFY ("VER_INFO_ID" NOT NULL DISABLE);
 
  ALTER TABLE "VERSION_INFO" MODIFY ("DB_VER_INFO" NOT NULL DISABLE);
