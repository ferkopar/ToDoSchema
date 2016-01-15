--------------------------------------------------------
--  DDL for Table DM_ROLE_RIGHT
--------------------------------------------------------

  CREATE TABLE "DM_ROLE_RIGHT" 
   (	"ROLE_RIGHT_ID" NUMBER(12,0), 
	"RIGHT_TYPE_ID" NUMBER(12,0), 
	"ROLE_ID" NUMBER(12,0), 
	"APEX_PAGE" NUMBER(10,0), 
	"APEX_VARIABLE" VARCHAR2(255 CHAR), 
	"FIELD_ID" NUMBER(12,0), 
	"TCRITERION" VARCHAR2(4000), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "DM_ROLE_RIGHT"."ROLE_RIGHT_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."RIGHT_TYPE_ID" IS 'A jogosults�g t�pusa SUPER_TYPE_ID';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."ROLE_ID" IS 'A kapcsolod� szab�ly egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."APEX_PAGE" IS 'Apex oldal';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."APEX_VARIABLE" IS 'APEX v�ltoz� �rt�k�nek visszaad�sa';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."FIELD_ID" IS 'Mez� SUPER_TYPE_ID-je';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."TCRITERION" IS 'Krit�rium, szab�ly le�r�sa';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_RIGHT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "DM_ROLE_RIGHT"  IS 'Szab�ly szerepk�r�k t�bl�ja';
