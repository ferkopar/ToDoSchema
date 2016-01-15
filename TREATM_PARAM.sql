--------------------------------------------------------
--  DDL for Table TREATM_PARAM
--------------------------------------------------------

  CREATE TABLE "TREATM_PARAM" 
   (	"TREATM_PARAM_ID" NUMBER(12,0), 
	"TREATM_PARAM1_ID" NUMBER(12,0), 
	"TREATM_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0) DEFAULT 0, 
	"SUBJ_ID" NUMBER(12,0), 
	"SUBJ_TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"MM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(4000), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31','YYYY.MM.DD'), 
	"UNIT" VARCHAR2(50), 
	"FIELD_TYPE_ID" NUMBER(12,0), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_PARAM_ID" IS 'Kezelési paraméterinek egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_PARAM1_ID" IS 'Kapcsolodó treatment param sor (norma, terv- HIVOTT) ';
 
   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_ID" IS 'A kapcsolodó Kezelési egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."EPI_ID" IS 'A kapcsolodó esemény azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."SUBJ_ID" IS 'Művelet, norma kiadó vagy a kezelésben résztvevő dolgozó egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."SUBJ_TYPE_ID" IS 'Művelet, norma kiadó típusa, vagy a kezelésben résztvevő dolgozó beosztása, szakképzettsége';
 
   COMMENT ON COLUMN "TREATM_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."VALUE" IS 'A megadott paraméter értéke';
 
   COMMENT ON COLUMN "TREATM_PARAM"."UNIT_TYPE_ID" IS 'A megadott paraméter mértékegysége';
 
   COMMENT ON COLUMN "TREATM_PARAM"."VALUE_TYPE_ID" IS 'Paraméter érték listából';
 
   COMMENT ON COLUMN "TREATM_PARAM"."ORDER_NO" IS 'A rendezés szerinti sorszáma';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TREATM_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "TREATM_PARAM"  IS 'Code: TRPA';
