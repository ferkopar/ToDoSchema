--------------------------------------------------------
--  DDL for Table DM_COUNTRY
--------------------------------------------------------

  CREATE TABLE "DM_COUNTRY" 
   (	"COUNTRY_ID" NUMBER(12,0), 
	"COUNTRY_NAME" VARCHAR2(100), 
	"COUNTRY_TRICODE" VARCHAR2(3), 
	"COUNTRY_DUOCODE" VARCHAR2(2), 
	"TELEPHONE" VARCHAR2(10), 
	"CURRENCY_CODE" VARCHAR2(3), 
	"CURRENCY_NAME" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STAT_TYPE_ID" NUMBER(12,0) DEFAULT NULL, 
	"MM_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_ID" IS 'Country t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_NAME" IS 'Orsz�g neve';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_TRICODE" IS 'Orsz�g h�romtbet�s k�dja ISO3166-1 alpha-3';
 
   COMMENT ON COLUMN "DM_COUNTRY"."COUNTRY_DUOCODE" IS 'Orsz�g k�tbet�s k�dja ISO3166-1 alpha-2';
 
   COMMENT ON COLUMN "DM_COUNTRY"."TELEPHONE" IS 'Orsz�g h�v�sz�ma';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CURRENCY_CODE" IS 'Valuta nemzetk�zi h�rombet�s k�dja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CURRENCY_NAME" IS 'P�nznem neve';
 
   COMMENT ON COLUMN "DM_COUNTRY"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_COUNTRY"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_COUNTRY"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_COUNTRY"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_COUNTRY"."STAT_TYPE_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_COUNTRY"  IS 'Orsz�gok
Code: DMCO';
