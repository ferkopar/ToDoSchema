--------------------------------------------------------
--  DDL for Package DM_XL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DM_XL_TAPI" 
IS
type DM_XL_tapi_rec
IS
  record
  (
    CRU DM_XL.CRU%type ,
    PARAM_DATA_TYPE DM_XL.PARAM_DATA_TYPE%type ,
    TO_DATE DM_XL.TO_DATE%type ,
    MDU DM_XL.MDU%type ,
    PARAM_FDATE DM_XL.PARAM_FDATE%type ,
    ORDER_REG DM_XL.ORDER_REG%type ,
    PARAM_UNIT DM_XL.PARAM_UNIT%type ,
    ORDER_SIGN DM_XL.ORDER_SIGN%type ,
    PARAM_TDATE DM_XL.PARAM_TDATE%type ,
    MDD DM_XL.MDD%type ,
    W_REL_TYPE_NAME DM_XL.W_REL_TYPE_NAME%type ,
    W_LIST_TYPE_NAME DM_XL.W_LIST_TYPE_NAME%type ,
    TREATM_ID DM_XL.TREATM_ID%type ,
    PARAM_TYPE_ID DM_XL.PARAM_TYPE_ID%type ,
    VALUE_TABLE DM_XL.VALUE_TABLE%type ,
    PARAM_DATE_TYPE_ID DM_XL.PARAM_DATE_TYPE_ID%type ,
    DESCRIPTION DM_XL.DESCRIPTION%type ,
    PARAM_D2VALUE DM_XL.PARAM_D2VALUE%type ,
    ORDER_NO DM_XL.ORDER_NO%type ,
    DATA_OWNER_ID DM_XL.DATA_OWNER_ID%type ,
    PARAM_ADATE_TYPE_ID DM_XL.PARAM_ADATE_TYPE_ID%type ,
    W_PARAM_DATE_TYPE_NAME DM_XL.W_PARAM_DATE_TYPE_NAME%type ,
    FROM_DATE DM_XL.FROM_DATE%type ,
    PARAM_UNIT_ID DM_XL.PARAM_UNIT_ID%type ,
    W_PARAM_TYPE_NAME DM_XL.W_PARAM_TYPE_NAME%type ,
    REL_TYPE_ID DM_XL.REL_TYPE_ID%type ,
    CRD DM_XL.CRD%type ,
    VALUE_PARAM_ID DM_XL.VALUE_PARAM_ID%type ,
    MUTABLE DM_XL.MUTABLE%type ,
    PRINT_TYPE DM_XL.PRINT_TYPE%type ,
    W_PARAM_ADATE_TYPE_NAME DM_XL.W_PARAM_ADATE_TYPE_NAME%type ,
    SHEET_NAME DM_XL.SHEET_NAME%type ,
    PARAM_D1VALUE DM_XL.PARAM_D1VALUE%type ,
    LIST_TYPE_ID DM_XL.LIST_TYPE_ID%type ,
    DM_XL_ID DM_XL.DM_XL_ID%type );
type DM_XL_tapi_tab
IS
  TABLE OF DM_XL_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CRU                     IN DM_XL.CRU%type DEFAULT NULL ,
      p_PARAM_DATA_TYPE         IN DM_XL.PARAM_DATA_TYPE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_MDU                     IN DM_XL.MDU%type DEFAULT NULL ,
      p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
      p_MDD                     IN DM_XL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME         IN DM_XL.W_REL_TYPE_NAME%type DEFAULT NULL ,
      p_W_LIST_TYPE_NAME        IN DM_XL.W_LIST_TYPE_NAME%type DEFAULT NULL ,
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
      p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
      p_W_PARAM_DATE_TYPE_NAME  IN DM_XL.W_PARAM_DATE_TYPE_NAME%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_W_PARAM_TYPE_NAME       IN DM_XL.W_PARAM_TYPE_NAME%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_CRD                     IN DM_XL.CRD%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_W_PARAM_ADATE_TYPE_NAME IN DM_XL.W_PARAM_ADATE_TYPE_NAME%type DEFAULT NULL ,
      p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
      p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type );
  -- update
  PROCEDURE upd(
      p_CRU                     IN DM_XL.CRU%type DEFAULT NULL ,
      p_PARAM_DATA_TYPE         IN DM_XL.PARAM_DATA_TYPE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_MDU                     IN DM_XL.MDU%type DEFAULT NULL ,
      p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
      p_MDD                     IN DM_XL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME         IN DM_XL.W_REL_TYPE_NAME%type DEFAULT NULL ,
      p_W_LIST_TYPE_NAME        IN DM_XL.W_LIST_TYPE_NAME%type DEFAULT NULL ,
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
      p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
      p_W_PARAM_DATE_TYPE_NAME  IN DM_XL.W_PARAM_DATE_TYPE_NAME%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_W_PARAM_TYPE_NAME       IN DM_XL.W_PARAM_TYPE_NAME%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_CRD                     IN DM_XL.CRD%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_W_PARAM_ADATE_TYPE_NAME IN DM_XL.W_PARAM_ADATE_TYPE_NAME%type DEFAULT NULL ,
      p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
      p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type );
  -- delete
  PROCEDURE del(
      p_DM_XL_ID IN DM_XL.DM_XL_ID%type );

  FUNCTION max_order_no(p_list_type_id DM_XL.LIST_TYPE_ID%TYPE,
                        p_rel_type_id  DM_XL.REL_TYPE_ID%TYPE) 
    return DM_XL.ORDER_NO%TYPE;

  PROCEDURE add(p_DM_XL_ID_SRC IN DM_XL.DM_XL_ID%type,
                p_DM_XL_ID_DST IN DM_XL.DM_XL_ID%type  DEFAULT NULL,
                p_LIST_TYPE_ID IN DM_XL.LIST_TYPE_ID%type  DEFAULT NULL);

  PROCEDURE insert_or_update(
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type, 
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL 
      
  );
END DM_XL_tapi;

/
