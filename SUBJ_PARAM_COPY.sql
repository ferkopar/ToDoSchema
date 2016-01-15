--------------------------------------------------------
--  DDL for Table SUBJ_PARAM_COPY
--------------------------------------------------------

  CREATE TABLE "SUBJ_PARAM_COPY" 
   (	"SUBJ_PARAM_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"MM_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"UNIT" VARCHAR2(50), 
	"GIS_ID" NUMBER(12,0), 
	"SUBJ_TYPE_ID" NUMBER(10,0), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"GROUP_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."SUBJ_PARAM_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."UNIT_TYPE_ID" IS 'Mértékegység';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."VALUE_TYPE_ID" IS 'Az érték típúsának egyedi azonosítója a DM_SUPER_TYPE táblából';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."ORDER_NO" IS 'Rendezési sorrend azonos EPI-hez';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."GIS_ID" IS 'GIS_DATA tábla egyedi azonosítója';
 
   COMMENT ON TABLE "SUBJ_PARAM_COPY"  IS 'Subjectiv relation
Code:SUPA';
