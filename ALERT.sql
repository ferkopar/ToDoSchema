--------------------------------------------------------
--  DDL for Table ALERT
--------------------------------------------------------

  CREATE TABLE "ALERT" 
   (	"ALERT_ID" NUMBER(12,0), 
	"ALERT_TYPE_ID" NUMBER(12,0), 
	"MESSAGE_ID" NUMBER(12,0), 
	"ALERT_STATUS" VARCHAR2(2), 
	"EPI_ID" NUMBER(12,0), 
	"U_COMMENT" VARCHAR2(255), 
	"TO_DATE" DATE, 
	"PRIORITY" NUMBER(1,0), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"SUBJ_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"SUBJ_TYPE_ID" NUMBER(12,0), 
	"OFFICE_ID" NUMBER(12,0), 
	"MESSAGE_TEXT" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "ALERT"."ALERT_ID" IS 'Riaszt�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."ALERT_TYPE_ID" IS 'Riaszt�s t�pusa';
 
   COMMENT ON COLUMN "ALERT"."MESSAGE_ID" IS '�zenet egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."ALERT_STATUS" IS 'Riaszt�s st�tusza';
 
   COMMENT ON COLUMN "ALERT"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."U_COMMENT" IS 'Megjegz�s az �zenethez';
 
   COMMENT ON COLUMN "ALERT"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "ALERT"."PRIORITY" IS 'Fontoss�ga a riaszt�snak';
 
   COMMENT ON COLUMN "ALERT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "ALERT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "ALERT"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "ALERT"."SUBJ_ID" IS 'A cimzett user';
 
   COMMENT ON COLUMN "ALERT"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "ALERT"."SUBJ_TYPE_ID" IS 'A c�mzett csoport, csak ha a SUBJ_ID �res';
 
   COMMENT ON COLUMN "ALERT"."OFFICE_ID" IS 'A c�mzett hivatal, csak ha a SUBJ_ID �res';
 
   COMMENT ON TABLE "ALERT"  IS 'Riaszt�s
Code: ALRT';
