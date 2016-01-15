--------------------------------------------------------
--  DDL for View V_DM_EXCELL_COLUMNS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_DM_EXCELL_COLUMNS" ("DM_XL_ID", "LEAD_TYPE_ID", "W_LEAD_TYPE_NAME", "W_INC_TYPE_NAME", "INC_TYPE_ID", "PARAM_STATUS_TYPE_ID", "W_PARAM_TYPE_NAME", "PARAM_DATE_TYPE_ID", "W_PARAM_DATE_TYPE_NAME", "PARAM_UNIT_ID", "PARAM_UNIT", "LIST_TYPE_ID", "W_LIST_TYPE_NAME", "PARAM_TYPE_ID", "SHEET_NAME", "COLUMN_NO", "COLUMN_REG", "COLUMN_SIGN", "PRINT_TYPE", "FROM_DATE", "TO_DATE", "DESCRIPTION", "CRU", "MDU", "CRD", "MDD") AS 
  SELECT DM_XL_ID,
           DM_XL.LEAD_TYPE_ID,
           DM_XL.W_LEAD_TYPE_NAME,
           DM_XL.W_INC_TYPE_NAME,
           DM_XL.INC_TYPE_ID,
           DM_XL.PARAM_TYPE_ID,
           DM_XL.W_PARAM_TYPE_NAME,
           DM_XL.PARAM_DATE_TYPE_ID,
           DM_XL.W_PARAM_DATE_TYPE_NAME,
           DM_XL.PARAM_UNIT_ID,
           DM_XL.PARAM_UNIT,
           DM_XL.LIST_TYPE_ID,
           DM_XL.W_LIST_TYPE_NAME,
           DM_XL.PARAM_TYPE_ID,
           DM_XL.SHEET_NAME,
           DM_XL.ORDER_NO COLUMN_NO,
           DM_XL.ORDER_REG COLUMN_REG,
           DM_XL.ORDER_SIGN COLUMN_SIGN,
           DM_XL.PRINT_TYPE,
           DM_XL.PARAM_FDATE,
           DM_XL.PARAM_TDATE,
           DM_XL.DESCRIPTION,
           DM_XL.CRU,
           DM_XL.MDU,
           DM_XL.CRD,
           DM_XL.MDD
      FROM DM_XL
      WHERE REL_TYPE_ID = 42;
