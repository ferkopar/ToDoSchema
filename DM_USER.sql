--------------------------------------------------------
--  DDL for Table DM_USER
--------------------------------------------------------

  CREATE TABLE "DM_USER" 
   (	"USER_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"USER_NAME" VARCHAR2(30), 
	"LANGUAGE_ID" NUMBER(12,0) DEFAULT 1, 
	"USER_PSWD" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_USER"."USER_ID" IS 'Felhaszn�l� egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_USER"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_USER"."USER_NAME" IS 'Apex felhaszn�l� n�v';
 
   COMMENT ON COLUMN "DM_USER"."LANGUAGE_ID" IS 'A felhaszn�l� alap�rtemezett nyelv�nek azonos�t�ja';
 
   COMMENT ON COLUMN "DM_USER"."USER_PSWD" IS 'Felhaszn�l� jelszava titkos�tott oszlop';
 
   COMMENT ON COLUMN "DM_USER"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_USER"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_USER"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_USER"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_USER"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_USER"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_USER"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_USER"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_USER"  IS 'Felhaszn�l�k nyilv�ntart�sa
Code: DMUS';
