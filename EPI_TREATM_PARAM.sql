--------------------------------------------------------
--  DDL for Table EPI_TREATM_PARAM
--------------------------------------------------------

  CREATE TABLE "EPI_TREATM_PARAM" 
   (	"EPI_TREATM_PARAM_ID" NUMBER(12,0), 
	"EPI_TREAMT_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT" VARCHAR2(50), 
	"TREATM_PARAM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"W_TREATM_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "EPI_TREATM_PARAM"."EPI_TREATM_PARAM_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."EPI_TREAMT_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."TREATM_PARAM_ID" IS 'Kezelési paraméteri azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."W_PARAM_TYPE" IS 'Paraméter típusa';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."W_TREATM_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON TABLE "EPI_TREATM_PARAM"  IS 'Code: ETRP';
