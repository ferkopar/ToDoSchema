--------------------------------------------------------
--  DDL for Table MM_FILES
--------------------------------------------------------

  CREATE TABLE "MM_FILES" 
   (	"MM_ID" NUMBER(12,0), 
	"MM_TYPE_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"MM_HYPL" VARCHAR2(255), 
	"MM_BLOB" BLOB, 
	"MAIN_TYPE" VARCHAR2(30), 
	"FILE_NAME" VARCHAR2(255), 
	"MM_CHARSET" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"ROLL_TYPE" NVARCHAR2(50) DEFAULT 0, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"TITLE" VARCHAR2(255), 
	"STAT_TYPE_ID" NUMBER(12,0) DEFAULT 5, 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "MM_FILES"."MM_ID" IS 'Documentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."MM_TYPE_ID" IS 'Multimedia T�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."SUBJ_ID" IS 'A dokumentumhoz tartoz� alany';
 
   COMMENT ON COLUMN "MM_FILES"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."MM_HYPL" IS 'Documentum file linkje';
 
   COMMENT ON COLUMN "MM_FILES"."MM_BLOB" IS 'Multim�dia Bin�ris f�jlja';
 
   COMMENT ON COLUMN "MM_FILES"."MAIN_TYPE" IS 'F�jl t�pusa, kterjeszt�se';
 
   COMMENT ON COLUMN "MM_FILES"."FILE_NAME" IS 'F�jl neve';
 
   COMMENT ON COLUMN "MM_FILES"."MM_CHARSET" IS 'Dokumentum karakterk�szlete';
 
   COMMENT ON COLUMN "MM_FILES"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "MM_FILES"."ROLL_TYPE" IS 'L�trehoz� felhaszn�l� szerepk�r szintje';
 
   COMMENT ON COLUMN "MM_FILES"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "MM_FILES"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "MM_FILES"."TITLE" IS 'Multimedia c�me';
 
   COMMENT ON COLUMN "MM_FILES"."STAT_TYPE_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "MM_FILES"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "MM_FILES"  IS 'Multimedia let�rol�si helyei

Code: MMFS';
