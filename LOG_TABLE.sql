--------------------------------------------------------
--  DDL for Table LOG_TABLE
--------------------------------------------------------

  CREATE TABLE "LOG_TABLE" 
   (	"LOG_ID" NUMBER(12,0), 
	"OPERATION_TYPE" VARCHAR2(1), 
	"OPERATION_TIME" DATE, 
	"TABLE_NAME" VARCHAR2(30), 
	"RECORD_ID" VARCHAR2(1000), 
	"USER_NAME" VARCHAR2(30), 
	"COLUMN_NAME" VARCHAR2(30), 
	"OLD_VALUE" VARCHAR2(4000), 
	"NEW_VALUE" VARCHAR2(4000), 
	"EPI_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "LOG_TABLE"."LOG_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "LOG_TABLE"."OPERATION_TYPE" IS 'M�velet tipusa';
 
   COMMENT ON COLUMN "LOG_TABLE"."OPERATION_TIME" IS 'M�velet id�pontja';
 
   COMMENT ON COLUMN "LOG_TABLE"."TABLE_NAME" IS 'T�bla neve';
 
   COMMENT ON COLUMN "LOG_TABLE"."RECORD_ID" IS 'Recordot azonos�t� ID';
 
   COMMENT ON COLUMN "LOG_TABLE"."COLUMN_NAME" IS 'Oszlop n�v';
 
   COMMENT ON COLUMN "LOG_TABLE"."OLD_VALUE" IS 'Eredeti �rt�k';
 
   COMMENT ON COLUMN "LOG_TABLE"."NEW_VALUE" IS 'Modos�tott �rt�k';
 
   COMMENT ON COLUMN "LOG_TABLE"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON TABLE "LOG_TABLE"  IS 'M�velet napl�z� t�bla';
