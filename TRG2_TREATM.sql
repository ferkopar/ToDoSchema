--------------------------------------------------------
--  DDL for Trigger TRG2_TREATM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_TREATM" 
BEFORE INSERT OR UPDATE ON TREATM FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.TREATM_ID IS NULL OR :new.TREATM_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.TREATM_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_TREATM;
/
ALTER TRIGGER "TRG2_TREATM" ENABLE;
