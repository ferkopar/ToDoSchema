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
 

   COMMENT ON COLUMN "VALID_UNIT"."VALID_UNIT_ID" IS 'Valídációsmértékegységek egyedi azonosítója';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT_ID" IS 'Mértékegység egyedi azonosítója';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT_NAME" IS 'Mértékegység neve';
 
   COMMENT ON COLUMN "VALID_UNIT"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "VALID_UNIT"."ANALYSIS_TYPE_ID" IS 'Mérés típus egyedi azonosítója';
 
   COMMENT ON COLUMN "VALID_UNIT"."VALID_TYPE_ID" IS 'Validációs kódok(Aktív, Inaktív, Archiválandó, Archivált, Törölt)';
 
   COMMENT ON COLUMN "VALID_UNIT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "VALID_UNIT"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "VALID_UNIT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "VALID_UNIT"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "VALID_UNIT"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "VALID_UNIT"  IS 'Mérési módszerek mérékegységei
Code: VALU';
