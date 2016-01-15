--------------------------------------------------------
--  DDL for Function GET_SUBJECT_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUBJECT_NAME" (p_subj_id NUMBER)
  RETURN VARCHAR2
  AS
    v_retval VARCHAR2(255) := 'Nincs név hozzárendelve';
    v_ret    VARCHAR2(255);
  BEGIN
    BEGIN
      SELECT VALUE
        INTO v_retval
        FROM SUBJ_PARAM
        WHERE SUBJ_ID = p_subj_id
          AND PARAM_TYPE_ID = 11501;
      RETURN v_retval;
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;

    BEGIN
      SELECT VALUE
        INTO v_retval
        FROM SUBJ_PARAM
        WHERE SUBJ_ID = p_subj_id
          AND PARAM_TYPE_ID = 11102;
      SELECT VALUE
        INTO v_ret
        FROM SUBJ_PARAM
        WHERE SUBJ_ID = p_subj_id
          AND PARAM_TYPE_ID = 11103;
      v_retval := v_retval || ' ' || v_ret;
      RETURN v_retval;
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;

    RETURN v_retval;
  END;

/
