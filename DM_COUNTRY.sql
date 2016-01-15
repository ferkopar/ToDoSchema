--------------------------------------------------------
--  DDL for Table DM_COUNTRY
--------------------------------------------------------

  CREATE TABLE "DM_COUNTRY" 
   (	"COUNTRY_ID" NUMBER(12,0), 
	"COUNTRY_NAME" VARCHAR2(100), 
	"COUNTRY_TRICODE" VARCHAR2(3), 
	"COUNTRY_DUOCODE" VARCHAR2(2), 
	"TELEPHONE" VARCHAR2(10), 
	"CURRENCY_CODE" VARCHAR2(3), 
	"CURRENCY_NAME" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STAT_TYPE_ID" NUMBER(12,0) DEFAULT NULL, 
	"MM_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_ID" IS 'Country tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_NAME" IS 'Ország neve';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_TRICODE" IS 'Ország háromtbetûs kódja ISO3166-1 alpha-3';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_DUOCODE" IS 'Ország kétbetûs kódja ISO3166-1 alpha-2';
 
   COMMENT ON COLUMN "DM_COUNTRY"."TELEPHONE" IS 'Ország hívõszáma';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CURRENCY_CODE" IS 'Valuta nemzetközi hárombetûs kódja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CURRENCY_NAME" IS 'Pénznem neve';
 
   COMMENT ON COLUMN "DM_COUNTRY"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_COUNTRY"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_COUNTRY"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_COUNTRY"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_COUNTRY"."STAT_TYPE_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_COUNTRY"  IS 'Országok
Code: DMCO';
