--------------------------------------------------------
--  DDL for Table GIS_DATA_REL
--------------------------------------------------------

  CREATE TABLE "GIS_DATA_REL" 
   (	"GIS_REL_ID" NUMBER(12,0), 
	"GIS_ID1" NUMBER(12,0), 
	"GIS_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_REL_ID" IS 'T�rinformatika objektum rel�ci�j�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID1" IS 'Hivatkozott T�rinformatikai objektum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID2" IS 'Hivatkoz� T�rinformatikai objektum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "GIS_DATA_REL"  IS 'Code: GDRE';
