--------------------------------------------------------
--  DDL for Table WK_TREATM_REL
--------------------------------------------------------

  CREATE TABLE "WK_TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"KOD1" VARCHAR2(100), 
	"KOD2" VARCHAR2(100), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"EXTRA_NEXT_STEP" VARCHAR2(50), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"MM_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2100.01.01','YYYY.MM.DD')), 
	"DESCRIPTION" VARCHAR2(4000), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"GO_ORDER_NO" NUMBER(4,0)
   ) ;
 

   COMMENT ON COLUMN "WK_TREATM_REL"."TREATM_REL_ID" IS 'Kezelés tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."TREATM_ID1" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."TREATM_ID2" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."REL_TYPE_ID" IS 'Mûveletterv relációk (norma-terv, tervvariáció, terv-kezelés)';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."ORDER_NO" IS 'TREATM_REL_ID-n belüli sorrend';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."TIME_START" IS 'Kezelés (tervezett, tényleges) kezdõ idõpontja (dátum, óra,perc)';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."TIME_END" IS 'Kezelés (tervezett, tényleges) záró idõpontja (dátum, óra,perc)';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."MM_ID" IS 'Kapcsolódó dokumentum';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "WK_TREATM_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "WK_TREATM_REL"  IS 'Kezelések (beavatkozások) Relációja
Code: TRTR';
