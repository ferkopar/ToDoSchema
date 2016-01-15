--------------------------------------------------------
--  DDL for Table PRT_TREATM_REL
--------------------------------------------------------

  CREATE TABLE "PRT_TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_REL_ID" IS 'Kezelés tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID1" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID2" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_TREATM_REL"  IS 'Kezelések (beavatkozások) Relációja
Code: PRTR';
