--------------------------------------------------------
--  DDL for Trigger TRG2_DM_MENU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_MENU" 
BEFORE INSERT OR UPDATE ON DM_MENU FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.MENU_ID IS NULL OR :new.MENU_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.MENU_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_DM_MENU;
/
ALTER TRIGGER "TRG2_DM_MENU" ENABLE;
