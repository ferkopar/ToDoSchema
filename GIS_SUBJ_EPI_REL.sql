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
 

   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."REL_ID" IS 'Rel�ci� egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."GIS_ID" IS 'T�rinformatika egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_SUBJ_EPI_REL"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "GIS_SUBJ_EPI_REL"  IS 'Code:GSER';
