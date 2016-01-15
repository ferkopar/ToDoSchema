--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUBJ_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRD" TIMESTAMP (6), 
	"CRU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0, 
	"SUBJ_CATEGORY_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "SUBJECT"."SUBJ_ID" IS 'Subjectiv t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJECT"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "SUBJECT"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "SUBJECT"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "SUBJECT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "SUBJECT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJECT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "SUBJECT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON TABLE "SUBJECT"  IS 'Az alanyok (hivatalok) nyilv�ntart�si �s hivatkoz�si t�bl�ja (Table code: SUB)';
