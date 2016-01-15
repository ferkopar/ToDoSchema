--------------------------------------------------------
--  DDL for Table ADMIN_EVAL_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_EVAL_LOG" 
   (	"EVAL_LOG_ID" NUMBER(12,0), 
	"SCH_NAME" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"ESEMENY" VARCHAR2(30), 
	"ESEMENYKOD" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."EVAL_LOG_ID" IS 'Adminisztrativ Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."SCH_NAME" IS 'Feldolgozott Sch�ma neve';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."ESEMENY" IS 'Adminisztrativ Esem�ny neve';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."ESEMENYKOD" IS 'Adminisztrativ Esem�ny k�dja';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "ADMIN_EVAL_LOG"."TIME_STAMP" IS 'Id�pecs�t';
 
   COMMENT ON TABLE "ADMIN_EVAL_LOG"  IS 'Adminisztrativ esem�ny napl� t�bla
Code: ELOG
';
