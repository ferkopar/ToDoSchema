--------------------------------------------------------
--  DDL for Table PRT_PLZ
--------------------------------------------------------

  CREATE TABLE "PRT_PLZ" 
   (	"country_code" VARCHAR2(50), 
	"postal_code" VARCHAR2(4), 
	"place_name" VARCHAR2(50), 
	"admin name1" VARCHAR2(50), 
	"admin_code1" VARCHAR2(50), 
	"admin_name2" VARCHAR2(255), 
	"admin_code2" VARCHAR2(255), 
	"admin_name3" VARCHAR2(255), 
	"admin_code3" VARCHAR2(255), 
	"latitude" NUMBER(38,0), 
	"longitude" NUMBER(38,0), 
	"accuracy" NUMBER(*,0)
   ) ;
