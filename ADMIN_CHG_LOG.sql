--------------------------------------------------------
--  DDL for Table ADMIN_CHG_LOG
--------------------------------------------------------

  CREATE TABLE "ADMIN_CHG_LOG" 
   (	"CHG_LOG_ID" NUMBER(12,0), 
	"TABLE_ID" NUMBER(12,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"COLUMN_NAME" VARCHAR2(30), 
	"CHANGE" VARCHAR2(255), 
	"MDU" VARCHAR2(30), 
	"TIME_STAMP" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
 

   COMMENT ON COLUMN "ADMIN_CHG_LOG"."CHG_LOG_ID" IS 'V�ltoztat�s t�pusa egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TABLE_ID" IS 'T�bla sor�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."COLUMN_NAME" IS 'Oszlop n�v';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."CHANGE" IS 'V�ltoztat�s t�pusa';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "ADMIN_CHG_LOG"."TIME_STAMP" IS 'Id�pecs�t';
 
   COMMENT ON TABLE "ADMIN_CHG_LOG"  IS 'Adminisztr�ci�s v�ltoz�skezel�si t�bla
Code: CLOG';
