--------------------------------------------------------
--  DDL for Table EPI_TREATM
--------------------------------------------------------

  CREATE TABLE "EPI_TREATM" 
   (	"EPITREAT_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"TREATM_ID" NUMBER(12,0), 
	"TOOTH" VARCHAR2(30), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" DATE, 
	"CRD" TIMESTAMP (6), 
	"MDU" DATE, 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "EPI_TREATM"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM"."TREATM_ID" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM"."TOOTH" IS 'Fog';
 
   COMMENT ON COLUMN "EPI_TREATM"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "EPI_TREATM"  IS 'Esem�ny-Kezel�s Kapcsolati t�bla
Code:EPTR';
