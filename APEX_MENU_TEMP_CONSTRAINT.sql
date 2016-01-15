--------------------------------------------------------
--  Constraints for Table APEX_MENU_TEMP
--------------------------------------------------------

  ALTER TABLE "APEX_MENU_TEMP" ADD CONSTRAINT "APEX_MENU_TEMP_PK" PRIMARY KEY ("USER_ID", "TYPE_ID") ENABLE;
 
  ALTER TABLE "APEX_MENU_TEMP" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "APEX_MENU_TEMP" MODIFY ("TYPE_ID" NOT NULL ENABLE);
