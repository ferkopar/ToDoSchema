--------------------------------------------------------
--  DDL for Table VALID_UNIT
--------------------------------------------------------

  CREATE TABLE "VALID_UNIT" 
   (	"VALID_UNIT_ID" NUMBER(12,0), 
	"UNIT_ID" NUMBER(12,0), 
	"UNIT_NAME" VARCHAR2(50), 
	"UNIT" VARCHAR2(50), 
	"ANALYSIS_TYPE_ID" NUMBER(12,0), 
	"VALID_TYPE_ID" NUMBER(12,0), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "VALID_UNIT"."VALID_UNIT_ID" IS 'Val�d�ci�sm�rt�kegys�gek egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT_ID" IS 'M�rt�kegys�g egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT_NAME" IS 'M�rt�kegys�g neve';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "VALID_UNIT"."ANALYSIS_TYPE_ID" IS 'M�r�s t�pus egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "VALID_UNIT"."VALID_TYPE_ID" IS 'Valid�ci�s k�dok(Akt�v, Inakt�v, Archiv�land�, Archiv�lt, T�r�lt)';
 
   COMMENT ON COLUMN "VALID_UNIT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "VALID_UNIT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "VALID_UNIT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "VALID_UNIT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "VALID_UNIT"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "VALID_UNIT"  IS 'M�r�si m�dszerek m�r�kegys�gei
Code: VALU';
