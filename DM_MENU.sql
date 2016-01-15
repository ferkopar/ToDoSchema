--------------------------------------------------------
--  DDL for Table DM_MENU
--------------------------------------------------------

  CREATE TABLE "DM_MENU" 
   (	"MENU_ID" NUMBER(*,0), 
	"LVL" NUMBER(*,0), 
	"LABEL" NVARCHAR2(100), 
	"PAGE_ID" NVARCHAR2(50), 
	"IS_CURRENT_LIST_ENTRY" NVARCHAR2(255), 
	"IMAGE" NVARCHAR2(255), 
	"IMAGE_ATTRIBUTE" NVARCHAR2(255), 
	"IMAGE_ALT_ATTRIBUTE" NVARCHAR2(255), 
	"ORDER1" NUMBER(*,0), 
	"ORDER2" NUMBER(*,0), 
	"TREATM_GROUP_ID" NUMBER(*,0), 
	"APEX_VARIABLE" NVARCHAR2(50), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0, 
	"LABEL_ID" NUMBER(12,0)
   ) ;
