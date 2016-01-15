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
 

   COMMENT ON COLUMN "INVENT_PARAM"."INVENT_PARAM_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."INVENT_ID" IS 'Anyag eszk�z lelt�r k�szltet egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "INVENT_PARAM"."UNIT" IS 'K�szlet M�rt�kegys�ge';
 
   COMMENT ON COLUMN "INVENT_PARAM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "INVENT_PARAM"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "INVENT_PARAM"."W_PARAM_TYPE" IS 'Param�ter t�pusa';
 
   COMMENT ON COLUMN "INVENT_PARAM"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT_PARAM"."SUBJ1_ID" IS 'Az �tad�';
 
   COMMENT ON COLUMN "INVENT_PARAM"."SUBJ2_ID" IS 'Az �tvev�';
 
   COMMENT ON COLUMN "INVENT_PARAM"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON TABLE "INVENT_PARAM"  IS 'Lelt�r k�szlet param�terei
Code:EINP';
