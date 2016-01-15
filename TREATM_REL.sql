--------------------------------------------------------
--  DDL for Table TREATM_REL
--------------------------------------------------------

  CREATE TABLE "TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"KOD1" VARCHAR2(100), 
	"KOD2" VARCHAR2(100), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"EXTRA_NEXT_STEP" VARCHAR2(50), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"MM_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2100.01.01','YYYY.MM.DD')), 
	"DESCRIPTION" VARCHAR2(4000), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"GO_ORDER_NO" NUMBER(4,0)
   ) ;
 

   COMMENT ON COLUMN "TREATM_REL"."TREATM_REL_ID" IS 'Kezel�s t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."TREATM_ID1" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."TREATM_ID2" IS 'Kezel�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."REL_TYPE_ID" IS 'M�veletterv rel�ci�k (norma-terv, tervvari�ci�, terv-kezel�s)';
 
   COMMENT ON COLUMN "TREATM_REL"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."ORDER_NO" IS 'TREATM_REL_ID-n bel�li sorrend';
 
   COMMENT ON COLUMN "TREATM_REL"."TIME_START" IS 'Kezel�s (tervezett, t�nyleges) kezd� id�pontja (d�tum, �ra,perc)';
 
   COMMENT ON COLUMN "TREATM_REL"."TIME_END" IS 'Kezel�s (tervezett, t�nyleges) z�r� id�pontja (d�tum, �ra,perc)';
 
   COMMENT ON COLUMN "TREATM_REL"."MM_ID" IS 'Kapcsol�d� dokumentum';
 
   COMMENT ON COLUMN "TREATM_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TREATM_REL"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TREATM_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "TREATM_REL"  IS 'Kezel�sek (beavatkoz�sok) Rel�ci�ja
Code: TRTR';
