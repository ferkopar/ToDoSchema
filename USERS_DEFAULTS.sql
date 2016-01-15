--------------------------------------------------------
--  DDL for Table USERS_DEFAULTS
--------------------------------------------------------

  CREATE TABLE "USERS_DEFAULTS" 
   (	"USDEFAULTS_ID" NUMBER(12,0), 
	"MENU" VARCHAR2(50), 
	"MENU_COLOURS" VARCHAR2(10), 
	"MENU_SEQV" NUMBER(*,0), 
	"PNAMES" VARCHAR2(50), 
	"APEX_VARIABLE" VARCHAR2(255), 
	"APEX_LANGUAGE" VARCHAR2(6), 
	"APEX_PAGE" NUMBER(*,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"USER_ID" NUMBER(12,0), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "USERS_DEFAULTS"."USDEFAULTS_ID" IS 'UserDefaults egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."MENU" IS 'Menu pont';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."MENU_COLOURS" IS 'Megjelen�tend� men�ablak szine';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."MENU_SEQV" IS 'Men� sorrendje 0 ha f� vagy start 1 ha csoportban els� 2 ha ';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."PNAMES" IS 'Felhaszn�l�i ne�v';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."APEX_VARIABLE" IS 'APEX v�ltoz� �rt�k�nek visszaad�sa';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."APEX_LANGUAGE" IS 'Nyelv apex azonos�t� k�dja';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."APEX_PAGE" IS 'Apex oldal';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."USER_ID" IS 'Felhaszn�l� egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "USERS_DEFAULTS"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "USERS_DEFAULTS"  IS 'Felhaszn�l�i be�ll�t�sok
Code: USDE';
