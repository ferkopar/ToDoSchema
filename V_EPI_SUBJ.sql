--------------------------------------------------------
--  DDL for View V_EPI_SUBJ
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_EPI_SUBJ" ("EPI_ID", "PARAM_TYPE_ID", "VALUE", "UNIT_TYPE_ID", "DESCRIPTION", "CRU", "CRD", "MDU", "MM_ID", "VALUE_TYPE_ID", "ORDER_NO", "UNIT", "FROM_CODE", "GIS_ID", "SUBJ_ID", "SUBJ_NAME") AS 
  SELECT 
--    EPI_SUBJ_PARAM_ID SUBJ_PARAM_ID, 
--    SUBJ_PARAM.SUBJ_ID , 
    EPI_ID, 
    PARAM_TYPE_ID, 
    VALUE, 
    UNIT_TYPE_ID, 
    SUBJ_PARAM.DESCRIPTION,
    SUBJ_PARAM.CRU, 
    SUBJ_PARAM.CRD, 
    SUBJ_PARAM.MDU, 
    MM_ID, 
    VALUE_TYPE_ID, 
    ORDER_NO, 
    UNIT, 
    FROM_CODE, 
    GIS_ID, 
    SUBJECTIV.SUBJ_ID, 
    SUBJECTIV.SUBJ_NAME
   
FROM 
    EPI_SUBJ_PARAM subj_param, 
    subject SUBJECTIV 
WHERE 
    SUBJECTIV.SUBJ_ID = SUBJ_PARAM.SUBJ_ID;
