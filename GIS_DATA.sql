--------------------------------------------------------
--  DDL for Table GIS_DATA
--------------------------------------------------------

  CREATE TABLE "GIS_DATA" 
   (	"GIS_ID" NUMBER(12,0), 
	"GIS_TYPE_ID" NUMBER(12,0), 
	"COUNTRY" VARCHAR2(255), 
	"COUNTY" VARCHAR2(255), 
	"CITY" VARCHAR2(255), 
	"PLZ" VARCHAR2(30), 
	"ADRESS" VARCHAR2(255), 
	"STREET" VARCHAR2(255), 
	"HOUSE_NUM" VARCHAR2(255), 
	"LAT" NUMBER(12,8), 
	"LON" NUMBER(12,8), 
	"LATLON" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_COUNTRY_DUOCODE" VARCHAR2(2), 
	"W_CRM_COUNTRY" VARCHAR2(255), 
	"W_CRM_CITY" VARCHAR2(255), 
	"WK_COUNTRY_CODE" VARCHAR2(2), 
	"WK_ADM_NAME1" VARCHAR2(255), 
	"WK_ADM_CODE1" VARCHAR2(255), 
	"WK_ADM_NAME2" VARCHAR2(255), 
	"WK_ADM_CODE2" VARCHAR2(255), 
	"WK_ERROR" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "GIS_DATA"."GIS_ID" IS 'T�rinformatika egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA"."GIS_TYPE_ID" IS 'T�rinformatikai objektum besorol�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA"."COUNTRY" IS 'Orsz�g neve';
 
   COMMENT ON COLUMN "GIS_DATA"."COUNTY" IS 'Megye';
 
   COMMENT ON COLUMN "GIS_DATA"."CITY" IS 'V�ros neve';
 
   COMMENT ON COLUMN "GIS_DATA"."PLZ" IS 'Ir�ny�t�sz�m';
 
   COMMENT ON COLUMN "GIS_DATA"."ADRESS" IS 'C�m';
 
   COMMENT ON COLUMN "GIS_DATA"."STREET" IS 'Utca neve';
 
   COMMENT ON COLUMN "GIS_DATA"."HOUSE_NUM" IS 'H�zsz�m';
 
   COMMENT ON COLUMN "GIS_DATA"."LAT" IS 'Latitude';
 
   COMMENT ON COLUMN "GIS_DATA"."LON" IS 'Longitude';
 
   COMMENT ON COLUMN "GIS_DATA"."LATLON" IS 'egyedis�get biztos�t� LATITUDE;LONGITUDE form�tum';
 
   COMMENT ON COLUMN "GIS_DATA"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "GIS_DATA"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_DATA"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_DATA"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "GIS_DATA"  IS 'Code:GIDA';
