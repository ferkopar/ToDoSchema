--------------------------------------------------------
--  DDL for View V_LOG_TABLE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_LOG_TABLE" ("LOG_ID", "OPERATION_TYPE", "OPERATION_TIME", "TABLE_NAME", "RECORD_ID", "USER_NAME", "COLUMN_NAME", "OLD_VALUE", "NEW_VALUE", "EPI_ID") AS 
  SELECT LOG_ID,
    OPERATION_TYPE,
    OPERATION_TIME,
    TABLE_NAME,
    RECORD_ID,
    USER_NAME,
    COLUMN_NAME,
    OLD_VALUE,
    NEW_VALUE,
    EPI_ID
  FROM LOG_TABLE
  --WHERE DENTAL_PKG.RIGHTS_READ_ROW_F('LOG_TABLE',LOG_ID,NULL)='Y';;;;;;
