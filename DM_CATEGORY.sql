--------------------------------------------------------
--  DDL for Table DM_CATEGORY
--------------------------------------------------------

  CREATE TABLE "DM_CATEGORY" 
   (	"CAT_ID" NUMBER(12,0), 
	"CAT_TYPE" VARCHAR2(30), 
	"TYPE_ID" NUMBER(12,0), 
	"TYPE_NAME" VARCHAR2(30), 
	"APEX_VARIABLE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_CATEGORY"."CAT_ID" IS 'Az besorolási kategória tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CAT_TYPE" IS 'A besorolási kategória megnevezése';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_ID" IS 'Az besorolási kategória tipusának az egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_NAME" IS 'Az besorolási kategória tipusának a neve';
 
   COMMENT ON COLUMN "DM_CATEGORY"."APEX_VARIABLE" IS 'APEX változó értékének visszaadása';
 
   COMMENT ON COLUMN "DM_CATEGORY"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_CATEGORY"."FROM_DATE" IS 'Az adatok érvényességének kezdete';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TO_DATE" IS 'Az adatok érvényességének vége';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_CATEGORY"  IS 'Categoriák típustáblája';
