--------------------------------------------------------
--  DDL for Trigger TRG2_DM_NAMES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_NAMES" 
BEFORE INSERT OR UPDATE ON DM_NAMES FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.NAMES_ID IS NULL OR :new.NAMES_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.NAMES_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_DM_NAMES;
/
ALTER TRIGGER "TRG2_DM_NAMES" ENABLE;
