--------------------------------------------------------
--  DDL for Function INSERT_TREATM_DOC_REL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_TREATM_DOC_REL" (p_treatm_id NUMBER,
                                                          p_doc_id    NUMBER)
  RETURN NUMBER
  AS
  BEGIN
    RETURN INSERT_TREATM_REL(p_doc_id, p_treatm_id, 1308590191);
  END;

/
