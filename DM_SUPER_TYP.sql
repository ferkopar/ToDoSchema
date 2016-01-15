--------------------------------------------------------
--  DDL for Table DM_SUPER_TYP
--------------------------------------------------------

  CREATE TABLE "DM_SUPER_TYP" 
   (	"SUPER_TYP_ID" NUMBER(12,0), 
	"GROUP_ID" NUMBER(12,0), 
	"GROUND_LEVEL_ID" NUMBER(12,0), 
	"SUPER_TYPE_NAME" VARCHAR2(255), 
	"SUPER_TYPE_SHORT_NAME" VARCHAR2(50), 
	"SUPER_GROUP_NAME" VARCHAR2(255), 
	"SLEVEL" NUMBER(3,0), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0, 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"WIRED_TO" NVARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"USE_COMMENT" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"WK_CLASS_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYP_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUP_ID" IS 'A típus csoportjának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUND_LEVEL_ID" IS 'A csoporton belüli szint';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_NAME" IS 'A típus megnevezése';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_SHORT_NAME" IS 'A típus rövid neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_GROUP_NAME" IS 'A típus besorolási csoportjának a neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SLEVEL" IS 'A meghatározó  típusának hierarciai szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."ROLL_TYPE" IS 'A felvivõ szerepkör szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."FROM_DATE" IS 'Az adatok érvényességének kezdete';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."TO_DATE" IS 'Az adatok érvényességének vége';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."USE_COMMENT" IS 'Karbantartási jogosultság szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "DM_SUPER_TYP"  IS 'A rendszer müködési típusainak reláció táblája (Table code: DSRT)';
