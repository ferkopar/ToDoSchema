--------------------------------------------------------
--  DDL for Table DM_ROLE_RIGHT
--------------------------------------------------------

  CREATE TABLE "DM_ROLE_RIGHT" 
   (	"ROLE_RIGHT_ID" NUMBER(12,0), 
	"RIGHT_TYPE_ID" NUMBER(12,0), 
	"ROLE_ID" NUMBER(12,0), 
	"APEX_PAGE" NUMBER(10,0), 
	"APEX_VARIABLE" VARCHAR2(255 CHAR), 
	"FIELD_ID" NUMBER(12,0), 
	"TCRITERION" VARCHAR2(4000), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "DM_ROLE_RIGHT"."ROLE_RIGHT_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."RIGHT_TYPE_ID" IS 'A jogosultság típusa SUPER_TYPE_ID';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."ROLE_ID" IS 'A kapcsolodó szabály egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."APEX_PAGE" IS 'Apex oldal';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."APEX_VARIABLE" IS 'APEX változó értékének visszaadása';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."FIELD_ID" IS 'Mezõ SUPER_TYPE_ID-je';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."TCRITERION" IS 'Kritérium, szabály leírása';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "DM_ROLE_RIGHT"  IS 'Szabály szerepkörök táblája';
