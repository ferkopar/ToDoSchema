--------------------------------------------------------
--  DDL for Table PRT_TREATM
--------------------------------------------------------

  CREATE TABLE "PRT_TREATM" 
   (	"TREATM_ID" NUMBER(12,0), 
	"TREATM_NAME" VARCHAR2(255), 
	"PARENT_TREATM_ID" NUMBER(12,0), 
	"TREATM_CATEGORY" VARCHAR2(30), 
	"TREATM_GROUP" VARCHAR2(30), 
	"TREATM_TYPE" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"BASE_PRICE_HUF" NUMBER, 
	"BASE_PRICE_EUR" NUMBER, 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "PRT_TREATM"."TREATM_ID" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM"."TREATM_NAME" IS 'Kezel�s megnevez�se';
 
   COMMENT ON COLUMN "PRT_TREATM"."PARENT_TREATM_ID" IS 'Mandatory Traetment Id';
 
   COMMENT ON COLUMN "PRT_TREATM"."TREATM_CATEGORY" IS 'Kezel�s t�pus kategori�ja';
 
   COMMENT ON COLUMN "PRT_TREATM"."TREATM_GROUP" IS 'Kezel�s t�pus csoportja';
 
   COMMENT ON COLUMN "PRT_TREATM"."TREATM_TYPE" IS 'Kezel�s t�pusa';
 
   COMMENT ON COLUMN "PRT_TREATM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "PRT_TREATM"."BASE_PRICE_HUF" IS 'Alap �r HUF';
 
   COMMENT ON COLUMN "PRT_TREATM"."BASE_PRICE_EUR" IS 'Alap �r EUR';
 
   COMMENT ON COLUMN "PRT_TREATM"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_TREATM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "PRT_TREATM"  IS 'Kezel�s 
Code: PRTM';
