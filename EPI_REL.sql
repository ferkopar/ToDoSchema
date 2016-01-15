--------------------------------------------------------
--  DDL for Table EPI_REL
--------------------------------------------------------

  CREATE TABLE "EPI_REL" 
   (	"EPI_REL_ID" NUMBER(12,0), 
	"EPI_ID1" NUMBER(12,0), 
	"EPI_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "EPI_REL"."EPI_REL_ID" IS 'Esem�ny rel�ci� egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID1" IS 'Hivatkoz� Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID2" IS 'Hivatkozott Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "EPI_REL"."ORDER_NO" IS 'Rendez�si sorrend';
 
   COMMENT ON COLUMN "EPI_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "EPI_REL"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "EPI_REL"  IS 'Esem�nyek rel�ci� t�bl�ja
Code: EPRE';
