--------------------------------------------------------
--  DDL for Table ADMIN_AVC_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_AVC_LOG" 
   (	"AVC_LOG_ID" NUMBER(12,0), 
	"SCH_NAME" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"ROWS_NUM" NUMBER(12,0), 
	"MAX_CRD" DATE, 
	"MAX_TABLE_ID" NUMBER(12,0), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_AVC_LOG"."AVC_LOG_ID" IS 'Adminisztrativ Statisztikai t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."SCH_NAME" IS 'Feldolgozott Sch�ma neve';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."ROWS_NUM" IS 'Sorok sz�ma a t�bl�ban';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."MAX_CRD" IS 'A t�bla utos� besz�rt rekordj�nak az ideje';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."MAX_TABLE_ID" IS 'A t�bla legnagyobb egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_AVC_LOG"."TIME_STAMP" IS 'Id�pecs�t';
 
   COMMENT ON TABLE "ADMIN_AVC_LOG"  IS 'Adminisztr�ci�s statisztikai t�bla
Code: ALOG';
