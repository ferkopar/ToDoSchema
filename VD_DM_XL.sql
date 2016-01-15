--------------------------------------------------------
--  DDL for View VD_DM_XL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VD_DM_XL" ("DM_XL_ID", "TREATM_ID", "TREATM_NAME", "PARAM_UNIT_ID", "PARAM_UNIT", "PARAM_TYPE_ID", "PARAM_TYPE", "LIST_TYPE_ID", "LIST_TYPE", "REL_TYPE_ID", "REL_TYPE", "ORDER_NO", "ORDER_SIGN", "ORDER_REG", "PRINT_TYPE", "FROM_DATE", "TO_DATE", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD", "DATA_OWNER_ID", "PARAM_TDATE", "PARAM_ADATE_TYPE_ID", "SHEET_NAME", "PARAM_D1VALUE", "PARAM_D2VALUE", "MUTABLE", "PARAM_FDATE", "VALUE_TABLE", "VALUE_PARAM_ID", "PARAM_DATA_TYPE", "W_REL_TYPE_NAME", "W_PARAM_TYPE_NAME", "W_LIST_TYPE_NAME", "W_PARAM_ADATE_TYPE_NAME", "W_PARAM_DATE_TYPE_NAME", "PARAM_DATE_TYPE_ID") AS 
  SELECT dx.DM_XL_ID,
           dx.TREATM_ID,
           (SELECT treatm_name
               FROM TREATM t
               WHERE dx.TREATM_ID = t.TREATM_ID) TREATM_NAME,
           dx.PARAM_UNIT_ID,
           LOOKUP_SUPER_TYPE_NAME(dx.PARAM_UNIT_ID) PARAM_UNIT,
           dx.PARAM_TYPE_ID,
           LOOKUP_SUPER_TYPE_NAME(dx.PARAM_TYPE_ID) PARAM_TYPE,
           dx.LIST_TYPE_ID,
           LOOKUP_SUPER_TYPE_NAME(dx.LIST_TYPE_ID) LIST_TYPE,
           dx.REL_TYPE_ID,
           LOOKUP_SUPER_TYPE_NAME(dx.REL_TYPE_ID) REL_TYPE,
           dx.ORDER_NO,
           dx.ORDER_SIGN,
           dx.ORDER_REG,
           dx.PRINT_TYPE,
           dx.FROM_DATE,
           dx.TO_DATE,
           dx.DESCRIPTION,
           dx.CRU,
           dx.CRD,
           dx.MDU,
           dx.MDD,
           dx.DATA_OWNER_ID,
           dx.PARAM_TDATE,
           dx.PARAM_ADATE_TYPE_ID,
           dx.SHEET_NAME,
           dx.PARAM_D1VALUE,
           dx.PARAM_D2VALUE,
           dx.MUTABLE,
           dx.PARAM_FDATE,
           dx.VALUE_TABLE,
           dx.VALUE_PARAM_ID,
           dx.PARAM_DATA_TYPE,
           dx.W_REL_TYPE_NAME,
           dx.W_PARAM_TYPE_NAME,
           dx.W_LIST_TYPE_NAME,
           dx.W_PARAM_ADATE_TYPE_NAME,
           dx.W_PARAM_DATE_TYPE_NAME,
           dx.PARAM_DATE_TYPE_ID
      FROM DM_XL dx;
