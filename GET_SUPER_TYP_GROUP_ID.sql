--------------------------------------------------------
--  DDL for Function GET_SUPER_TYP_GROUP_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUPER_TYP_GROUP_ID" (p_super_typ_id NUMBER)
  RETURN NUMBER
  AS
    v_retval NUMBER;
  BEGIN
    SELECT GROUP_ID
      INTO v_retval
      FROM DM_SUPER_TYP
      WHERE SUPER_TYP_ID = p_super_typ_id;
    RETURN v_retval;
  END;

/
