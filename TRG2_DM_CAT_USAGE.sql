--------------------------------------------------------
--  DDL for Trigger TRG2_DM_CAT_USAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_CAT_USAGE" 
BEFORE INSERT OR UPDATE ON DM_CAT_USAGE FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.CAT_USAGE_ID IS NULL OR :new.CAT_USAGE_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.CAT_USAGE_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_DM_CAT_USAGE;
/
ALTER TRIGGER "TRG2_DM_CAT_USAGE" ENABLE;
