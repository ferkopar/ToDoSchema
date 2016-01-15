--------------------------------------------------------
--  DDL for Table ADMIN_VER_INFO
--------------------------------------------------------

  CREATE TABLE "ADMIN_VER_INFO" 
   (	"VER_INFO_ID" NUMBER(12,0), 
	"SCH_NAME" VARCHAR2(30), 
	"VER_INFO" VARCHAR2(30), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_VER_INFO"."VER_INFO_ID" IS 'Adatbázis és program verziótáblájának egyedi azonosítója';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."SCH_NAME" IS 'Feldolgozott Schéma neve';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."VER_INFO" IS 'Adatbázis és program verziójának aktuális értéke';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."TIME_STAMP" IS 'Idõpecsét';
 
   COMMENT ON TABLE "ADMIN_VER_INFO"  IS 'Adminisztratív verzió kezelõ tábla
Code:AINF';
