--------------------------------------------------------
--  DDL for View V_DM_XL_REL_SOR_SOR
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_DM_XL_REL_SOR_SOR" ("DM_XL_REL_ID", "DM_XL_ID1", "PARAM_TYPE_ID1", "DM_XL_ID2", "PARAM_TYPE_ID2", "MATHOP", "CONNUM", "FROM_DATE", "TO_DATE") AS 
  SELECT "DM_XL_REL_ID"
  ,"DM_XL_ID1"
  ,"PARAM_TYPE_ID1"
  ,"DM_XL_ID2"
  ,"PARAM_TYPE_ID2"
  ,"MATHOP"
  ,"CONNUM"
  ,"FROM_DATE"
  ,"TO_DATE"
  FROM v_dm_xl_rel
  WHERE REL_TYPE_ID = 44;
