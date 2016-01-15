--------------------------------------------------------
--  DDL for Function GET_NORMA_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_NORMA_DOC_ID" (p_norma_id NUMBER)
  RETURN NUMBER
  AS
    l_norma_doc_id NUMBER(12, 0);
  BEGIN
    SELECT treatm_id1
      INTO l_norma_doc_id
      FROM TREATM_REL
      WHERE TREATM_ID2 = p_norma_id
        AND REL_TYPE_ID = 1308590191;
    RETURN l_norma_doc_id;
  END;

/
