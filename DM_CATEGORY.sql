--------------------------------------------------------
--  DDL for Table DM_CATEGORY
--------------------------------------------------------

  CREATE TABLE "DM_CATEGORY" 
   (	"CAT_ID" NUMBER(12,0), 
	"CAT_TYPE" VARCHAR2(30), 
	"TYPE_ID" NUMBER(12,0), 
	"TYPE_NAME" VARCHAR2(30), 
	"APEX_VARIABLE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_CATEGORY"."CAT_ID" IS 'Az besorol�si kateg�ria t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CAT_TYPE" IS 'A besorol�si kateg�ria megnevez�se';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_ID" IS 'Az besorol�si kateg�ria tipus�nak az egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_NAME" IS 'Az besorol�si kateg�ria tipus�nak a neve';
 
   COMMENT ON COLUMN "DM_CATEGORY"."APEX_VARIABLE" IS 'APEX v�ltoz� �rt�k�nek visszaad�sa';
 
   COMMENT ON COLUMN "DM_CATEGORY"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_CATEGORY"."FROM_DATE" IS 'Az adatok �rv�nyess�g�nek kezdete';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TO_DATE" IS 'Az adatok �rv�nyess�g�nek v�ge';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_CATEGORY"  IS 'Categori�k t�pust�bl�ja';
