--------------------------------------------------------
--  DDL for Table TR_XL_LOAD_ERR
--------------------------------------------------------

  CREATE TABLE "TR_XL_LOAD_ERR" 
   (	"TR_XL_ID" NUMBER(12,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"PARAM_STATUS_TYPE_ID" NUMBER(12,0), 
	"PARAM_DATE" VARCHAR2(255), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE_ERR" VARCHAR2(4000), 
	"PARAM_UNIT" VARCHAR2(50), 
	"SUBJ_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"DESCRIPTION" VARCHAR2(4000), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CONTROL_COL_VALUE" NUMBER(15,2)
   ) ;
 

   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."TR_XL_ID" IS 'Az adatbet�lt�si rekord egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."LIST_TYPE_ID" IS 'A lista tipus egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_DATE" IS 'A vizsg�lt id�szak';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_VALUE_ERR" IS 'Param�ter hib�s �rt�ke ';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_UNIT" IS 'A megadott, beolvasott �rt�k m�rt�kegys�ge';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."COLUMN_NO" IS 'Az excell file melyik oszlop�b�l j�tt az �rt�k';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_VALUE" IS 'A beolvasott adat param�ter�nek helyessen sz�m�tott �rt�ke';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DATA_INCO_ID" IS 'A be�rkez�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_COL_VALUE" IS 'Az oszlopok sz�m�tott kontroll-sz�m�tott �rt�ke';
