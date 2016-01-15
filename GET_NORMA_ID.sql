--------------------------------------------------------
--  DDL for Function GET_NORMA_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_NORMA_ID" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    l_norma_id NUMBER(12, 0);
  BEGIN
    SELECT treatm_id2
      INTO l_norma_id
      FROM TREATM_REL
      WHERE TREATM_ID1 = p_treatm_id
        AND REL_TYPE_ID = 1308590116;
    RETURN l_norma_id;
  END;

/
