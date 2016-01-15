--------------------------------------------------------
--  DDL for Table DM_ANALYSIS_TYP
--------------------------------------------------------

  CREATE TABLE "DM_ANALYSIS_TYP" 
   (	"ANALYSIS_TYPE_ID" NUMBER(12,0), 
	"ANALYSIS_TYPE_NAME" VARCHAR2(50), 
	"ANALYSIS_GROUP_ID" NUMBER(12,0), 
	"SLEVEL" NUMBER(3,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"SOPTIONAL" VARCHAR2(1) DEFAULT 'Y', 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_TYPE_ID" IS 'Mérés típus egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_TYPE_NAME" IS 'Mérés típusának neve';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_GROUP_ID" IS 'Mérés típus csoportja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."SLEVEL" IS 'Mérés típusának hierarciai szintje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."SOPTIONAL" IS 'Választhatóság Y-Igen N-Nem O-Opcionális';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ANALYSIS_TYP"  IS 'Mérési típusok
Code: DMAN';
