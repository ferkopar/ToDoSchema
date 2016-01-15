--------------------------------------------------------
--  DDL for Table DM_SALUTATION
--------------------------------------------------------

  CREATE TABLE "DM_SALUTATION" 
   (	"SALUTATION_ID" NUMBER(12,0), 
	"SALUTATION" VARCHAR2(30), 
	"SALUTATION2" VARCHAR2(30), 
	"SEX" VARCHAR2(1), 
	"FROM_AGE" VARCHAR2(30), 
	"TO_AGE" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION_ID" IS 'Megszólítás egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION" IS 'Megszólítás';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION2" IS 'Megszólítás';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SEX" IS 'Neme M_férfi F_nõ I_ismeretlen';
 
   COMMENT ON COLUMN "DM_SALUTATION"."FROM_AGE" IS 'Korhatár: 0-16; 16-22; 22-?';
 
   COMMENT ON COLUMN "DM_SALUTATION"."TO_AGE" IS 'Korhatár: 0-16; 16-22; 22-';
 
   COMMENT ON COLUMN "DM_SALUTATION"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_SALUTATION"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_SALUTATION"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_SALUTATION"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SALUTATION"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_SALUTATION"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SALUTATION"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_SALUTATION"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_SALUTATION"  IS 'Megszólítás
Code: DMSL';
