--------------------------------------------------------
--  DDL for Table PRT_WORK_TIME
--------------------------------------------------------

  CREATE TABLE "PRT_WORK_TIME" 
   (	"WK_TIME_ID" NUMBER(12,0), 
	"VALID_TYPE_ID" NUMBER(12,0), 
	"FIRST_NAME" VARCHAR2(100), 
	"LAST_NAME" VARCHAR2(100), 
	"START_TIME" TIMESTAMP (6), 
	"END_TIME" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"USER_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "PRT_WORK_TIME"."WK_TIME_ID" IS 'Munkaid� t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."VALID_TYPE_ID" IS 'Valid�ci�s k�dok(Akt�v, Inakt�v, Archiv�land�, Archiv�lt, T�r�lt)';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."FIRST_NAME" IS 'Kereszt n�v';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."LAST_NAME" IS 'Csal�d n�v';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."START_TIME" IS 'Munkaid� kezdete';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."END_TIME" IS 'Munkaid� v�ge';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."USER_ID" IS 'Felhaszn�l� egyedi azonos�t�ja';
 
   COMMENT ON TABLE "PRT_WORK_TIME"  IS 'Munkaid� nyilv�ntart�s
Code: WKTI';
