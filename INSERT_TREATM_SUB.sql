--------------------------------------------------------
--  DDL for Function INSERT_TREATM_SUB
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_TREATM_SUB" (p_treatm_id NUMBER,
                                                      p_parent_id NUMBER)
  RETURN NUMBER
  AS
  BEGIN
    RETURN INSERT_TREATM_REL(p_treatm_id, p_parent_id, 1308590193);
  END;

/
