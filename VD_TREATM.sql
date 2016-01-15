--------------------------------------------------------
--  DDL for View VD_TREATM
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VD_TREATM" ("TREATM_ID", "TREATM_NAME", "TREATM_GROUP_ID", "TREATM_GROUP_NAME", "TREATM_TYPE_ID", "TREATM_TYPE_NAME", "TREATM_CATEGORY_ID", "TREATM_CATEGORY_NAME", "MM_ID", "TIME_START", "TIME_END", "SUBJ1_ID", "SUBJ1_NAME", "TYPE1_ID", "TYPE1_NAME", "SUBJ2_ID", "SUBJ2_NAME", "TYPE2_ID", "TYPE2_NAME", "DESCRIPTION", "CRU", "CRD", "MDD", "MDU", "FROM_DATE", "TO_DATE", "TREATM_NAME_ID") AS 
  SELECT t.TREATM_ID,
           t.TREATM_NAME,
           t.TREATM_GROUP_ID,
           LOOKUP_SUPER_TYPE_NAME(t.TREATM_GROUP_ID) TREATM_GROUP_NAME,
           t.TREATM_TYPE_ID,
           LOOKUP_SUPER_TYPE_NAME(t.TREATM_TYPE_ID) TREATM_TYPE_NAME,
           t.TREATM_CATEGORY_ID,
           LOOKUP_SUPER_TYPE_NAME(t.TREATM_CATEGORY_ID) TREATM_CATEGORY_NAME,
           t.MM_ID,
           t.TIME_START,
           t.TIME_END,
           t.SUBJ1_ID,
           LOOKUP_SUBJ_NAME(t.SUBJ1_ID) SUBJ1_NAME,
           t.TYPE1_ID,
           LOOKUP_SUPER_TYPE_NAME(t.TYPE1_ID) TYPE1_NAME,
           t.SUBJ2_ID,
           LOOKUP_SUBJ_NAME(t.SUBJ2_ID) SUBJ2_NAME,
           t.TYPE2_ID,
           LOOKUP_SUPER_TYPE_NAME(t.TYPE2_ID) TYPE2_NAME,
           t.DESCRIPTION,
           t.CRU,
           t.CRD,
           t.MDD,
           t.MDU,
           t.FROM_DATE,
           t.TO_DATE,
           t.TREATM_NAME_ID
      FROM TREATM t;
