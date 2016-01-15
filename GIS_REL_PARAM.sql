--------------------------------------------------------
--  DDL for Table GIS_REL_PARAM
--------------------------------------------------------

  CREATE TABLE "GIS_REL_PARAM" 
   (	"GIS_REL_PARAM_ID" NUMBER(12,0), 
	"GIS_REL_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255), 
	"UNIT" VARCHAR2(50), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) ;
 

   COMMENT ON COLUMN "GIS_REL_PARAM"."GIS_REL_PARAM_ID" IS 'T�rinformatika objektum param�ter rel�ci�j�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."GIS_REL_ID" IS 'T�rinformatika objektum rel�ci�j�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."PARAM_TYPE_ID" IS 'Param�ter t�pus�nak azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."VALUE" IS '�rt�k';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."W_PARAM_TYPE" IS 'Param�ter t�pusa';
 
   COMMENT ON COLUMN "GIS_REL_PARAM"."STATUS_ID" IS 'Feldolgozotts�gi �llapot st�tusz t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON TABLE "GIS_REL_PARAM"  IS 'Code: GRPM';
