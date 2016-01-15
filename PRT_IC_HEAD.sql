--------------------------------------------------------
--  DDL for Table PRT_IC_HEAD
--------------------------------------------------------

  CREATE TABLE "PRT_IC_HEAD" 
   (	"IC_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"IC_SOURCE" VARCHAR2(100), 
	"IC_TIMESTAMP" TIMESTAMP (6), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"SUBJ_ID" NUMBER(12,0), 
	"IC_EPI_ID" NUMBER(12,0), 
	"IC_TYPE_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_ID" IS 'Interface egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_SOURCE" IS 'Interface neve (pld. Facebook, HomnePage) 
DM_Regulation.Regulation_Name';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_TIMESTAMP" IS 'Interface bejövõ adat idõpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_TYPE_ID" IS 'Interface tipusának egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_IC_HEAD"  IS 'Bejövõ adat fej
Code: PICH';
