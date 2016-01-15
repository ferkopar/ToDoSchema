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
 

   COMMENT ON COLUMN "EPI_REL"."EPI_REL_ID" IS 'Esemény reláció egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID1" IS 'Hivatkozó Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID2" IS 'Hivatkozott Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "EPI_REL"."ORDER_NO" IS 'Rendezési sorrend';
 
   COMMENT ON COLUMN "EPI_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_REL"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "EPI_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "EPI_REL"  IS 'Események reláció táblája
Code: EPRE';
