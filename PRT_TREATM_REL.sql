--------------------------------------------------------
--  DDL for Table PRT_TREATM_REL
--------------------------------------------------------

  CREATE TABLE "PRT_TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_REL_ID" IS 'Kezel�s t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID1" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID2" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "PRT_TREATM_REL"  IS 'Kezel�sek (beavatkoz�sok) Rel�ci�ja
Code: PRTR';
