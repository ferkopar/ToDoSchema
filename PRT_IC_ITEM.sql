--------------------------------------------------------
--  DDL for Table PRT_IC_ITEM
--------------------------------------------------------

  CREATE TABLE "PRT_IC_ITEM" 
   (	"IC_ITEM_ID" NUMBER(12,0), 
	"IC_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"IC_VALUE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"IC_VALUE_TYPE" VARCHAR2(50), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ITEM_ID" IS 'Interface t�tel egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ID" IS 'Interface t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."EPI_ID" IS 'Kapcsol�d� esem�ny egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."ORDER_NO" IS 'Rendez�si sorrend
DM_Regulation.Type_Table1 ';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE_TYPE" IS '�rt�k m�rt�kegys�ge';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "PRT_IC_ITEM"  IS 'Bej�v� adat t�rzs �rt�kei
Code: PICI';
