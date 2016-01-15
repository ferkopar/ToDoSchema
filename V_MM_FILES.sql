--------------------------------------------------------
--  DDL for View V_MM_FILES
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_MM_FILES" ("MM_ID", "MM_TYPE_ID", "EPI_ID", "MM_HYPL", "MM_BLOB", "MAIN_TYPE", "FILE_NAME", "MM_CHARSET", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD", "TITLE", "SUBJ_ID", "STAT_TYPE_ID") AS 
  SELECT MM_ID,
  MM_TYPE_ID,
  EPI_ID,
  MM_HYPL,
  MM_BLOB,
  MAIN_TYPE,
  FILE_NAME,
  MM_CHARSET,
  DESCRIPTION,
  CRU,
  CRD,
  MDU,
  MDD,
  TITLE,
  SUBJ_ID,
  STATUS_ID
  
FROM MM_FILES
  WHERE BASE_PKG.RIGHTS_READ_ROW_F('MM_FILES',MM_ID,STATUS_ID)='Y';
