--------------------------------------------------------
--  DDL for Function GET_INTERVALL_DAYS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_INTERVALL_DAYS" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    v_retval INTEGER := 0;
  BEGIN
    BEGIN
      SELECT value
        INTO v_retval
        FROM treatm_param tp
        WHERE treatm_id = p_treatm_id
          AND param_type_id = 30204;
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;
    RETURN v_retval;
  END;

/
