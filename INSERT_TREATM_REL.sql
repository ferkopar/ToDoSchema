--------------------------------------------------------
--  DDL for Function INSERT_TREATM_REL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_TREATM_REL" (p_id_1        NUMBER,
                                                      p_id_2        NUMBER,
                                                      p_rel_type_id NUMBER)
  RETURN NUMBER
  AS
    l_new_rel_id NUMBER(12, 0);
  BEGIN
    SELECT SEQ_BASE.NEXTVAL
      INTO l_new_rel_id
      FROM DUAL;
    INSERT INTO TREATM_REL (
      TREATM_REL_ID, TREATM_ID1, TREATM_ID2, REL_TYPE_ID
    )
    VALUES (l_new_rel_id, p_id_1, p_id_2, p_rel_type_id);
    RETURN l_new_rel_id;
  END;

/
