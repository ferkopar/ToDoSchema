--------------------------------------------------------
--  DDL for Table EPI_PARAM
--------------------------------------------------------

  CREATE TABLE "EPI_PARAM" 
   (	"EPI_SUBJ_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"MM_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"UNIT" VARCHAR2(50), 
	"FROM_CODE" NUMBER(1,0), 
	"GIS_ID" NUMBER(12,0), 
	"W_ERROR" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "EPI_PARAM"."EPI_SUBJ_ID" IS 'T�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."EPI_ID" IS 'Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "EPI_PARAM"."UNIT_TYPE_ID" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "EPI_PARAM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "EPI_PARAM"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_PARAM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "EPI_PARAM"."W_PARAM_TYPE" IS 'Az PARAM_TYPE_ID megnevez�se ellen�rz�shez �s felt�lt�shez';
 
   COMMENT ON COLUMN "EPI_PARAM"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."VALUE_TYPE_ID" IS 'Az �rt�k t�p�s�nak egyedi azonos�t�ja a DM_SUPER_TYPE t�bl�b�l';
 
   COMMENT ON COLUMN "EPI_PARAM"."ORDER_NO" IS 'Rendez�si sorrend azonos EPI-hez';
 
   COMMENT ON COLUMN "EPI_PARAM"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "EPI_PARAM"."FROM_CODE" IS 'Honnan �rkezett az adat EPI vagy SUBJ vagy GIS';
 
   COMMENT ON COLUMN "EPI_PARAM"."GIS_ID" IS 'GIS_DATA t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI_PARAM"."W_ERROR" IS 'Hib�s rekord kisz�r�s�hez hiba�zenet';
 
   COMMENT ON TABLE "EPI_PARAM"  IS 'Subjectiv relation
Code:SUPA';
