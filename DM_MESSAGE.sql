--------------------------------------------------------
--  DDL for Table DM_MESSAGE
--------------------------------------------------------

  CREATE TABLE "DM_MESSAGE" 
   (	"MESSAGE_ID" NUMBER(12,0), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"MESSAGE_TEXT" VARCHAR2(255), 
	"MESSAGE_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE1" NUMBER(4,0), 
	"PARAM_TYPE1" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_ID" IS 'Üzenet egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_MESSAGE"."LANGUAGE_ID" IS 'Nyelv egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_TEXT" IS 'Üzenet szövege';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_TYPE_ID" IS 'Üzenet típusa';
 
   COMMENT ON COLUMN "DM_MESSAGE"."PARAM_VALUE1" IS 'Paraméter értéke';
 
   COMMENT ON COLUMN "DM_MESSAGE"."PARAM_TYPE1" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "DM_MESSAGE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_MESSAGE"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_MESSAGE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_MESSAGE"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_MESSAGE"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_MESSAGE"  IS 'Küldendõ szabvány üzenetek
Code: DMMG';
