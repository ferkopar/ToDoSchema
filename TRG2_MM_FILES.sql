--------------------------------------------------------
--  DDL for Trigger TRG2_MM_FILES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_MM_FILES" 
BEFORE INSERT OR UPDATE ON MM_FILES FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.MM_ID IS NULL OR :new.MM_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.MM_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_MM_FILES;
/
ALTER TRIGGER "TRG2_MM_FILES" ENABLE;
