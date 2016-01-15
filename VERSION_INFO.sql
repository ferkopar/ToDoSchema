--------------------------------------------------------
--  DDL for Table VERSION_INFO
--------------------------------------------------------

  CREATE TABLE "VERSION_INFO" 
   (	"VER_INFO_ID" NUMBER(12,0), 
	"DB_VER_INFO" VARCHAR2(30), 
	"APX_VER_INFO" VARCHAR2(30), 
	"APX_MOD_INFO" VARCHAR2(30), 
	"APX_DEV_USR" VARCHAR2(30), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"VER_CHANGE" BLOB, 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "VERSION_INFO"."VER_INFO_ID" IS 'Verzió információk egyedi azonosítója';
 
   COMMENT ON COLUMN "VERSION_INFO"."DB_VER_INFO" IS 'Adatbázis verzió
DENTAL  DATA MODELL_V.2.02.1.03_20120809';
 
   COMMENT ON COLUMN "VERSION_INFO"."APX_VER_INFO" IS 'Apex program vezió ';
 
   COMMENT ON COLUMN "VERSION_INFO"."APX_MOD_INFO" IS 'Apex modul neve';
 
   COMMENT ON COLUMN "VERSION_INFO"."APX_DEV_USR" IS 'Apex modul fejlsztõ neve';
 
   COMMENT ON COLUMN "VERSION_INFO"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "VERSION_INFO"."MDD" IS 'Rekord Módosításának Idõpecsétje';
 
   COMMENT ON COLUMN "VERSION_INFO"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "VERSION_INFO"."CRD" IS 'Rekord Létrehozásának idõpecsétje';
 
   COMMENT ON COLUMN "VERSION_INFO"."VER_CHANGE" IS 'Version change';
 
   COMMENT ON COLUMN "VERSION_INFO"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "VERSION_INFO"  IS 'Adatbázis és vezerlõ program verzió
Code: VINF';
