--------------------------------------------------------
--  DDL for Table TREATM_PRU
--------------------------------------------------------

  CREATE TABLE "TREATM_PRU" 
   (	"TREATM_PRU_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "TREATM_PRU"."TREATM_PRU_ID" IS 'Táblasor egyedi azonosító';
 
   COMMENT ON COLUMN "TREATM_PRU"."SUBJ_ID" IS 'Egységár tulajdonos (biztosító vagy klinika) egyedi 
azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."TYPE_ID" IS 'Ártípus (szolgáltatási ár, támogatási ár, belsõ 
elszámoló ár)';
 
   COMMENT ON COLUMN "TREATM_PRU"."PARAM_TYPE_ID" IS 'Kezelés elszámolási paramétere (elszámolási 
pont, támogatási ár, mûveletidõ)';
 
   COMMENT ON COLUMN "TREATM_PRU"."VALUE" IS 'Paraméter érték';
 
   COMMENT ON COLUMN "TREATM_PRU"."UNIT_TYPE_ID" IS 'Paraméter mértékegysége (HUF/pont, HUF/perc)';
 
   COMMENT ON COLUMN "TREATM_PRU"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TREATM_PRU"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "TREATM_PRU"."TO_DATE" IS 'Érvényesség záró idõpontja';
 
   COMMENT ON COLUMN "TREATM_PRU"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának 
egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "TREATM_PRU"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_PRU"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "TREATM_PRU"  IS 'Kezelési egységár tábla';
