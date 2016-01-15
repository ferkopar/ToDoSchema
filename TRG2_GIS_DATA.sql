--------------------------------------------------------
--  DDL for Trigger TRG2_GIS_DATA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_GIS_DATA" 
BEFORE INSERT OR UPDATE ON GIS_DATA FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.GIS_ID IS NULL OR :new.GIS_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.GIS_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_GIS_DATA;
/
ALTER TRIGGER "TRG2_GIS_DATA" ENABLE;
