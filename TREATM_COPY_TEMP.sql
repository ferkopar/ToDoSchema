--------------------------------------------------------
--  DDL for Table TREATM_COPY_TEMP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "TREATM_COPY_TEMP" 
   (	"TREATM_ID" NUMBER(12,0), 
	"NEW_TREATM_ID" NUMBER(10,0)
   ) ON COMMIT DELETE ROWS ;
