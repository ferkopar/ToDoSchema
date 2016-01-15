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
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_DM_MENU;
/
ALTER TRIGGER "TRG2_DM_MENU" ENABLE;
