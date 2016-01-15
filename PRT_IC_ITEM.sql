--------------------------------------------------------
--  DDL for Table PRT_IC_ITEM
--------------------------------------------------------

  CREATE TABLE "PRT_IC_ITEM" 
   (	"IC_ITEM_ID" NUMBER(12,0), 
	"IC_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"IC_VALUE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"IC_VALUE_TYPE" VARCHAR2(50), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ITEM_ID" IS 'Interface tétel egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ID" IS 'Interface tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."ORDER_NO" IS 'Rendezési sorrend
DM_Regulation.Type_Table1 ';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE_TYPE" IS 'Érték mértékegysége';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_IC_ITEM"  IS 'Bejövõ adat törzs értékei
Code: PICI';
