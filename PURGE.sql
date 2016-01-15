--------------------------------------------------------
--  DDL for Procedure PURGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PURGE" 
  AS
  BEGIN
    DELETE FROM ALERT_PARAM ap;
    DELETE FROM ALERT a;
    DELETE FROM TREATM t
      WHERE t.TREATM_GROUP_ID = 1604;
  END;

/
