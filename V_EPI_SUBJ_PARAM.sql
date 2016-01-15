--------------------------------------------------------
--  DDL for View V_EPI_SUBJ_PARAM
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_EPI_SUBJ_PARAM" ("EPI_SUBJ_ID", "SUBJ_ID", "EPI_ID", "PARAM_TYPE_ID", "VALUE_TYPE_ID", "VALUE", "UNIT_TYPE_ID", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD") AS 
  SELECT "EPI_SUBJ_ID",
    "SUBJ_ID",
    "EPI_ID",
    "PARAM_TYPE_ID",
    "VALUE_TYPE_ID",
    "VALUE",
    "UNIT_TYPE_ID",
    "DESCRIPTION",
   -- "STAT_TYPE_ID",
    "CRU",
    "CRD",
    "MDU",
    "MDD"
  FROM EPI_SUBJ_PARAM
  WHERE BASE_PKG.RIGHTS_READ_ROW_F('EPI_SUBJ_PARAM',SUBJ_ID,3)='Y';
