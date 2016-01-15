--------------------------------------------------------
--  DDL for Trigger TRG2_WK_STAGE_STREET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_WK_STAGE_STREET" 
BEFORE INSERT ON WK_STAGE_STREET FOR EACH ROW
BEGIN
 
    IF :new.STREET_ID IS NULL OR :new.STREET_ID = 0
      THEN
SELECT SEQ_BASE.NEXTVAL
  INTO :NEW.STREET_ID
  FROM DUAL;
END IF;
END TRG_TREATM_PRU;

/
ALTER TRIGGER "TRG2_WK_STAGE_STREET" ENABLE;
