--------------------------------------------------------
--  DDL for Table DM_CITY
--------------------------------------------------------

  CREATE TABLE "DM_CITY" 
   (	"DM_CITY_ID" NUMBER(12,0), 
	"NAME" VARCHAR2(255), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"DESCRIPTION" VARCHAR2(255), 
	"USE_COMMENT" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
