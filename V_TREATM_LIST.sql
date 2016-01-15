--------------------------------------------------------
--  DDL for View V_TREATM_LIST
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_TREATM_LIST" ("TREATM_ID", "COPY", "COPY_N", "COPY_T", "INVALIDATE", "TREATM_NAME", "TREATM_GROUP_NAME", "TREATM_TYPE_NAME", "STATUS_ID", "STATUS_NAME", "STATE_START_ID", "STATE_END_ID", "TREATM_CATEGORY_NAME", "EPI_ID", "MM_ID", "FROM_DATE", "TO_DATE", "TIME_START", "TIME_END", "SUBJ1_ID", "SUBJ1_NAME", "TYPE1_ID", "TYPE1_NAME", "SUBJ2_ID", "SUBJ2_NAME", "TYPE2_ID", "TYPE2_NAME", "DESCRIPTION", "CRU", "CRD", "MDD", "MDU") AS 
  select 
 "TREATM_ID",
"TREATM_ID" COPY,
"TREATM_ID" COPY_N,
"TREATM_ID" COPY_T,
"TREATM_ID" INVALIDATE,
"TREATM_NAME",
lookup_super_type_name("TREATM_GROUP_ID") TREATM_GROUP_NAME,
lookup_super_type_name("TREATM_TYPE_ID") TREATM_TYPE_NAME,
"STATUS_ID",
lookup_super_type_name("STATUS_ID") STATUS_NAME,
"STATE_START_ID",
"STATE_END_ID",
lookup_super_type_name("TREATM_CATEGORY_ID") TREATM_CATEGORY_NAME,
"EPI_ID",
"MM_ID",
"FROM_DATE",
"TO_DATE",
"TIME_START",
"TIME_END",
"SUBJ1_ID",
lookup_subj_name(SUBJ1_ID) SUBJ1_NAME,
"TYPE1_ID",
lookup_super_type_name("TYPE1_ID") TYPE1_NAME,
"SUBJ2_ID",
lookup_subj_name(SUBJ1_ID) SUBJ2_NAME,
"TYPE2_ID",
lookup_super_type_name("TYPE2_ID") TYPE2_NAME,
"DESCRIPTION",
"CRU",
"CRD",
"MDD",
"MDU"
from TREATM;
