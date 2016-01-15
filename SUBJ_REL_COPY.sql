--------------------------------------------------------
--  DDL for Table SUBJ_REL_COPY
--------------------------------------------------------

  CREATE TABLE "SUBJ_REL_COPY" 
   (	"SUBJ_REL_ID" NUMBER(12,0), 
	"SUBJ_ID1" NUMBER(12,0), 
	"SUBJ_ID2" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_REL_TYPE" VARCHAR2(30), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_REL_ID" IS 'Subjectiv rel�ci� t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_ID1" IS 'Subjectiv rel�ci� Chield azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."SUBJ_ID2" IS 'Subjectiv rel�ci� Parent azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."STATUS_ID" IS 'FAz adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_REL_COPY"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "SUBJ_REL_COPY"  IS 'Subjectiv relation
Code:SURE';
