--------------------------------------------------------
--  DDL for Table WK_TREATM
--------------------------------------------------------

  CREATE TABLE "WK_TREATM" 
   (	"TREATM_ID" NUMBER(12,0), 
	"TREATM_NAME" VARCHAR2(255), 
	"TREATM_GROUP_ID" NUMBER(12,0), 
	"TREATM_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"TREATM_CATEGORY_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"SUBJ1_ID" NUMBER(12,0), 
	"TYPE1_ID" NUMBER(12,0), 
	"SUBJ2_ID" NUMBER(12,0), 
	"TYPE2_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(4000), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2099.12.31','YYYY.MM.DD')), 
	"TREATM_NAME_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "WK_TREATM"."TREATM_ID" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "WK_TREATM"."TREATM_NAME" IS 'Kezel�s megnevez�se';
 
   COMMENT ON COLUMN "WK_TREATM"."TREATM_GROUP_ID" IS 'Mandatory Traetment Id';
 
   COMMENT ON COLUMN "WK_TREATM"."TREATM_TYPE_ID" IS 'M�velet t�pusa';
 
   COMMENT ON COLUMN "WK_TREATM"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "WK_TREATM"."TREATM_CATEGORY_ID" IS 'A m�velet,	anat�miai testr�sz besorol�s�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "WK_TREATM"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "WK_TREATM"."TIME_START" IS 'A m�velet, kezel�s (tervezett, t�nyleges) kezd� id�pontja (d�tum, �ra, perc)';
 
   COMMENT ON COLUMN "WK_TREATM"."TIME_END" IS 'A m�velet,	kezel�s (tervezett, t�nyleges) z�r� id�pontja (d�tum, �ra, perc)';
 
   COMMENT ON COLUMN "WK_TREATM"."SUBJ1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "WK_TREATM"."TYPE1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "WK_TREATM"."SUBJ2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "WK_TREATM"."TYPE2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "WK_TREATM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "WK_TREATM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "WK_TREATM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "WK_TREATM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "WK_TREATM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON TABLE "WK_TREATM"  IS 'Kezel�s 
Code: TRTM';
