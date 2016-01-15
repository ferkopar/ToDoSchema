--------------------------------------------------------
--  DDL for Table GIS_SUBJ_EPI_REL
--------------------------------------------------------

  CREATE TABLE "GIS_SUBJ_EPI_REL" 
   (	"REL_ID" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"GIS_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_REL_TYPE" VARCHAR2(30), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."REL_ID" IS 'Reláció egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."GIS_ID" IS 'Térinformatika egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "GIS_SUBJ_EPI_REL"  IS 'Code:GSER';
