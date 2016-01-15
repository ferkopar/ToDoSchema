--------------------------------------------------------
--  DDL for Function GET_TREATM_ROW
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_ROW" (p_treatm_id NUMBER)
  RETURN TREATM % ROWTYPE
  AS
    l_treatm_row TREATM % ROWTYPE;

  BEGIN
    SELECT *
      INTO l_treatm_row
      FROM TREATM t
      WHERE t.TREATM_ID = p_treatm_id;
    RETURN l_treatm_row;
  END;

/
