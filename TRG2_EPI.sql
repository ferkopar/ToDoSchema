--------------------------------------------------------
--  DDL for Trigger TRG2_EPI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_EPI" 
BEFORE INSERT OR UPDATE ON EPI FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.EPI_ID IS NULL OR :new.EPI_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.EPI_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_EPI;
/
ALTER TRIGGER "TRG2_EPI" ENABLE;
