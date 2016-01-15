--------------------------------------------------------
--  DDL for Function GET_SUBJ_TYPE_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUBJ_TYPE_ID" (p_subj_id         NUMBER,
                                                     p_subj_catgory_id NUMBER)
  RETURN NUMBER
  AS
    v_subj_type_id NUMBER;
  BEGIN
    BEGIN
      SELECT subj_type_id
        INTO v_subj_type_id
        FROM SUBJ_PARAM
        WHERE SUBJ_ID = v_subj_type_id
          AND ROWNUM <= 1;
    EXCEPTION
      WHEN OTHERS THEN SELECT super_typ_id
            INTO v_subj_type_id
            FROM DM_SUPER_TYP
            WHERE group_id = p_subj_catgory_id
              AND ROWNUM <= 1;
    END;
    RETURN v_subj_type_id;
  END;

/
