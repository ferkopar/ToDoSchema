--------------------------------------------------------
--  DDL for View V_TREATM_PRU_SCR
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_TREATM_PRU_SCR" ("TREATM_PRU_ID", "EDIT", "INVALIDATE", "SUBJ_ID", "SUBJ_NAME", "TYPE_ID", "TYPE_NAME", "PARAM_TYPE_ID", "PARAM_TYPE_NAME", "VALUE", "UNIT_TYPE_ID", "UNIT_TYPE_NAME", "EPI_ID", "MM_ID", "DESCRIPTION", "FROM_DATE", "TO_DATE", "STATUS_ID", "STATUS_NAME", "CRU", "CRD", "MDU", "MDD") AS 
  select 
 "TREATM_PRU_ID",
 "TREATM_PRU_ID" edit, 
 "TREATM_PRU_ID" invalidate,
 "SUBJ_ID",
 lookup_subj_name("SUBJ_ID") SUBJ_NAME,
 "TYPE_ID",
 lookup_super_type_name("TYPE_ID") TYPE_NAME,
 "PARAM_TYPE_ID",
  lookup_super_type_name("PARAM_TYPE_ID") PARAM_TYPE_NAME,
 "VALUE",
 "UNIT_TYPE_ID",
 lookup_super_type_name("UNIT_TYPE_ID") "UNIT_TYPE_NAME",
 "EPI_ID",
 "MM_ID",
 "DESCRIPTION",
 "FROM_DATE",
 "TO_DATE",
 "STATUS_ID",
  lookup_super_type_name("STATUS_ID") "STATUS_NAME",
 "CRU",
 "CRD",
 "MDU",
 "MDD"
from TREATM_PRU 
where status_id in (select super_typ_id from dm_super_typ where group_id = 911 );
