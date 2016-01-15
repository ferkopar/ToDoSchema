--------------------------------------------------------
--  DDL for Package Body DM_XL_REL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_XL_REL_TAPI" 
IS
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
    p_W_REL_TYPE_NAME IN DM_XL_REL.W_REL_TYPE_NAME%type DEFAULT NULL )
IS
BEGIN
  INSERT
  INTO DM_XL_REL
    (
      CRU ,
      DM_XL_ID3 ,
      DM_XL_ID2 ,
      DM_XL_ID1 ,
      W_ORDER_NO2 ,
      W_ORDER_NO3 ,
      TO_DATE ,
      W_ORDER_REG ,
      DESCRIPTION ,
      DM_XL_REL_ID ,
      MDU ,
      MATHOP ,
      W_ORDER_NO1 ,
      FROM_DATE ,
      CONNUM ,
      REL_TYPE_ID ,
      CRD ,
      MDD ,
      W_REL_TYPE_NAME
    )
    VALUES
    (
      p_CRU ,
      p_DM_XL_ID3 ,
      p_DM_XL_ID2 ,
      p_DM_XL_ID1 ,
      p_W_ORDER_NO2 ,
      p_W_ORDER_NO3 ,
      p_TO_DATE ,
      p_W_ORDER_REG ,
      p_DESCRIPTION ,
      p_DM_XL_REL_ID ,
      p_MDU ,
      p_MATHOP ,
      p_W_ORDER_NO1 ,
      p_FROM_DATE ,
      p_CONNUM ,
      p_REL_TYPE_ID ,
      p_CRD ,
      p_MDD ,
      p_W_REL_TYPE_NAME
    );
END;
-- update
PROCEDURE upd
  (
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
    p_W_REL_TYPE_NAME IN DM_XL_REL.W_REL_TYPE_NAME%type DEFAULT NULL
  )
IS
BEGIN
  UPDATE DM_XL_REL
  SET CRU            = p_CRU ,
    DM_XL_ID3        = p_DM_XL_ID3 ,
    DM_XL_ID2        = p_DM_XL_ID2 ,
    DM_XL_ID1        = p_DM_XL_ID1 ,
    W_ORDER_NO2      = p_W_ORDER_NO2 ,
    W_ORDER_NO3      = p_W_ORDER_NO3 ,
    TO_DATE          = p_TO_DATE ,
    W_ORDER_REG      = p_W_ORDER_REG ,
    DESCRIPTION      = p_DESCRIPTION ,
    MDU              = p_MDU ,
    MATHOP           = p_MATHOP ,
    W_ORDER_NO1      = p_W_ORDER_NO1 ,
    FROM_DATE        = p_FROM_DATE ,
    CONNUM           = p_CONNUM ,
    REL_TYPE_ID      = p_REL_TYPE_ID ,
    CRD              = p_CRD ,
    MDD              = p_MDD ,
    W_REL_TYPE_NAME  = p_W_REL_TYPE_NAME
  WHERE DM_XL_REL_ID = p_DM_XL_REL_ID;
END;
-- del
PROCEDURE del(
    p_DM_XL_REL_ID IN DM_XL_REL.DM_XL_REL_ID%type )
IS
BEGIN
  DELETE FROM DM_XL_REL WHERE DM_XL_REL_ID = p_DM_XL_REL_ID;
END;
END DM_XL_REL_tapi;

/
