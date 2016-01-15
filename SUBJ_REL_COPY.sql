--------------------------------------------------------
--  DDL for Table SUBJ_REL_COPY
--------------------------------------------------------

  CREATE TABLE "SUBJ_REL_COPY" 
   (	"SUBJ_REL_ID" NUMBER(12,0), 
	"SUBJ_ID1" NUMBER(12,0), 
	"SUBJ_ID2" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_REL_TYPE" VARCHAR2(30), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_REL_ID" IS 'Subjectiv reláció tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_ID1" IS 'Subjectiv reláció Chield azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_ID2" IS 'Subjectiv reláció Parent azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."STATUS_ID" IS 'FAz adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "SUBJ_REL_COPY"  IS 'Subjectiv relation
Code:SURE';
