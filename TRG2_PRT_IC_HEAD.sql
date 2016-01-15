--------------------------------------------------------
--  DDL for Trigger TRG2_PRT_IC_HEAD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_PRT_IC_HEAD" 
BEFORE INSERT OR UPDATE ON PRT_IC_HEAD FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.IC_ID IS NULL OR :new.IC_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.IC_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_PRT_IC_HEAD;
/
ALTER TRIGGER "TRG2_PRT_IC_HEAD" ENABLE;
