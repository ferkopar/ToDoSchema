--------------------------------------------------------
--  DDL for Function GET_TREATM_PARAM_BY_PARAM_TYPE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_PARAM_BY_PARAM_TYPE" (p_treatm_id     NUMBER,
                                                                   p_param_type_id NUMBER)
  RETURN NUMBER
  AS
    l_param_id NUMBER;
  BEGIN
    SELECT tp.TREATM_PARAM_ID
      INTO l_param_id
      FROM TREATM_PARAM tp
      WHERE p_treatm_id = tp.TREATM_ID
        AND p_param_type_id = tp.PARAM_TYPE_ID;
    RETURN l_param_id;
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
  END;

/
