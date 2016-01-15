--------------------------------------------------------
--  DDL for Table SUBJ_PARAM_COPY
--------------------------------------------------------

  CREATE TABLE "SUBJ_PARAM_COPY" 
   (	"SUBJ_PARAM_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"MM_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"UNIT" VARCHAR2(50), 
	"GIS_ID" NUMBER(12,0), 
	"SUBJ_TYPE_ID" NUMBER(10,0), 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"GROUP_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."SUBJ_PARAM_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."UNIT_TYPE_ID" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."VALUE_TYPE_ID" IS 'Az �rt�k t�p�s�nak egyedi azonos�t�ja a DM_SUPER_TYPE t�bl�b�l';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."ORDER_NO" IS 'Rendez�si sorrend azonos EPI-hez';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "SUBJ_PARAM_COPY"."GIS_ID" IS 'GIS_DATA t�bla egyedi azonos�t�ja';
 
   COMMENT ON TABLE "SUBJ_PARAM_COPY"  IS 'Subjectiv relation
Code:SUPA';
