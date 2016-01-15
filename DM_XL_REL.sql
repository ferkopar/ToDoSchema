--------------------------------------------------------
--  DDL for Table DM_XL_REL
--------------------------------------------------------

  CREATE TABLE "DM_XL_REL" 
   (	"DM_XL_REL_ID" NUMBER(12,0), 
	"DM_XL_ID1" NUMBER(12,0), 
	"DM_XL_ID2" NUMBER(12,0), 
	"DM_XL_ID3" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"MATHOP" VARCHAR2(50), 
	"CONNUM" NUMBER(12,2) DEFAULT 1, 
	"ORDER_NO" NUMBER(2,0), 
	"W_REL_TYPE_NAME" VARCHAR2(50), 
	"W_ORDER_NO1" NUMBER(4,0), 
	"W_ORDER_NO2" NUMBER(4,0), 
	"W_ORDER_REG" VARCHAR2(50), 
	"W_ORDER_NO3" NUMBER(4,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_REL_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID1" IS 'Elsõ operandus';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID2" IS 'Második operndus';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID3" IS 'Az eredmény azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "DM_XL_REL"."MATHOP" IS 'Matematikai operátor';
 
   COMMENT ON COLUMN "DM_XL_REL"."CONNUM" IS 'A szorzó szám értéke (alapértelmezetten 1)';
 
   COMMENT ON COLUMN "DM_XL_REL"."ORDER_NO" IS 'Sorrend';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_REL_TYPE_NAME" IS 'A reláció megnevezése szövegesen';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO1" IS 'Az ID1 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO2" IS 'Az ID2 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_REG" IS 'Az összegzés (számolás) menete';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO3" IS 'Az ID3 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."FROM_DATE" IS 'Érvényesség kezdõ idõpontja';
 
   COMMENT ON COLUMN "DM_XL_REL"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_XL_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON TABLE "DM_XL_REL"  IS 'A betöltési szabályok relációs, mûveleti szabályok relációja';
