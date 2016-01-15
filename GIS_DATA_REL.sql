--------------------------------------------------------
--  DDL for Table GIS_DATA_REL
--------------------------------------------------------

  CREATE TABLE "GIS_DATA_REL" 
   (	"GIS_REL_ID" NUMBER(12,0), 
	"GIS_ID1" NUMBER(12,0), 
	"GIS_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_REL_ID" IS 'Térinformatika objektum relációjának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID1" IS 'Hivatkozott Térinformatikai objektum egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID2" IS 'Hivatkozó Térinformatikai objektum egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "GIS_DATA_REL"  IS 'Code: GDRE';
