--------------------------------------------------------
--  DDL for View V_LIST_SUBJ
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_LIST_SUBJ" ("SUBJ_ID", "SUBJ_NAME", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD") AS 
  SELECT 
    SUBJ_ID, 
    SUBJ_NAME, 
    DESCRIPTION, 
    CRU, 
    CRD, 
    MDU, 
    MDD

FROM 
    SUBJECT;
