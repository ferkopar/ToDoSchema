--------------------------------------------------------
--  DDL for Table EPI_PARAM
--------------------------------------------------------

  CREATE TABLE "EPI_PARAM" 
   (	"EPI_SUBJ_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"MM_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"UNIT" VARCHAR2(50), 
	"FROM_CODE" NUMBER(1,0), 
	"GIS_ID" NUMBER(12,0), 
	"W_ERROR" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "EPI_PARAM"."EPI_SUBJ_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."EPI_ID" IS 'Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "EPI_PARAM"."UNIT_TYPE_ID" IS 'Mértékegység';
 
   COMMENT ON COLUMN "EPI_PARAM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_PARAM"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "EPI_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "EPI_PARAM"."W_PARAM_TYPE" IS 'Az PARAM_TYPE_ID megnevezése ellenõrzéshez és feltöltéshez';
 
   COMMENT ON COLUMN "EPI_PARAM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."VALUE_TYPE_ID" IS 'Az érték típúsának egyedi azonosítója a DM_SUPER_TYPE táblából';
 
   COMMENT ON COLUMN "EPI_PARAM"."ORDER_NO" IS 'Rendezési sorrend azonos EPI-hez';
 
   COMMENT ON COLUMN "EPI_PARAM"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "EPI_PARAM"."FROM_CODE" IS 'Honnan érkezett az adat EPI vagy SUBJ vagy GIS';
 
   COMMENT ON COLUMN "EPI_PARAM"."GIS_ID" IS 'GIS_DATA tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_PARAM"."W_ERROR" IS 'Hibás rekord kiszüréséhez hibaüzenet';
 
   COMMENT ON TABLE "EPI_PARAM"  IS 'Subjectiv relation
Code:SUPA';
