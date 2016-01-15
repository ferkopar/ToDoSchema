--------------------------------------------------------
--  DDL for Function HAS_TREATM_PARAM
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HAS_TREATM_PARAM" (p_treatm_id     NUMBER,
                                                     p_param_type_id NUMBER)
  RETURN BOOLEAN
  AS
    l_cnt NUMBER;
  BEGIN
    SELECT COUNT(1)
      INTO l_cnt
      FROM TREATM_PARAM tp
      WHERE p_treatm_id = tp.TREATM_ID
        AND p_param_type_id = tp.PARAM_TYPE_ID;
    IF l_cnt != 0
    THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END;

/
