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
 

   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_ID" IS 'Interface egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_SOURCE" IS 'Interface neve (pld. Facebook, HomnePage) 
DM_Regulation.Regulation_Name';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_TIMESTAMP" IS 'Interface bej�v� adat id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_HEAD"."IC_TYPE_ID" IS 'Interface tipus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "PRT_IC_HEAD"  IS 'Bej�v� adat fej
Code: PICH';
