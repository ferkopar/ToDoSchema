--------------------------------------------------------
--  DDL for Table EPI
--------------------------------------------------------

  CREATE TABLE "EPI" 
   (	"EPI_ID" NUMBER(12,0), 
	"EPI_NAME" VARCHAR2(100), 
	"EPI_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"EPI_VALUE" NUMBER, 
	"EPI_UNIT_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"CLASS_TYPE" VARCHAR2(50), 
	"CLASS_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_EPI_TYPE" VARCHAR2(30) DEFAULT 'Beteg felv�tel', 
	"W_STATUS_TYPE" VARCHAR2(30) DEFAULT 'Akt�v', 
	"W_ERROR" VARCHAR2(255), 
	"VALUE_TYPE_ID" NUMBER(12,0) DEFAULT null, 
	"UNIT" VARCHAR2(50)
   ) ;
 

   COMMENT ON COLUMN "EPI"."EPI_ID" IS 'Esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."EPI_NAME" IS 'Esem�ny neve';
 
   COMMENT ON COLUMN "EPI"."EPI_TYPE_ID" IS 'Esem�ny t�pus nev�nek egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."EPI_VALUE" IS 'Aktu�lis �rt�k';
 
   COMMENT ON COLUMN "EPI"."EPI_UNIT_TYPE_ID" IS 'M�rt�kegy�g';
 
   COMMENT ON COLUMN "EPI"."ORDER_NO" IS 'Rendez�si sorrend';
 
   COMMENT ON COLUMN "EPI"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "EPI"."CLASS_TYPE" IS 'Besorol�s neve';
 
   COMMENT ON COLUMN "EPI"."CLASS_ID" IS 'Besorol�s egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "EPI"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "EPI"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "EPI"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "EPI"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "EPI"."UNIT" IS 'Aktu�lis �rt�k m�rt�kegys�ge';
 
   COMMENT ON TABLE "EPI"  IS 'Esem�nyek
Code: EPIS';
