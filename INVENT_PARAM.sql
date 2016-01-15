--------------------------------------------------------
--  DDL for Table INVENT_PARAM
--------------------------------------------------------

  CREATE TABLE "INVENT_PARAM" 
   (	"INVENT_PARAM_ID" NUMBER(12,0), 
	"INVENT_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(255), 
	"EPI_ID" NUMBER(12,0), 
	"SUBJ1_ID" NUMBER(12,0), 
	"SUBJ2_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"UNIT_TYPE_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "INVENT_PARAM"."INVENT_PARAM_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."INVENT_ID" IS 'Anyag eszköz leltár készltet egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "INVENT_PARAM"."UNIT" IS 'Készlet Mértékegysége';
 
   COMMENT ON COLUMN "INVENT_PARAM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "INVENT_PARAM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "INVENT_PARAM"."W_PARAM_TYPE" IS 'Paraméter típusa';
 
   COMMENT ON COLUMN "INVENT_PARAM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT_PARAM"."SUBJ1_ID" IS 'Az átadó';
 
   COMMENT ON COLUMN "INVENT_PARAM"."SUBJ2_ID" IS 'Az átvevõ';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON TABLE "INVENT_PARAM"  IS 'Leltár készlet paraméterei
Code:EINP';
