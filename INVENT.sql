--------------------------------------------------------
--  DDL for Table INVENT
--------------------------------------------------------

  CREATE TABLE "INVENT" 
   (	"INVENT_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"GIS_ID" NUMBER(12,0), 
	"INVENT_TYPE_ID" NUMBER(12,0), 
	"MOVE_VALUE" NUMBER, 
	"RESERV_VALUE" NUMBER, 
	"INVENT_VALUE" NUMBER, 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"ORDER_VALUE" VARCHAR2(255), 
	"INVENT_NAME" VARCHAR2(2000), 
	"UNIT" VARCHAR2(50)
   ) ;
 

   COMMENT ON COLUMN "INVENT"."INVENT_ID" IS 'Anyag eszk�z lelt�r k�szltet t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."SUBJ_ID" IS 'Subjectiv egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."GIS_ID" IS 'T�rinformatika egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."INVENT_TYPE_ID" IS 'Riaszt�s t�pus�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."MOVE_VALUE" IS 'Mozg�s m�rt�ke plusz ha bev�tel minus ha fogy�s';
 
   COMMENT ON COLUMN "INVENT"."RESERV_VALUE" IS 'Foglalt k�szlet';
 
   COMMENT ON COLUMN "INVENT"."INVENT_VALUE" IS 'Aktu�lis lelt�r k�szlet �rt�ke';
 
   COMMENT ON COLUMN "INVENT"."UNIT_TYPE_ID" IS 'A k�szlet m�rt�kegys�ge';
 
   COMMENT ON COLUMN "INVENT"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "INVENT"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "INVENT"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "INVENT"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "INVENT"."ORDER_VALUE" IS 'A rendek�s mennyis�ge';
 
   COMMENT ON COLUMN "INVENT"."INVENT_NAME" IS 'Anyag eszk�z lelt�r k�szltet megnevez�se';
 
   COMMENT ON COLUMN "INVENT"."UNIT" IS 'M�rt�kegys�g';
 
   COMMENT ON TABLE "INVENT"  IS 'Anyag eszk�z lelt�r k�szltet
Code:EPIV';
