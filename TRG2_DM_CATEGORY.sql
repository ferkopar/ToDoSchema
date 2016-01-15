--------------------------------------------------------
--  DDL for Trigger TRG2_DM_CATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_CATEGORY" 
BEFORE INSERT OR UPDATE ON DM_CATEGORY FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.CAT_ID IS NULL OR :new.CAT_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.CAT_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_DM_CATEGORY;
/
ALTER TRIGGER "TRG2_DM_CATEGORY" ENABLE;
