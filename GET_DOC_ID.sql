--------------------------------------------------------
--  DDL for Function GET_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DOC_ID" (p_data_inco_id NUMBER)
  RETURN NUMBER
  AS
    v_retval NUMBER;
  BEGIN
    SELECT DISTINCT GET_SUPER_TYP_GROUP_ID(TR_XL.LIST_TYPE_ID)
      INTO v_retval
      FROM tr_xl
      WHERE DATA_INCO_ID = p_data_inco_id;
    RETURN v_retval;
  END;

/
