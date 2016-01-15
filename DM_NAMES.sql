--------------------------------------------------------
--  DDL for Table DM_NAMES
--------------------------------------------------------

  CREATE TABLE "DM_NAMES" 
   (	"NAMES_ID" NUMBER(12,0), 
	"PNAMES" VARCHAR2(50), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"SEX" VARCHAR2(1), 
	"TAGS" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_NAMES"."NAMES_ID" IS 'Keresztnév tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."PNAMES" IS 'Keresztnév';
 
   COMMENT ON COLUMN "DM_NAMES"."LANGUAGE_ID" IS 'Nyelv egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."SEX" IS 'Neme M_férfi F_nõ I_ismeretlen';
 
   COMMENT ON COLUMN "DM_NAMES"."TAGS" IS 'Tag';
 
   COMMENT ON COLUMN "DM_NAMES"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_NAMES"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_NAMES"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_NAMES"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_NAMES"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_NAMES"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_NAMES"  IS 'Kereszt Nevek
Code: DMNA';
