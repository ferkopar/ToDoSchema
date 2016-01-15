--------------------------------------------------------
--  DDL for Table DM_TEXT
--------------------------------------------------------

  CREATE TABLE "DM_TEXT" 
   (	"DM_TEXT_ID" NUMBER(12,0), 
	"TEXT_ID" NUMBER(12,0), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"TRANSL_TYPE" VARCHAR2(50), 
	"CNAMES" VARCHAR2(4000), 
	"HELP_TEXT" CLOB, 
	"DESCRIPTION" VARCHAR2(255), 
	"PRINT_TEXT" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" DATE, 
	"MDU" VARCHAR2(30), 
	"MDD" DATE, 
	"HUN_NAMES" VARCHAR2(4000), 
	"W_FORM" NVARCHAR2(30), 
	"W_LANGUAGE_CODE" VARCHAR2(255), 
	"REFERENCE_CODE" VARCHAR2(255), 
	"W_ERROR" VARCHAR2(255), 
	"W_GROUP_NAME" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 3
   ) ;
 

   COMMENT ON COLUMN "DM_TEXT"."DM_TEXT_ID" IS 'Text t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_TEXT"."TEXT_ID" IS 'Sz�veg egyedi azonos�t�ja kapcsol�dik a  Super_typehoz';
 
   COMMENT ON COLUMN "DM_TEXT"."LANGUAGE_ID" IS 'Nyelv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_TEXT"."TRANSL_TYPE" IS 'Ford�t�s t�pusa';
 
   COMMENT ON COLUMN "DM_TEXT"."CNAMES" IS 'Kiirand� sz�veg';
 
   COMMENT ON COLUMN "DM_TEXT"."HELP_TEXT" IS 'Help sz�vege';
 
   COMMENT ON COLUMN "DM_TEXT"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_TEXT"."PRINT_TEXT" IS 'Nyomtatand� sz�veg';
 
   COMMENT ON COLUMN "DM_TEXT"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_TEXT"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_TEXT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_TEXT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_TEXT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_TEXT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "DM_TEXT"  IS 'Code: DMTX';
