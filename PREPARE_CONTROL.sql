--------------------------------------------------------
--  DDL for Procedure PREPARE_CONTROL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PREPARE_CONTROL" 
  AS
  BEGIN
    UPDATE TR_XL TX
      SET TX.CONTROL_COL_VALUE = TX.PARAM_VALUE, TX.CONTROL_VALUE = TX.PARAM_VALUE
      WHERE TX.STATUS_ID = 912;
  END;

/
