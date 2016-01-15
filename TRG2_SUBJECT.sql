--------------------------------------------------------
--  DDL for Trigger TRG2_SUBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_SUBJECT" 
BEFORE INSERT OR UPDATE ON SUBJECT FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.SUBJ_ID IS NULL OR :new.SUBJ_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.SUBJ_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI MÓDOSÍT
      END IF;
      END TRG_SUBJECT;
/
ALTER TRIGGER "TRG2_SUBJECT" ENABLE;
