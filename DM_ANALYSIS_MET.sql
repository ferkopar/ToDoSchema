--------------------------------------------------------
--  DDL for Table DM_ANALYSIS_MET
--------------------------------------------------------

  CREATE TABLE "DM_ANALYSIS_MET" 
   (	"ANALYSIS_MET_ID" NUMBER(12,0), 
	"ANALYSIS_MET_NAME" VARCHAR2(50), 
	"ANALYSIS_GROUP_ID" NUMBER(12,0), 
	"SLEVEL" NUMBER(3,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"SOPTIONAL" VARCHAR2(1) DEFAULT 'Y', 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_MET_ID" IS 'M�r�s t�pus egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_MET_NAME" IS 'M�r�s t�pus�nak neve';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."ANALYSIS_GROUP_ID" IS 'M�r�s t�pus csoportja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."SLEVEL" IS 'M�r�s t�pus�nak hierarciai szintje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."SOPTIONAL" IS 'V�laszthat�s�g Y-Igen N-Nem O-Opcion�lis';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_MET"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_ANALYSIS_MET"  IS 'M�r�si t�pusok methodusok
Code: DMAN';
