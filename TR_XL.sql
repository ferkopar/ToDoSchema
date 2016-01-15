--------------------------------------------------------
--  DDL for Table TR_XL
--------------------------------------------------------

  CREATE TABLE "TR_XL" 
   (	"TR_XL_ID" NUMBER(12,0), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"COL_DM_XL_ID" NUMBER(12,0), 
	"ROW_DM_XL_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"ORDER_NO" NUMBER(4,0), 
	"COLUMN_DATA_TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE" NUMBER(15,2), 
	"PARAM_VALUE_CHR" VARCHAR2(255), 
	"PARAM_UNIT" VARCHAR2(50), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"SUBJ_ID" NUMBER(12,0), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"DESCRIPTION" VARCHAR2(250), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"CONTROL_COL_VALUE" NUMBER(15,2), 
	"PARAM_DATE_TYPE_ID" NUMBER(12,0), 
	"PARAM_ADATE_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_DATE_TYPE_NAME" VARCHAR2(30), 
	"W_PARAM_ADATE_TYPE_NAME" VARCHAR2(30), 
	"PARAM_FDATE" DATE, 
	"PARAM_TDATE" DATE, 
	"PARAM_DATE" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "TR_XL"."TR_XL_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."DATA_INCO_ID" IS 'Az adat be�rkez�s�nek, bet�lt�s�t regisztr�l�s�ank egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."LIST_TYPE_ID" IS 'A lista tipus egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."COLUMN_NO" IS 'Az excell file melyik oszlop�b�l j�tt az �rt�k';
 
   COMMENT ON COLUMN "TR_XL"."ORDER_NO" IS 'Az sorrend';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_TYPE_ID" IS 'A param�ter t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_VALUE" IS 'A megadott, beolvasott �rt�k';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_UNIT" IS 'A megadott, beolvasott �rt�k m�rt�kegys�ge';
 
   COMMENT ON COLUMN "TR_XL"."STATUS_ID" IS 'Az adat st�tusz�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."SUBJ_ID" IS 'Az adatra vonatkoz� szem�ly-c�g egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."CONTROL_VALUE" IS 'A beolvasott adat param�ter�nek helyessen sz�m�tott �rt�ke';
 
   COMMENT ON COLUMN "TR_XL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TR_XL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TR_XL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "TR_XL"."CONTROL_COL_VALUE" IS 'Az oszlopok sz�m�tott kontroll-sz�m�tott �rt�ke';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_DATE_TYPE_ID" IS 'Az adatra vonatkokz� id�szak t�pus�nak 
egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_ADATE_TYPE_ID" IS 'Az adatra vonatkokz� id�szak t�pusa 
vonatkoz�si jelz�j�nek egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL"."W_PARAM_DATE_TYPE_NAME" IS 'Az adatra vonatkokz� id�szak 
t�pus�nak neve';
 
   COMMENT ON COLUMN "TR_XL"."W_PARAM_ADATE_TYPE_NAME" IS 'Az adatra vonatkokz� id�szak 
t�pus�nak vonatkoz�si jelz�je';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_FDATE" IS 'Az oszlop  id�intervallum kezdete';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_TDATE" IS 'Az oszlop  id�intervallum v�ge';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_DATE" IS 'A vizsg�lt id�szak';
