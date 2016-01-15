--------------------------------------------------------
--  DDL for Table TREATM
--------------------------------------------------------

  CREATE TABLE "TREATM" 
   (	"TREATM_ID" NUMBER(12,0), 
	"TREATM_NAME" VARCHAR2(255), 
	"TREATM_GROUP_ID" NUMBER(12,0), 
	"TREATM_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"TREATM_CATEGORY_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"SUBJ1_ID" NUMBER(12,0), 
	"TYPE1_ID" NUMBER(12,0), 
	"SUBJ2_ID" NUMBER(12,0), 
	"TYPE2_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(4000), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2099.12.31','YYYY.MM.DD')), 
	"TREATM_NAME_ID" NUMBER(12,0), 
	"DOMAIN_ID" NUMBER(12,2)
   ) ;
 

   COMMENT ON COLUMN "TREATM"."TREATM_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."TREATM_NAME" IS 'Kezelés megnevezése';
 
   COMMENT ON COLUMN "TREATM"."TREATM_GROUP_ID" IS 'Mandatory Traetment Id';
 
   COMMENT ON COLUMN "TREATM"."TREATM_TYPE_ID" IS 'Mûvelet típusa';
 
   COMMENT ON COLUMN "TREATM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."TREATM_CATEGORY_ID" IS 'A mûvelet,	anatómiai testrész besorolásának egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."TIME_START" IS 'A mûvelet, kezelés (tervezett, tényleges) kezdõ idõpontja (dátum, óra, perc)';
 
   COMMENT ON COLUMN "TREATM"."TIME_END" IS 'A mûvelet,	kezelés (tervezett, tényleges) záró idõpontja (dátum, óra, perc)';
 
   COMMENT ON COLUMN "TREATM"."SUBJ1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "TREATM"."TYPE1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "TREATM"."SUBJ2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "TREATM"."TYPE2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "TREATM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TREATM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "TREATM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "TREATM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON TABLE "TREATM"  IS 'Kezelés 
Code: TRTM';
