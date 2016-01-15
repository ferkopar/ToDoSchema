--------------------------------------------------------
--  DDL for Table TIME_TABLE
--------------------------------------------------------

  CREATE TABLE "TIME_TABLE" 
   (	"TIME_ID" NUMBER(12,0), 
	"TT_TYPE_ID" NUMBER(12,0), 
	"TT_START" DATE, 
	"TT_END" DATE, 
	"EPI_ID" NUMBER(12,0), 
	"ALERT_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "TIME_TABLE"."TIME_ID" IS 'Time egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_TYPE_ID" IS 'Id� ablak t�pusa';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_START" IS 'Id� ablak kezdete';
 
   COMMENT ON COLUMN "TIME_TABLE"."TT_END" IS 'Id� ablak v�ge';
 
   COMMENT ON COLUMN "TIME_TABLE"."EPI_ID" IS 'Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TIME_TABLE"."ALERT_ID" IS 'Riaszt�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TIME_TABLE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TIME_TABLE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TIME_TABLE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TIME_TABLE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TIME_TABLE"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "TIME_TABLE"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "TIME_TABLE"  IS 'Napt�r
Code: TIMT';
