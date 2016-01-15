--------------------------------------------------------
--  DDL for Table ADMIN_AVC_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_AVC_LOG" 
   (	"AVC_LOG_ID" NUMBER(12,0), 
	"SCH_NAME" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"ROWS_NUM" NUMBER(12,0), 
	"MAX_CRD" DATE, 
	"MAX_TABLE_ID" NUMBER(12,0), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_AVC_LOG"."AVC_LOG_ID" IS 'Adminisztrativ Statisztikai tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."SCH_NAME" IS 'Feldolgozott Schéma neve';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."TABLE_NAME" IS 'Tábla neve';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."ROWS_NUM" IS 'Sorok száma a táblában';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."MAX_CRD" IS 'A tábla utosó beszürt rekordjának az ideje';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."MAX_TABLE_ID" IS 'A tábla legnagyobb egyedi azonosítója';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."TIME_STAMP" IS 'Idõpecsét';
 
   COMMENT ON TABLE "ADMIN_AVC_LOG"  IS 'Adminisztrációs statisztikai tábla
Code: ALOG';
