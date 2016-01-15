--------------------------------------------------------
--  DDL for Function IS_NORMA_DOOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "IS_NORMA_DOOC" (p_doc_id NUMBER)
  RETURN NUMBER
AS
  l_ret_val NUMBER;
BEGIN
  SELECT COUNT(1) INTO l_ret_val FROM V_TREATM_REL_DOC vtrd WHERE vtrd.DOC_ID = p_doc_id AND vtrd.TREATM_GROUP_ID = 1601;
  RETURN l_ret_val;
END;

/
