--------------------------------------------------------
--  DDL for Table DM_MESSAGE
--------------------------------------------------------

  CREATE TABLE "DM_MESSAGE" 
   (	"MESSAGE_ID" NUMBER(12,0), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"MESSAGE_TEXT" VARCHAR2(255), 
	"MESSAGE_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE1" NUMBER(4,0), 
	"PARAM_TYPE1" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_ID" IS '�zenet egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."LANGUAGE_ID" IS 'Nyelv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_TEXT" IS '�zenet sz�vege';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MESSAGE_TYPE_ID" IS '�zenet t�pusa';
 
   COMMENT ON COLUMN "DM_MESSAGE"."PARAM_VALUE1" IS 'Param�ter �rt�ke';
 
   COMMENT ON COLUMN "DM_MESSAGE"."PARAM_TYPE1" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_MESSAGE"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_MESSAGE"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_MESSAGE"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_MESSAGE"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "DM_MESSAGE"  IS 'K�ldend� szabv�ny �zenetek
Code: DMMG';
