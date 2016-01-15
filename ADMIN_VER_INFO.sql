--------------------------------------------------------
--  DDL for Table ADMIN_VER_INFO
--------------------------------------------------------

  CREATE TABLE "ADMIN_VER_INFO" 
   (	"VER_INFO_ID" NUMBER(12,0), 
	"SCH_NAME" VARCHAR2(30), 
	"VER_INFO" VARCHAR2(30), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_VER_INFO"."VER_INFO_ID" IS 'Adatb�zis �s program verzi�t�bl�j�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."SCH_NAME" IS 'Feldolgozott Sch�ma neve';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."VER_INFO" IS 'Adatb�zis �s program verzi�j�nak aktu�lis �rt�ke';
 
   COMMENT ON COLUMN "ADMIN_VER_INFO"."TIME_STAMP" IS 'Id�pecs�t';
 
   COMMENT ON TABLE "ADMIN_VER_INFO"  IS 'Adminisztrat�v verzi� kezel� t�bla
Code:AINF';
