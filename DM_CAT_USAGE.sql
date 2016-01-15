--------------------------------------------------------
--  DDL for Table DM_CAT_USAGE
--------------------------------------------------------

  CREATE TABLE "DM_CAT_USAGE" 
   (	"CAT_USAGE_ID" NUMBER(12,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"TABLE_COLUMN" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"CAT_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_CAT_USAGE"."CAT_USAGE_ID" IS 'Besorolás egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."TABLE_NAME" IS 'Tábla neve';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."TABLE_COLUMN" IS 'Tábla oszlopának neve';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CAT_TYPE_ID" IS 'Besorolás típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_CAT_USAGE"  IS 'Category Domain 
Code: DMCU';
