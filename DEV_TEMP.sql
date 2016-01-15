--------------------------------------------------------
--  DDL for Table DEV_TEMP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "DEV_TEMP" 
   (	"DEV_TEMP_ID" NUMBER(12,0), 
	"TEXT" VARCHAR2(4000)
   ) ON COMMIT PRESERVE ROWS ;
 

   COMMENT ON COLUMN "DEV_TEMP"."DEV_TEMP_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DEV_TEMP"."TEXT" IS 'Sz�veg';
 
   COMMENT ON TABLE "DEV_TEMP"  IS 'Fejleszt�i munkat�bla';
