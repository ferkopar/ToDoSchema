--------------------------------------------------------
--  DDL for View V_SUBJ_REL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_SUBJ_REL" ("SUBJ_REL_ID", "SUBJ_ID1", "SUBJ_ID2", "STAT_TYPE_ID", "REL_TYPE_ID", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD", "W_REL_TYPE", "EPI_ID") AS 
  SELECT SUBJ_REL_ID,
  SUBJ_ID1,
  SUBJ_ID2,
  STATUS_ID,
  REL_TYPE_ID,
  DESCRIPTION,
  CRU,
  CRD,
  MDU,
  MDD,
  W_REL_TYPE,
  EPI_ID
FROM SUBJ_REL 
where BASE_PKG.RIGHTS_READ_ROW_F('SUBJ_REL',SUBJ_REL_ID,STATUS_ID)='Y';
