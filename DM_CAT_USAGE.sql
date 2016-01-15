--------------------------------------------------------
--  DDL for Table DM_CAT_USAGE
--------------------------------------------------------

  CREATE TABLE "DM_CAT_USAGE" 
   (	"CAT_USAGE_ID" NUMBER(12,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"TABLE_COLUMN" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"CAT_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_CAT_USAGE"."CAT_USAGE_ID" IS 'Besorol�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."TABLE_COLUMN" IS 'T�bla oszlop�nak neve';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."CAT_TYPE_ID" IS 'Besorol�s t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CAT_USAGE"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_CAT_USAGE"  IS 'Category Domain 
Code: DMCU';
