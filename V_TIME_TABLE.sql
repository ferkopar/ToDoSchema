--------------------------------------------------------
--  DDL for View V_TIME_TABLE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_TIME_TABLE" ("TT_START", "TT_END", "DESCRIPTION", "EPI_ID", "EPI_NAME", "EPI_TYPE_ID", "EPI_TYPE_NAME", "SUBJ_ID", "SUBJ_NAME") AS 
  select TT.TT_START,TT.TT_END,TT.DESCRIPTION,TT.EPI_ID,
       E.EPI_NAME,
e.epi_type_id,
(select super_type_name from dm_super_typ st where st.super_typ_id = e.epi_type_id) epi_type_name,
 P.SUBJ_ID,s.subj_name
from TIME_TABLE TT,EPI E, epi_subj_param p,subject s
where E.EPI_ID = TT.EPI_ID
and   E.EPI_ID = P.EPI_ID
and   P.PARAM_TYPE_ID = 5083222
and   p.subj_id = s.subj_id;
