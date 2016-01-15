--------------------------------------------------------
--  DDL for Function HAS_TREATM_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HAS_TREATM_DOC" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    retval NUMBER(1, 0);
  BEGIN
    SELECT COUNT(1)
      INTO retval
      FROM TREATM_REL
      WHERE TREATM_ID2 = p_treatm_id
        AND REL_TYPE_ID = 1308590191;
    RETURN retval;
  END;

/
