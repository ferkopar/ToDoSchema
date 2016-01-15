--------------------------------------------------------
--  DDL for Table DM_ANALYSIS_MET
--------------------------------------------------------

  CREATE TABLE "DM_ANALYSIS_MET" 
   (	"ANALYSIS_MET_ID" NUMBER(12,0), 
	"ANALYSIS_MET_NAME" VARCHAR2(50), 
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
 

   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_MET_ID" IS 'Mérés típus egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_MET_NAME" IS 'Mérés típusának neve';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_GROUP_ID" IS 'Mérés típus csoportja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."SLEVEL" IS 'Mérés típusának hierarciai szintje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."SOPTIONAL" IS 'Választhatóság Y-Igen N-Nem O-Opcionális';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ANALYSIS_MET"  IS 'Mérési típusok methodusok
Code: DMAN';
