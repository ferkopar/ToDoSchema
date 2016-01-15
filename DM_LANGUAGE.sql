--------------------------------------------------------
--  DDL for Table DM_LANGUAGE
--------------------------------------------------------

  CREATE TABLE "DM_LANGUAGE" 
   (	"LANGUAGE_ID" NUMBER(12,0), 
	"LANGUAGE_NAME" VARCHAR2(50), 
	"LANGUAGE_TYP" VARCHAR2(50) DEFAULT 'Alapnyelv', 
	"RL" VARCHAR2(1) DEFAULT 'L', 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"LANGUAGE_CODE" VARCHAR2(3), 
	"W_COUNTRY_TRICODE" VARCHAR2(3), 
	"ISO639_3" VARCHAR2(3), 
	"ISO639_2" VARCHAR2(30), 
	"ISO639_1" VARCHAR2(5), 
	"HUN_NAME" VARCHAR2(500), 
	"ENG_NAME" VARCHAR2(500), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"FLAG_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_ID" IS 'Nyelv egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_NAME" IS 'Nyelv megnevezése';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_TYP" IS 'Nyelv rendszer szerinti típusa: Alapnyelv, Egyéb nyelv';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."RL" IS 'Irás iránya';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."HUN_NAME" IS 'Magyar megnevezés';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."ENG_NAME" IS 'Angol megnevezés';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."FLAG_ID" IS 'Zászló rajz FK az MM_FILES-ra';
 
   COMMENT ON TABLE "DM_LANGUAGE"  IS 'Nyelvek típusa és megnevezése
Code: DMLA';
