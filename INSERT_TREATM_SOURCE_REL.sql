--------------------------------------------------------
--  DDL for Function INSERT_TREATM_SOURCE_REL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_TREATM_SOURCE_REL" (p_norma NUMBER,
                                                             p_fact  NUMBER)
  RETURN NUMBER
  AS
  BEGIN
    RETURN INSERT_TREATM_REL(p_fact, p_norma, 1308591324);
  END;

/
