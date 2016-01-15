--------------------------------------------------------
--  DDL for Function GET_NEXT_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_NEXT_ID" 
  RETURN NUMBER
  IS
    v_ret NUMBER(12, 0);
  BEGIN
    SELECT seq_base.NEXTVAL
      INTO v_ret
      FROM dual;
    RETURN v_ret;
  END GET_NEXT_ID;

/
