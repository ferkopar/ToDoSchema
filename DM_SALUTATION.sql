--------------------------------------------------------
--  DDL for Table DM_SALUTATION
--------------------------------------------------------

  CREATE TABLE "DM_SALUTATION" 
   (	"SALUTATION_ID" NUMBER(12,0), 
	"SALUTATION" VARCHAR2(30), 
	"SALUTATION2" VARCHAR2(30), 
	"SEX" VARCHAR2(1), 
	"FROM_AGE" VARCHAR2(30), 
	"TO_AGE" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION_ID" IS 'Megsz�l�t�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION" IS 'Megsz�l�t�s';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SALUTATION2" IS 'Megsz�l�t�s';
 
   COMMENT ON COLUMN "DM_SALUTATION"."SEX" IS 'Neme M_f�rfi F_n� I_ismeretlen';
 
   COMMENT ON COLUMN "DM_SALUTATION"."FROM_AGE" IS 'Korhat�r: 0-16; 16-22; 22-?';
 
   COMMENT ON COLUMN "DM_SALUTATION"."TO_AGE" IS 'Korhat�r: 0-16; 16-22; 22-';
 
   COMMENT ON COLUMN "DM_SALUTATION"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_SALUTATION"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_SALUTATION"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_SALUTATION"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SALUTATION"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_SALUTATION"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SALUTATION"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_SALUTATION"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_SALUTATION"  IS 'Megsz�l�t�s
Code: DMSL';
