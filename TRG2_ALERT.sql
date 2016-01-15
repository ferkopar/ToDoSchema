--------------------------------------------------------
--  DDL for Trigger TRG2_ALERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_ALERT" 
BEFORE INSERT OR UPDATE ON ALERT FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.ALERT_ID IS NULL OR :new.ALERT_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.ALERT_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_ALERT;
/
ALTER TRIGGER "TRG2_ALERT" ENABLE;
