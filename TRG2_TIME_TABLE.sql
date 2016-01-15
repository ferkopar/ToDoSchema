--------------------------------------------------------
--  DDL for Trigger TRG2_TIME_TABLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_TIME_TABLE" 
BEFORE INSERT OR UPDATE ON TIME_TABLE FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.TIME_ID IS NULL OR :new.TIME_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.TIME_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_TIME_TABLE;
/
ALTER TRIGGER "TRG2_TIME_TABLE" ENABLE;
