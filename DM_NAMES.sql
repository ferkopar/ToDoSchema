--------------------------------------------------------
--  DDL for Table DM_NAMES
--------------------------------------------------------

  CREATE TABLE "DM_NAMES" 
   (	"NAMES_ID" NUMBER(12,0), 
	"PNAMES" VARCHAR2(50), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"SEX" VARCHAR2(1), 
	"TAGS" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_NAMES"."NAMES_ID" IS 'Keresztn�v t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_NAMES"."PNAMES" IS 'Keresztn�v';
 
   COMMENT ON COLUMN "DM_NAMES"."LANGUAGE_ID" IS 'Nyelv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_NAMES"."SEX" IS 'Neme M_f�rfi F_n� I_ismeretlen';
 
   COMMENT ON COLUMN "DM_NAMES"."TAGS" IS 'Tag';
 
   COMMENT ON COLUMN "DM_NAMES"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_NAMES"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_NAMES"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_NAMES"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_NAMES"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_NAMES"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_NAMES"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_NAMES"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_NAMES"  IS 'Kereszt Nevek
Code: DMNA';
