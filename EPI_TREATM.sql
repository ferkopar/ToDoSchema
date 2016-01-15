--------------------------------------------------------
--  DDL for Table EPI_TREATM
--------------------------------------------------------

  CREATE TABLE "EPI_TREATM" 
   (	"EPITREAT_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"TREATM_ID" NUMBER(12,0), 
	"TOOTH" VARCHAR2(30), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" DATE, 
	"CRD" TIMESTAMP (6), 
	"MDU" DATE, 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "EPI_TREATM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."TREATM_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."TOOTH" IS 'Fog';
 
   COMMENT ON COLUMN "EPI_TREATM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "EPI_TREATM"  IS 'Esemény-Kezelés Kapcsolati tábla
Code:EPTR';
