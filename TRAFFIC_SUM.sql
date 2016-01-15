--------------------------------------------------------
--  DDL for Table TRAFFIC_SUM
--------------------------------------------------------

  CREATE TABLE "TRAFFIC_SUM" 
   (	"TRAFFIC_SUM_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_DATE_ID" NUMBER(12,0), 
	"PARAM_VALUE" VARCHAR2(255), 
	"PARAM_UNIT_ID" NUMBER(12,0), 
	"PARAM_UNIT" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRD" TIMESTAMP (6), 
	"CRU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"SOURCE_TYPE_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"ORIGINAL_VALUE" NUMBER(15,2), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"ORDER_NO" NUMBER(4,0), 
	"CONTROL_COL_VALUE" NUMBER(15,2), 
	"PARAM_DATE_TYPE_ID" NUMBER(12,0), 
	"PARAM_ADATE_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_DATE_TYPE_NAME" VARCHAR2(30), 
	"W_PARAM_ADATE_TYPE_NAME" VARCHAR2(30), 
	"PARAM_FDATE" DATE, 
	"PARAM_TDATE" DATE
   ) ;
 

   COMMENT ON COLUMN "TRAFFIC_SUM"."TRAFFIC_SUM_ID" IS 'A tábla egyyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."SUBJ_ID" IS 'A szervezet egyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_TYPE_ID" IS 'A paraméter típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_DATE_ID" IS 'A a beolvasott adat paraméter vonatkozási idõszaka';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_VALUE" IS 'A beolvasott adat paraméter értéke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_UNIT_ID" IS 'A beolvasott adat paraméter mértékegységének IDja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_UNIT" IS 'A beolvasott adat paraméter mértékegysége';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."SOURCE_TYPE_ID" IS 'Excell fileból, vagy fõkönyvi számlákból jött-e a sor';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."COLUMN_NO" IS 'Az excell file melyik oszlopából jött az érték';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."LIST_TYPE_ID" IS 'A feltöltött adat melyik excel sheet azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."DATA_INCO_ID" IS 'A beérkezés egyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."STATUS_ID" IS 'A beolvasott adat paraméter státuszának azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."ORIGINAL_VALUE" IS 'Az adatsor eredeti küldött értéke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CONTROL_VALUE" IS 'A beolvasott adat paraméterének helyessen számított értéke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."ORDER_NO" IS 'A kérdések sorrendje a kérdõívben';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CONTROL_COL_VALUE" IS 'Az oszlopok számított kontroll-számított értéke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_DATE_TYPE_ID" IS 'Az adatra vonatkokzó idõszak típusának 
egyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_ADATE_TYPE_ID" IS 'Az adatra vonatkokzó idõszak típusa 
vonatkozási jelzõjének egyedi azonosítója';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."W_PARAM_DATE_TYPE_NAME" IS 'Az adatra vonatkokzó idõszak 
típusának neve';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."W_PARAM_ADATE_TYPE_NAME" IS 'Az adatra vonatkokzó idõszak 
típusának vonatkozási jelzõje';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_FDATE" IS 'Az oszlop  idõintervallum kezdete';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_TDATE" IS 'Az oszlop  idõintervallum vége';
 
   COMMENT ON TABLE "TRAFFIC_SUM"  IS 'A tranzakciók táblája (Table code: TRF)';
