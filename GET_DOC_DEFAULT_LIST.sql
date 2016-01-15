--------------------------------------------------------
--  DDL for Function GET_DOC_DEFAULT_LIST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DOC_DEFAULT_LIST" (p_doc_id NUMBER)
  RETURN NUMBER
  AS
  BEGIN
    IF p_doc_id = 100100
    THEN
      RETURN 100104;
    ELSIF p_doc_id = 100120
    THEN
      RETURN 100122;
    ELSIF p_doc_id = 100130
    THEN
      RETURN 100132;
    ELSE
      RETURN NULL;
    END IF;
  END;

/
