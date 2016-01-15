--------------------------------------------------------
--  DDL for Table GIS_REL_PARAM
--------------------------------------------------------

  CREATE TABLE "GIS_REL_PARAM" 
   (	"GIS_REL_PARAM_ID" NUMBER(12,0), 
	"GIS_REL_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT" VARCHAR2(50), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "GIS_REL_PARAM"."GIS_REL_PARAM_ID" IS 'Térinformatika objektum paraméter relációjának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."GIS_REL_ID" IS 'Térinformatika objektum relációjának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."W_PARAM_TYPE" IS 'Paraméter típusa';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "GIS_REL_PARAM"  IS 'Code: GRPM';
