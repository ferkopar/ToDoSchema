--------------------------------------------------------
--  DDL for View V_PF_DM_XL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_PF_DM_XL" ("DM_XL_ID", "PARAM_TYPE_ID", "LIST_TYPE_ID", "REL_TYPE_ID", "ORDER_NO", "ORDER_SIGN", "ORDER_REG", "PRINT_TYPE", "MUTABLE", "VALUE_TABLE", "VALUE_PARAM_ID", "PARAM_DATA_TYPE") AS 
  SELECT DM_XL.DM_XL_ID,
       DM_XL.PARAM_TYPE_ID,
       DM_XL.LIST_TYPE_ID,
       DM_XL.REL_TYPE_ID,
       DM_XL.ORDER_NO,
       DM_XL.ORDER_SIGN,
       DM_XL.ORDER_REG,
       DM_XL.PRINT_TYPE,
       DM_XL.MUTABLE,
       DM_XL.VALUE_TABLE,
       DM_XL.VALUE_PARAM_ID,
       DM_XL.PARAM_DATA_TYPE
  FROM DM_XL;
