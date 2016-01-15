--------------------------------------------------------
--  DDL for Function GET_PREV_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_PREV_DOC_ID" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    l_ret_val NUMBER(12, 0);
  BEGIN
    SELECT TREATM_ID1
      INTO l_ret_val
      FROM TREATM_REL tr
      WHERE tr.REL_TYPE_ID = 1308590191
        AND TREATM_ID2 = (SELECT TREATM_ID2
            FROM TREATM_REL
            WHERE REL_TYPE_ID = 1308592551
              AND TREATM_ID1 = p_treatm_id);
    RETURN l_ret_val;
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
  END;

/
