--------------------------------------------------------
--  DDL for Trigger TRG2_EPI_PARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_EPI_PARAM" 
BEFORE INSERT OR UPDATE ON EPI_PARAM FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.EPI_SUBJ_ID IS NULL OR :new.EPI_SUBJ_ID = 0
      THEN
      SELECT SEQ_BASE.NEXTVAL
      INTO :NEW.EPI_SUBJ_ID
      FROM DUAL;
      END IF;
      :new.CRD := SYSTIMESTAMP;      --L�TREHOZ�S ID�PONTJA 
      :NEW.CRU := NVL(V('APP_USER'), USER); --APEX USER AKI L�TREHOZZA A REKORDOT
      ELSIF UPDATING
      THEN
      :new.MDD := SYSTIMESTAMP;      --M�DOS�T�S ID�PONTJA
      :NEW.MDU := NVL(V('APP_USER'), USER); --APEX USER AKI M�DOS�T
      END IF;
      END TRG_EPI_PARAM;
/
ALTER TRIGGER "TRG2_EPI_PARAM" ENABLE;
