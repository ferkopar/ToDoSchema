--------------------------------------------------------
--  DDL for Trigger TRG2_INVENT_PARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_INVENT_PARAM" 
BEFORE INSERT OR UPDATE ON INVENT_PARAM FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.INVENT_PARAM_ID IS NULL OR :new.INVENT_PARAM_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.INVENT_PARAM_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_INVENT_PARAM;
/
ALTER TRIGGER "TRG2_INVENT_PARAM" ENABLE;
