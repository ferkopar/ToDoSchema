--------------------------------------------------------
--  DDL for Function GET_TREATM_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_DOC_ID" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    retval NUMBER(12, 0);
  BEGIN
    SELECT DISTINCT TREATM_REL.TREATM_ID1
      INTO retval
      FROM TREATM_REL
      WHERE TREATM_ID2 = p_treatm_id
        AND REL_TYPE_ID = 1308590191;
    RETURN retval;
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
  END;

/
