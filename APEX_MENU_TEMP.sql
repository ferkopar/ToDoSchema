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
 

   COMMENT ON COLUMN "APEX_MENU_TEMP"."CNAMES" IS 'Apex men� neve (fejl�ce)';
 
   COMMENT ON TABLE "APEX_MENU_TEMP"  IS 'Apex menu struktur�k nyilv�ntart�si t�bl�ja';
