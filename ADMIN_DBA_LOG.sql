--------------------------------------------------------
--  DDL for Table ADMIN_DBA_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_DBA_LOG" 
   (	"DBA_LOG_ID" NUMBER(12,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"TABLE_SEQ" VARCHAR2(30), 
	"TRIGGER_NAME" VARCHAR2(30), 
	"TABLE_TRG" VARCHAR2(3), 
	"MAX_TABLE_ID" NUMBER(12,0), 
	"MAX_CRD" DATE, 
	"MIN_SEQ_UPL" NUMBER(12,0), 
	"MAX_SEQ_UPL" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE, 
	"BASE_DAT_UPL" VARCHAR2(1), 
	"BASE_DAT_UPL_ROWS" NUMBER, 
	"BASE_TRSL_UPL" VARCHAR2(1), 
	"BASE_TRSL_UPL_ROWS" NUMBER
   ) ;
 

   COMMENT ON COLUMN "ADMIN_DBA_LOG"."DBA_LOG_ID" IS 'Adatb�zis log t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."TABLE_SEQ" IS 'T�bla sequenci�j�nak oszlopa';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."TRIGGER_NAME" IS 'T�bl�hoz tartoz� trigger neve';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."TABLE_TRG" IS 'T�bla egydi triggere YES, NO';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."MAX_TABLE_ID" IS 'A t�bla legnagyobb egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."MAX_CRD" IS 'A t�bla utos� besz�rt rekordj�nak az ideje';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."MIN_SEQ_UPL" IS '�sfelt�lt�skor a minim�lis egyedi azonos�t�';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."MAX_SEQ_UPL" IS '�sfelt�lt�skor a maxim�lis egyedi azonos�t�';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."TIME_STAMP" IS 'Id�pecs�t';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."BASE_DAT_UPL" IS 'Alap adatok felt�lve';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."BASE_DAT_UPL_ROWS" IS 'Felt�lt�tt sorok sz�ma';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."BASE_TRSL_UPL" IS 'A ford�t�si t�bl�ba az alapadatok felt�ltve Y-Igen N-Nem';
 
   COMMENT ON COLUMN "ADMIN_DBA_LOG"."BASE_TRSL_UPL_ROWS" IS 'Felt�lt�tt sorok sz�ma';
 
   COMMENT ON TABLE "ADMIN_DBA_LOG"  IS 'Adatb�zis log t�bla
Code: DLOG';
