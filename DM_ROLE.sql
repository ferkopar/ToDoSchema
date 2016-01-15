--------------------------------------------------------
--  DDL for Table DM_ROLE
--------------------------------------------------------

  CREATE TABLE "DM_ROLE" 
   (	"ROLE_ID" NUMBER(12,0), 
	"ROLE_NAME" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_ROLE"."ROLE_ID" IS 'Szerepk�r azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE"."ROLE_NAME" IS 'Szerepk�r neve';
 
   COMMENT ON COLUMN "DM_ROLE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_ROLE"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_ROLE"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_ROLE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ROLE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_ROLE"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_ROLE"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_ROLE"  IS 'Szab�ly
Code: DMRO';
