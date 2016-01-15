--------------------------------------------------------
--  DDL for Table ALERT_PARAM
--------------------------------------------------------

  CREATE TABLE "ALERT_PARAM" 
   (	"ALERT_PARAM_ID" NUMBER(12,0), 
	"ALERT_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"APEX_PAGE" NUMBER, 
	"APEX_VARIABLE" VARCHAR2(255), 
	"VALUE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"SUBJ_ID" NUMBER(12,0), 
	"APEX_PAGE_OLD" NUMBER
   ) ;
