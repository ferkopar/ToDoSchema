--------------------------------------------------------
--  DDL for Table DM_XL_REL
--------------------------------------------------------

  CREATE TABLE "DM_XL_REL" 
   (	"DM_XL_REL_ID" NUMBER(12,0), 
	"DM_XL_ID1" NUMBER(12,0), 
	"DM_XL_ID2" NUMBER(12,0), 
	"DM_XL_ID3" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"MATHOP" VARCHAR2(50), 
	"CONNUM" NUMBER(12,2) DEFAULT 1, 
	"ORDER_NO" NUMBER(2,0), 
	"W_REL_TYPE_NAME" VARCHAR2(50), 
	"W_ORDER_NO1" NUMBER(4,0), 
	"W_ORDER_NO2" NUMBER(4,0), 
	"W_ORDER_REG" VARCHAR2(50), 
	"W_ORDER_NO3" NUMBER(4,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6)
   ) ;
 

   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_REL_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID1" IS 'Els� operandus';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID2" IS 'M�sodik operndus';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID3" IS 'Az eredm�ny azonos�t�ja';
 
   COMMENT ON COLUMN "DM_XL_REL"."REL_TYPE_ID" IS 'Rel�ci� t�pusa';
 
   COMMENT ON COLUMN "DM_XL_REL"."MATHOP" IS 'Matematikai oper�tor';
 
   COMMENT ON COLUMN "DM_XL_REL"."CONNUM" IS 'A szorz� sz�m �rt�ke (alap�rtelmezetten 1)';
 
   COMMENT ON COLUMN "DM_XL_REL"."ORDER_NO" IS 'Sorrend';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_REL_TYPE_NAME" IS 'A rel�ci� megnevez�se sz�vegesen';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO1" IS 'Az ID1 sorrendj�nek sorsz�ma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO2" IS 'Az ID2 sorrendj�nek sorsz�ma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_REG" IS 'Az �sszegz�s (sz�mol�s) menete';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO3" IS 'Az ID3 sorrendj�nek sorsz�ma';
 
   COMMENT ON COLUMN "DM_XL_REL"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_XL_REL"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_XL_REL"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "DM_XL_REL"  IS 'A bet�lt�si szab�lyok rel�ci�s, m�veleti szab�lyok rel�ci�ja';
