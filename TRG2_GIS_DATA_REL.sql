--------------------------------------------------------
--  DDL for Trigger TRG2_GIS_DATA_REL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_GIS_DATA_REL" 
BEFORE INSERT OR UPDATE ON GIS_DATA_REL FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.GIS_REL_ID IS NULL OR :new.GIS_REL_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.GIS_REL_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_GIS_DATA_REL;
/
ALTER TRIGGER "TRG2_GIS_DATA_REL" ENABLE;
