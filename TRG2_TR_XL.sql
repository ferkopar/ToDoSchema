--------------------------------------------------------
--  DDL for Trigger TRG2_TR_XL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_TR_XL" 
BEFORE INSERT OR UPDATE ON TR_XL FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.TR_XL_ID IS NULL OR :new.TR_XL_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.TR_XL_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_TR_XL;
/
ALTER TRIGGER "TRG2_TR_XL" ENABLE;
