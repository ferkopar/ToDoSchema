--------------------------------------------------------
--  DDL for Table TIME_TABLE
--------------------------------------------------------

  CREATE TABLE "TIME_TABLE" 
   (	"TIME_ID" NUMBER(12,0), 
	"TT_TYPE_ID" NUMBER(12,0), 
	"TT_START" DATE, 
	"TT_END" DATE, 
	"EPI_ID" NUMBER(12,0), 
	"ALERT_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "TIME_TABLE"."TIME_ID" IS 'Time egyedi azonosítója';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_TYPE_ID" IS 'Idõ ablak típusa';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_START" IS 'Idõ ablak kezdete';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_END" IS 'Idõ ablak vége';
 
   COMMENT ON COLUMN "TIME_TABLE"."EPI_ID" IS 'Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "TIME_TABLE"."ALERT_ID" IS 'Riasztás egyedi azonosítója';
 
   COMMENT ON COLUMN "TIME_TABLE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TIME_TABLE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TIME_TABLE"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "TIME_TABLE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TIME_TABLE"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "TIME_TABLE"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "TIME_TABLE"  IS 'Naptár
Code: TIMT';
