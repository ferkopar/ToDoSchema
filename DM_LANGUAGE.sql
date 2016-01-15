--------------------------------------------------------
--  DDL for Table DM_LANGUAGE
--------------------------------------------------------

  CREATE TABLE "DM_LANGUAGE" 
   (	"LANGUAGE_ID" NUMBER(12,0), 
	"LANGUAGE_NAME" VARCHAR2(50), 
	"LANGUAGE_TYP" VARCHAR2(50) DEFAULT 'Alapnyelv', 
	"RL" VARCHAR2(1) DEFAULT 'L', 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"LANGUAGE_CODE" VARCHAR2(3), 
	"W_COUNTRY_TRICODE" VARCHAR2(3), 
	"ISO639_3" VARCHAR2(3), 
	"ISO639_2" VARCHAR2(30), 
	"ISO639_1" VARCHAR2(5), 
	"HUN_NAME" VARCHAR2(500), 
	"ENG_NAME" VARCHAR2(500), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"FLAG_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_ID" IS 'Nyelv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_NAME" IS 'Nyelv megnevez�se';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."LANGUAGE_TYP" IS 'Nyelv rendszer szerinti t�pusa: Alapnyelv, Egy�b nyelv';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."RL" IS 'Ir�s ir�nya';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."HUN_NAME" IS 'Magyar megnevez�s';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."ENG_NAME" IS 'Angol megnevez�s';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_LANGUAGE"."FLAG_ID" IS 'Z�szl� rajz FK az MM_FILES-ra';
 
   COMMENT ON TABLE "DM_LANGUAGE"  IS 'Nyelvek t�pusa �s megnevez�se
Code: DMLA';
