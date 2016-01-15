--------------------------------------------------------
--  DDL for Function GET_DM_XL_ID_TO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DM_XL_ID_TO" (p_dm_xl_from NUMBER)
  RETURN NUMBER
  AS
    v_retval NUMBER(12, 0);
  BEGIN
    SELECT DM_XL_REL.DM_XL_ID1
      INTO v_retval
      FROM DM_XL_REL
      WHERE DM_XL_ID2 = p_dm_xl_from
        AND REL_TYPE_ID = 45;
    RETURN v_retval;
  EXCEPTION
    WHEN no_data_found THEN RETURN NULL;
    WHEN TOO_MANY_ROWS THEN RAISE_APPLICATION_ERROR(-20002, 'AMNIS.COPY_DOC TOO_MANY_ROWS:' || p_dm_xl_from);
    WHEN OTHERS THEN RETURN NULL;
  END;

/
