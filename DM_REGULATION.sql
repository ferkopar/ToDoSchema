--------------------------------------------------------
--  DDL for Table DM_REGULATION
--------------------------------------------------------

  CREATE TABLE "DM_REGULATION" 
   (	"REGUL_ID" NUMBER(12,0), 
	"REGUL_NAME" VARCHAR2(100), 
	"REGUL_TYPE_ID" NUMBER(12,0), 
	"TYPE_TABLE1" VARCHAR2(30), 
	"TYPE_TYPE1" VARCHAR2(255), 
	"TYPE_VALUE1" VARCHAR2(255), 
	"TYPE_COLUMN1" VARCHAR2(30), 
	"TYPE_TABLE2" VARCHAR2(30), 
	"TYPE_TYPE2" VARCHAR2(255), 
	"TYPE_COLUMN2" VARCHAR2(30), 
	"APEX_PAGE" NUMBER, 
	"APEX_VARIABLE" VARCHAR2(255), 
	"TPRIORITY" NUMBER(*,0), 
	"TOPTIONAL" VARCHAR2(1) DEFAULT 'Y', 
	"DESCRIPTION" VARCHAR2(255), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30), 
	"MDD" TIMESTAMP (6), 
	"TYPE_VALUE2" VARCHAR2(255), 
	"TYPE_TABLE3" VARCHAR2(30), 
	"TYPE_TYPE3" VARCHAR2(255), 
	"TYPE_VALUE3" VARCHAR2(255), 
	"TYPE_COLUMN3" VARCHAR2(30), 
	"W_TYPE_NAME3" VARCHAR2(30), 
	"W_TYPE_NAME1" VARCHAR2(30), 
	"W_TYPE_NAME2" VARCHAR2(30), 
	"TYPE_CONTROL1" VARCHAR2(1), 
	"TYPE_CONTROL2" VARCHAR2(1), 
	"TYPE_CONTROL3" VARCHAR2(1), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"ROLE_ID" NUMBER(12,0), 
	"TYPE_TABLE4" VARCHAR2(30), 
	"TYPE_COLUMN4" VARCHAR2(30), 
	"TYPE_TYPE4" VARCHAR2(255), 
	"TYPE_VALUE4" VARCHAR2(255), 
	"TYPE_CONTROL4" VARCHAR2(1), 
	"MM_ID" NUMBER(12,0), 
	"TCRITERION" VARCHAR2(4000), 
	"W_ERROR" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "DM_REGULATION"."REGUL_ID" IS 'Szab�ly egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."REGUL_NAME" IS 'Szab�ly neve';
 
   COMMENT ON COLUMN "DM_REGULATION"."REGUL_TYPE_ID" IS 'Szab�ly t�pusa';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE1" IS 'Szab�lyban vizsg�land� t�bla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE1" IS 'Szab�lyban vizsg�land� t�pus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE1" IS 'Szab�lyban vizsg�land� t�pus �rt�ke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN1" IS 'Szab�lyban vizsg�land� oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE2" IS 'Szab�lyban vizsg�land� t�bla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE2" IS 'Szab�lyban vizsg�land� t�pus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN2" IS 'Szab�lyban vizsg�land� oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."APEX_PAGE" IS 'Apex oldal';
 
   COMMENT ON COLUMN "DM_REGULATION"."APEX_VARIABLE" IS 'APEX v�ltoz� �rt�k�nek visszaad�sa';
 
   COMMENT ON COLUMN "DM_REGULATION"."TPRIORITY" IS 'Priorit�s';
 
   COMMENT ON COLUMN "DM_REGULATION"."TOPTIONAL" IS 'V�laszthat�s�g Y-Igen N-Nem O-Opcion�lis';
 
   COMMENT ON COLUMN "DM_REGULATION"."DESCRIPTION" IS 'Le�r�s';
 
   COMMENT ON COLUMN "DM_REGULATION"."FROM_DATE" IS '�rv�nyess�g kezd� id�pontja';
 
   COMMENT ON COLUMN "DM_REGULATION"."TO_DATE" IS '�rv�nyess�g v�ge';
 
   COMMENT ON COLUMN "DM_REGULATION"."CRU" IS 'Rekord L�trehoz�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."CRD" IS 'Rekord L�trehoz�s�nak id�pecs�tje';
 
   COMMENT ON COLUMN "DM_REGULATION"."MDU" IS 'Rekord M�dos�t�j�nak Azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."MDD" IS 'Rekord M�dos�t�s�nak Id�pecs�tje';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE2" IS 'Szab�lyban vizsg�land� t�pus �rt�ke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE3" IS 'Szab�lyban vizsg�land� t�bla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE3" IS 'Szab�lyban vizsg�land� t�pus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE3" IS 'Szab�lyban vizsg�land� t�pus �rt�ke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN3" IS 'Szab�lyban vizsg�land� oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL1" IS 'Szab�lyban vizsg�land� control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL2" IS 'Szab�lyban vizsg�land� control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL3" IS 'Szab�lyban vizsg�land� control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."STATUS_ID" IS 'Az adat st�tusz�nak, feldolgozotts�g�nak egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."ROLE_ID" IS 'Szab�ly egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE4" IS 'Szab�lyban vizsg�land� t�bla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN4" IS 'Szab�lyban vizsg�land� oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE4" IS 'Szab�lyban vizsg�land� t�pus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE4" IS 'Szab�lyban vizsg�land� t�pus �rt�ke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL4" IS 'Szab�lyban vizsg�land� control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."MM_ID" IS 'Kapcsol�d� dokumentum egyedi azonos�t�ja';
 
   COMMENT ON COLUMN "DM_REGULATION"."TCRITERION" IS 'Krit�rium, szab�ly le�r�sa';
 
   COMMENT ON TABLE "DM_REGULATION"  IS 'Szab�ly rendszert leir� t�bla
Code: DMRG';
