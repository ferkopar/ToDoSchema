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
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_TR_XL;
/
ALTER TRIGGER "TRG2_TR_XL" ENABLE;
