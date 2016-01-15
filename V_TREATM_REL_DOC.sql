--------------------------------------------------------
--  DDL for View V_TREATM_REL_DOC
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_TREATM_REL_DOC" ("TREATM_REL_ID", "DOC_ID", "DOC_GROUP_ID", "DOC_NAME", "TREATM_ID", "TREATM_GROUP_ID", "TREATM_NAME") AS 
  SELECT tr.TREATM_REL_ID,
           tr.TREATM_ID1 doc_id,
           (SELECT tt.treatm_group_id
               FROM treatm tt
               WHERE tt.treatm_id = tr.TREATM_ID1) doc_group_id,
           (SELECT tt.treatm_name
               FROM treatm tt
               WHERE tt.treatm_id = tr.TREATM_ID1) doc_name,
           tr.TREATM_ID2 treatm_id,
           (SELECT tt.treatm_group_id
               FROM treatm tt
               WHERE tt.treatm_id = tr.TREATM_ID2) treatm_group_id,
           (SELECT tt.treatm_name
               FROM treatm tt
               WHERE tt.treatm_id = tr.TREATM_ID2) treatm_name
      FROM TREATM_REL tr
      WHERE tr.REL_TYPE_ID = 1308590191;
