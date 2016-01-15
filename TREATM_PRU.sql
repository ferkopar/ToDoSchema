--------------------------------------------------------
--  DDL for Table TREATM_PRU
--------------------------------------------------------

  CREATE TABLE "TREATM_PRU" 
   (	"TREATM_PRU_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "TREATM_PRU"."TREATM_PRU_ID" IS 'T�blasor egyedi azonos�t�';
 
   COMMENT ON COLUMN "TREATM_PRU"."SUBJ_ID" IS 'Egys�g�r tulajdonos (biztos�t� vagy klinika) egyedi 
azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."TYPE_ID" IS '�rt�pus (szolg�ltat�si �r, t�mogat�si �r, bels� 
elsz�mol� �r)';
 
   COMMENT ON COLUMN "TREATM_PRU"."PARAM_TYPE_ID" IS 'Kezel�s elsz�mol�si param�tere (elsz�mol�si 
pont, t�mogat�si �r, m�veletid�)';
 
   COMMENT ON COLUMN "TREATM_PRU"."VALUE" IS 'Param�ter �rt�k';
 
   COMMENT ON COLUMN "TREATM_PRU"."UNIT_TYPE_ID" IS 'Param�ter m�rt�kegys�ge (HUF/pont, HUF/perc)';
 
   COMMENT ON COLUMN "TREATM_PRU"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "TREATM_PRU"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "TREATM_PRU"."TO_DATE" IS '�rv�nyess�g z�r� id�pontja';
 
   COMMENT ON COLUMN "TREATM_PRU"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak 
egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "TREATM_PRU"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "TREATM_PRU"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "TREATM_PRU"  IS 'Kezel�si egys�g�r t�bla';
