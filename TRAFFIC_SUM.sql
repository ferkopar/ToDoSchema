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
 

   COMMENT ON COLUMN "TRAFFIC_SUM"."TRAFFIC_SUM_ID" IS 'A t�bla egyyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."SUBJ_ID" IS 'A szervezet egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_TYPE_ID" IS 'A param�ter t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_DATE_ID" IS 'A a beolvasott adat param�ter vonatkoz�si id�szaka';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_VALUE" IS 'A beolvasott adat param�ter �rt�ke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_UNIT_ID" IS 'A beolvasott adat param�ter m�rt�kegys�g�nek IDja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_UNIT" IS 'A beolvasott adat param�ter m�rt�kegys�ge';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."SOURCE_TYPE_ID" IS 'Excell fileb�l, vagy f�k�nyvi sz�ml�kb�l j�tt-e a sor';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."COLUMN_NO" IS 'Az excell file melyik oszlop�b�l j�tt az �rt�k';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."LIST_TYPE_ID" IS 'A felt�lt�tt adat melyik excel sheet azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."DATA_INCO_ID" IS 'A be�rkez�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."STATUS_ID" IS 'A beolvasott adat param�ter st�tusz�nak azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."ORIGINAL_VALUE" IS 'Az adatsor eredeti k�ld�tt �rt�ke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CONTROL_VALUE" IS 'A beolvasott adat param�ter�nek helyessen sz�m�tott �rt�ke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."ORDER_NO" IS 'A k�rd�sek sorrendje a k�rd��vben';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."CONTROL_COL_VALUE" IS 'Az oszlopok sz�m�tott kontroll-sz�m�tott �rt�ke';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_DATE_TYPE_ID" IS 'Az adatra vonatkokz� id�szak t�pus�nak 
egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_ADATE_TYPE_ID" IS 'Az adatra vonatkokz� id�szak t�pusa 
vonatkoz�si jelz�j�nek egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."W_PARAM_DATE_TYPE_NAME" IS 'Az adatra vonatkokz� id�szak 
t�pus�nak neve';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."W_PARAM_ADATE_TYPE_NAME" IS 'Az adatra vonatkokz� id�szak 
t�pus�nak vonatkoz�si jelz�je';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_FDATE" IS 'Az oszlop  id�intervallum kezdete';
 
   COMMENT ON COLUMN "TRAFFIC_SUM"."PARAM_TDATE" IS 'Az oszlop  id�intervallum v�ge';
 
   COMMENT ON TABLE "TRAFFIC_SUM"  IS 'A tranzakci�k t�bl�ja (Table code: TRF)';
