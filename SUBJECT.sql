--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUBJ_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRD" TIMESTAMP (6), 
	"CRU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0, 
	"SUBJ_CATEGORY_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "SUBJECT"."SUBJ_ID" IS 'Subjectiv tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "SUBJECT"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "SUBJECT"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJECT"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "SUBJECT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "SUBJECT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON TABLE "SUBJECT"  IS 'Az alanyok (hivatalok) nyilvántartási és hivatkozási táblája (Table code: SUB)';
