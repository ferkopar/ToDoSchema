--------------------------------------------------------
--  DDL for Table EPI
--------------------------------------------------------

  CREATE TABLE "EPI" 
   (	"EPI_ID" NUMBER(12,0), 
	"EPI_NAME" VARCHAR2(100), 
	"EPI_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"EPI_VALUE" NUMBER, 
	"EPI_UNIT_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CLASS_TYPE" VARCHAR2(50), 
	"CLASS_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_EPI_TYPE" VARCHAR2(30) DEFAULT 'Beteg felvétel', 
	"W_STATUS_TYPE" VARCHAR2(30) DEFAULT 'Aktív', 
	"W_ERROR" VARCHAR2(255), 
	"VALUE_TYPE_ID" NUMBER(12,0) DEFAULT null, 
	"UNIT" VARCHAR2(50)
   ) ;
 

   COMMENT ON COLUMN "EPI"."EPI_ID" IS 'Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."EPI_NAME" IS 'Esemény neve';
 
   COMMENT ON COLUMN "EPI"."EPI_TYPE_ID" IS 'Esemény típus nevének egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."EPI_VALUE" IS 'Aktuális érték';
 
   COMMENT ON COLUMN "EPI"."EPI_UNIT_TYPE_ID" IS 'Mértékegyég';
 
   COMMENT ON COLUMN "EPI"."ORDER_NO" IS 'Rendezési sorrend';
 
   COMMENT ON COLUMN "EPI"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI"."CLASS_TYPE" IS 'Besorolás neve';
 
   COMMENT ON COLUMN "EPI"."CLASS_ID" IS 'Besorolás egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "EPI"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "EPI"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "EPI"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "EPI"."UNIT" IS 'Aktuális érték mértékegysége';
 
   COMMENT ON TABLE "EPI"  IS 'Események
Code: EPIS';
