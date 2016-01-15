--------------------------------------------------------
--  DDL for Table APEX_MENU_TEMP
--------------------------------------------------------

  CREATE TABLE "APEX_MENU_TEMP" 
   (	"USER_ID" NUMBER(12,0), 
	"TYPE_ID" NUMBER(12,0), 
	"PARENT_ID" NUMBER(12,0), 
	"CNAMES" VARCHAR2(4000), 
	"URL_LINK" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "APEX_MENU_TEMP"."CNAMES" IS 'Apex menû neve (fejléce)';
 
   COMMENT ON TABLE "APEX_MENU_TEMP"  IS 'Apex menu strukturák nyilvántartási táblája';
