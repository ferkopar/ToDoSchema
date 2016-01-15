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
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_PRT_IC_HEAD;
/
ALTER TRIGGER "TRG2_PRT_IC_HEAD" ENABLE;
