--------------------------------------------------------
--  DDL for Table ADMIN_CHG_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_CHG_LOG" 
   (	"CHG_LOG_ID" NUMBER(12,0), 
	"TABLE_ID" NUMBER(12,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"COLUMN_NAME" VARCHAR2(30), 
	"CHANGE" VARCHAR2(255), 
	"MDU" VARCHAR2(30), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_CHG_LOG"."CHG_LOG_ID" IS 'Változtatás típusa egyedi azonosítója';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TABLE_ID" IS 'Tábla sorának egyedi azonosítója';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TABLE_NAME" IS 'Tábla neve';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."COLUMN_NAME" IS 'Oszlop név';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."CHANGE" IS 'Változtatás típusa';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TIME_STAMP" IS 'Idõpecsét';
 
   COMMENT ON TABLE "ADMIN_CHG_LOG"  IS 'Adminisztrációs változáskezelési tábla
Code: CLOG';
