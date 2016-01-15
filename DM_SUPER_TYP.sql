--------------------------------------------------------
--  DDL for Table DM_SUPER_TYP
--------------------------------------------------------

  CREATE TABLE "DM_SUPER_TYP" 
   (	"SUPER_TYP_ID" NUMBER(12,0), 
	"GROUP_ID" NUMBER(12,0), 
	"GROUND_LEVEL_ID" NUMBER(12,0), 
	"SUPER_TYPE_NAME" VARCHAR2(255), 
	"SUPER_TYPE_SHORT_NAME" VARCHAR2(50), 
	"SUPER_GROUP_NAME" VARCHAR2(255), 
	"SLEVEL" NUMBER(3,0), 
	"ROLL_TYPE" NUMBER(1,0) DEFAULT 0, 
	"FROM_DATE" DATE DEFAULT SYSDATE, 
	"TO_DATE" DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS'), 
	"WIRED_TO" NVARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"USE_COMMENT" VARCHAR2(255), 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"WK_CLASS_ID" NUMBER(12,0)
   ) ;
 

   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYP_ID" IS 'A t�bla egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUP_ID" IS 'A t�pus csoportj�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUND_LEVEL_ID" IS 'A csoporton bel�li szint';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_NAME" IS 'A t�pus megnevez�se';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_SHORT_NAME" IS 'A t�pus r�vid neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_GROUP_NAME" IS 'A t�pus besorol�si csoportj�nak a neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SLEVEL" IS 'A meghat�roz�  t�pus�nak hierarciai szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."ROLL_TYPE" IS 'A felviv� szerepk�r szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."FROM_DATE" IS 'Az adatok �rv�nyess�g�nek kezdete';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."TO_DATE" IS 'Az adatok �rv�nyess�g�nek v�ge';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."USE_COMMENT" IS 'Karbantart�si jogosults�g szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON TABLE "DM_SUPER_TYP"  IS 'A rendszer m�k�d�si t�pusainak rel�ci� t�bl�ja (Table code: DSRT)';
