--------------------------------------------------------
--  DDL for Table DM_ROLE_USER
--------------------------------------------------------

  CREATE TABLE "DM_ROLE_USER" 
   (	"ROLE_USER_ID" NUMBER(12,0), 
	"USER_ID" NUMBER(12,0), 
	"ROLE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"SUBJ_ID" NUMBER(12,0), 
	"SIGN" VARCHAR2(1) DEFAULT 'Y', 
	"DATA_OWNER_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_ROLE_USER"."ROLE_USER_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."USER_ID" IS 'Felhaszn�l� egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."ROLE_ID" IS 'A kapcsolod� szab�ly egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."SUBJ_ID" IS 'A szervezet egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."DATA_OWNER_ID" IS 'Az adatgazda egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_ROLE_USER"  IS 'Szerepk�r�k hierarchi�ja Code: DMRU';
