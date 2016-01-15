--------------------------------------------------------
--  DDL for Trigger TRG2_DM_XL_REL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_XL_REL" 
BEFORE INSERT OR UPDATE ON DM_XL_REL FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.DM_XL_REL_ID IS NULL OR :new.DM_XL_REL_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.DM_XL_REL_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_DM_XL_REL;
/
ALTER TRIGGER "TRG2_DM_XL_REL" ENABLE;
