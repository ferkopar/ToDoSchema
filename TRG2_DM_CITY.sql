--------------------------------------------------------
--  DDL for Trigger TRG2_DM_CITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_CITY" 
BEFORE INSERT OR UPDATE ON DM_CITY FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.DM_CITY_ID IS NULL OR :new.DM_CITY_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.DM_CITY_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_DM_CITY;
/
ALTER TRIGGER "TRG2_DM_CITY" ENABLE;
