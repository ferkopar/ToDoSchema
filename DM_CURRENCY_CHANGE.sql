--------------------------------------------------------
--  DDL for Table DM_CURRENCY_CHANGE
--------------------------------------------------------

  CREATE TABLE "DM_CURRENCY_CHANGE" 
   (	"CURR_CHANG_ID" NUMBER(12,0), 
	"CURR_CODE_FROM" VARCHAR2(3 CHAR), 
	"CURR_VALUE_FROM" NUMBER(6,2) DEFAULT 1, 
	"CURR_CODE_TO" VARCHAR2(3 CHAR) DEFAULT 'HUF', 
	"CURR_VALUE_TO" NUMBER(6,2), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"PROVIDER" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."CURR_CHANG_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_CURRENCY_CHANGE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON TABLE "DM_CURRENCY_CHANGE"  IS 'Valuta v�lt�si �rt�kek';
