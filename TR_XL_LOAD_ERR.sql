--------------------------------------------------------
--  DDL for Table TR_XL_LOAD_ERR
--------------------------------------------------------

  CREATE TABLE "TR_XL_LOAD_ERR" 
   (	"TR_XL_ID" NUMBER(12,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"PARAM_STATUS_TYPE_ID" NUMBER(12,0), 
	"PARAM_DATE" VARCHAR2(255), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE_ERR" VARCHAR2(4000), 
	"PARAM_UNIT" VARCHAR2(50), 
	"SUBJ_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"DESCRIPTION" VARCHAR2(4000), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CONTROL_COL_VALUE" NUMBER(15,2)
   ) ;
 

   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."TR_XL_ID" IS 'Az adatbetöltési rekord egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."LIST_TYPE_ID" IS 'A lista tipus egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_DATE" IS 'A vizsgált idõszak';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_VALUE_ERR" IS 'Paraméter hibás értéke ';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_UNIT" IS 'A megadott, beolvasott érték mértékegysége';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."COLUMN_NO" IS 'Az excell file melyik oszlopából jött az érték';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_VALUE" IS 'A beolvasott adat paraméterének helyessen számított értéke';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DATA_INCO_ID" IS 'A beérkezés egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_COL_VALUE" IS 'Az oszlopok számított kontroll-számított értéke';
