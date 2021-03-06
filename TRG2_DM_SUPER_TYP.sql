--------------------------------------------------------
--  DDL for Trigger TRG2_DM_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_SUPER_TYP" 
BEFORE INSERT OR UPDATE ON DM_SUPER_TYP FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.SUPER_TYP_ID IS NULL OR :new.SUPER_TYP_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.SUPER_TYP_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_DM_SUPER_TYP;
/
ALTER TRIGGER "TRG2_DM_SUPER_TYP" ENABLE;
