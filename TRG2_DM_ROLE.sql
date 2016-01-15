--------------------------------------------------------
--  DDL for Trigger TRG2_DM_ROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_ROLE" 
BEFORE INSERT OR UPDATE ON DM_ROLE FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.ROLE_ID IS NULL OR :new.ROLE_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.ROLE_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_DM_ROLE;
/
ALTER TRIGGER "TRG2_DM_ROLE" ENABLE;
