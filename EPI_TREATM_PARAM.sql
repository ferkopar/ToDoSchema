--------------------------------------------------------
--  DDL for Table EPI_TREATM_PARAM
--------------------------------------------------------

  CREATE TABLE "EPI_TREATM_PARAM" 
   (	"EPI_TREATM_PARAM_ID" NUMBER(12,0), 
	"EPI_TREAMT_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT" VARCHAR2(50), 
	"TREATM_PARAM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"W_TREATM_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "EPI_TREATM_PARAM"."EPI_TREATM_PARAM_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."EPI_TREAMT_ID" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."TREATM_PARAM_ID" IS 'Kezel�si param�teri azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."W_PARAM_TYPE" IS 'Param�ter t�pusa';
 
   COMMENT ON COLUMN "EPI_TREATM_PARAM"."W_TREATM_ID" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON TABLE "EPI_TREATM_PARAM"  IS 'Code: ETRP';
