--------------------------------------------------------
--  DDL for Trigger TRG2_EPI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_EPI" 
BEFORE INSERT OR UPDATE ON EPI FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.EPI_ID IS NULL OR :new.EPI_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.EPI_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_EPI;
/
ALTER TRIGGER "TRG2_EPI" ENABLE;
