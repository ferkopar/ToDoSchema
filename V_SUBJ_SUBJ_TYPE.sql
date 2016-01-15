--------------------------------------------------------
--  DDL for View V_SUBJ_SUBJ_TYPE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_SUBJ_SUBJ_TYPE" ("SUBJ_ID", "SUBJ_NAME", "SUBJ_TYPE_ID", "SUBJ_TYPE") AS 
  select distinct
       SUBJECT.SUBJ_ID,
       LOOKUP_SUBJ_NAME(SUBJECT.SUBJ_ID) subj_name,
       SUBJ_TYPE_ID,
       LOOKUP_SUPER_TYPE_NAME(SUBJ_TYPE_ID) subj_type
       from SUBJECT, SUBJ_PARAM
  WHERE SUBJ_PARAM.SUBJ_ID = SUBJECT.SUBJ_ID;
