--------------------------------------------------------
--  DDL for Table DM_ROLE
--------------------------------------------------------

  CREATE TABLE "DM_ROLE" 
   (	"ROLE_ID" NUMBER(12,0), 
	"ROLE_NAME" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_ROLE"."ROLE_ID" IS 'Szerepkör azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE"."ROLE_NAME" IS 'Szerepkör neve';
 
   COMMENT ON COLUMN "DM_ROLE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ROLE"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_ROLE"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ROLE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ROLE"  IS 'Szabály
Code: DMRO';
