--------------------------------------------------------
--  DDL for View V_ORGANIZATIONS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_ORGANIZATIONS" ("SUBJ_ID", "FROM_DATE", "TO_DATE", "SUBJ_CATEGORY_ID", "SUBJ_NAME") AS 
  SELECT 
  subj_id,
  from_date,
  TO_DATE,
  SUBJ_CATEGORY_ID,
  GET_SUBJECT_NAME (SUBJ_ID ) subj_name
  from subject where SUBJ_CATEGORY_ID=103 order by SUBJ_ID;
