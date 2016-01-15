--------------------------------------------------------
--  DDL for Table GIS_SPATIAL
--------------------------------------------------------

  CREATE TABLE "GIS_SPATIAL" 
   (	"GIS_SPATIAL_ID" NUMBER(12,0), 
	"SUBJ_PARAM_ID" NUMBER(12,0), 
	"LAT" NUMBER(12,8), 
	"LON" NUMBER(12,8), 
	"LATLON" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 901, 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
