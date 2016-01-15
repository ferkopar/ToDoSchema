--------------------------------------------------------
--  DDL for Package DM_XL_REL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DM_XL_REL_TAPI" 
IS
type DM_XL_REL_tapi_rec
IS
  record
  (
    CRU DM_XL_REL.CRU%type ,
    DM_XL_ID3 DM_XL_REL.DM_XL_ID3%type ,
    DM_XL_ID2 DM_XL_REL.DM_XL_ID2%type ,
    DM_XL_ID1 DM_XL_REL.DM_XL_ID1%type ,
    W_ORDER_NO2 DM_XL_REL.W_ORDER_NO2%type ,
    W_ORDER_NO3 DM_XL_REL.W_ORDER_NO3%type ,
    TO_DATE DM_XL_REL.TO_DATE%type ,
    W_ORDER_REG DM_XL_REL.W_ORDER_REG%type ,
    DESCRIPTION DM_XL_REL.DESCRIPTION%type ,
    DM_XL_REL_ID DM_XL_REL.DM_XL_REL_ID%type ,
    MDU DM_XL_REL.MDU%type ,
    MATHOP DM_XL_REL.MATHOP%type ,
    W_ORDER_NO1 DM_XL_REL.W_ORDER_NO1%type ,
    FROM_DATE DM_XL_REL.FROM_DATE%type ,
    CONNUM DM_XL_REL.CONNUM%type ,
    REL_TYPE_ID DM_XL_REL.REL_TYPE_ID%type ,
    CRD DM_XL_REL.CRD%type ,
    MDD DM_XL_REL.MDD%type ,
    W_REL_TYPE_NAME DM_XL_REL.W_REL_TYPE_NAME%type );
type DM_XL_REL_tapi_tab
IS
  TABLE OF DM_XL_REL_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CRU             IN DM_XL_REL.CRU%type DEFAULT NULL ,
      p_DM_XL_ID3       IN DM_XL_REL.DM_XL_ID3%type DEFAULT NULL ,
      p_DM_XL_ID2       IN DM_XL_REL.DM_XL_ID2%type ,
      p_DM_XL_ID1       IN DM_XL_REL.DM_XL_ID1%type ,
      p_W_ORDER_NO2     IN DM_XL_REL.W_ORDER_NO2%type DEFAULT NULL ,
      p_W_ORDER_NO3     IN DM_XL_REL.W_ORDER_NO3%type DEFAULT NULL ,
      p_TO_DATE         IN DM_XL_REL.TO_DATE%type DEFAULT NULL ,
      p_W_ORDER_REG     IN DM_XL_REL.W_ORDER_REG%type DEFAULT NULL ,
      p_DESCRIPTION     IN DM_XL_REL.DESCRIPTION%type DEFAULT NULL ,
      p_DM_XL_REL_ID    IN DM_XL_REL.DM_XL_REL_ID%type ,
      p_MDU             IN DM_XL_REL.MDU%type DEFAULT NULL ,
      p_MATHOP          IN DM_XL_REL.MATHOP%type DEFAULT NULL ,
      p_W_ORDER_NO1     IN DM_XL_REL.W_ORDER_NO1%type DEFAULT NULL ,
      p_FROM_DATE       IN DM_XL_REL.FROM_DATE%type DEFAULT NULL ,
      p_CONNUM          IN DM_XL_REL.CONNUM%type DEFAULT NULL ,
      p_REL_TYPE_ID     IN DM_XL_REL.REL_TYPE_ID%type DEFAULT NULL ,
      p_CRD             IN DM_XL_REL.CRD%type DEFAULT NULL ,
      p_MDD             IN DM_XL_REL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME IN DM_XL_REL.W_REL_TYPE_NAME%type DEFAULT NULL );
  -- update
  PROCEDURE upd(
      p_CRU             IN DM_XL_REL.CRU%type DEFAULT NULL ,
      p_DM_XL_ID3       IN DM_XL_REL.DM_XL_ID3%type DEFAULT NULL ,
      p_DM_XL_ID2       IN DM_XL_REL.DM_XL_ID2%type ,
      p_DM_XL_ID1       IN DM_XL_REL.DM_XL_ID1%type ,
      p_W_ORDER_NO2     IN DM_XL_REL.W_ORDER_NO2%type DEFAULT NULL ,
      p_W_ORDER_NO3     IN DM_XL_REL.W_ORDER_NO3%type DEFAULT NULL ,
      p_TO_DATE         IN DM_XL_REL.TO_DATE%type DEFAULT NULL ,
      p_W_ORDER_REG     IN DM_XL_REL.W_ORDER_REG%type DEFAULT NULL ,
      p_DESCRIPTION     IN DM_XL_REL.DESCRIPTION%type DEFAULT NULL ,
      p_DM_XL_REL_ID    IN DM_XL_REL.DM_XL_REL_ID%type ,
      p_MDU             IN DM_XL_REL.MDU%type DEFAULT NULL ,
      p_MATHOP          IN DM_XL_REL.MATHOP%type DEFAULT NULL ,
      p_W_ORDER_NO1     IN DM_XL_REL.W_ORDER_NO1%type DEFAULT NULL ,
      p_FROM_DATE       IN DM_XL_REL.FROM_DATE%type DEFAULT NULL ,
      p_CONNUM          IN DM_XL_REL.CONNUM%type DEFAULT NULL ,
      p_REL_TYPE_ID     IN DM_XL_REL.REL_TYPE_ID%type DEFAULT NULL ,
      p_CRD             IN DM_XL_REL.CRD%type DEFAULT NULL ,
      p_MDD             IN DM_XL_REL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME IN DM_XL_REL.W_REL_TYPE_NAME%type DEFAULT NULL );
  -- delete
  PROCEDURE del(
      p_DM_XL_REL_ID IN DM_XL_REL.DM_XL_REL_ID%type );
END DM_XL_REL_tapi;

/
