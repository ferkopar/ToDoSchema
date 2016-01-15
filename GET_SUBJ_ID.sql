--------------------------------------------------------
--  DDL for Function GET_SUBJ_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_SUBJ_ID" (P_USER_NAME IN VARCHAR2)
  RETURN NUMBER
  AS
    v_user_id NUMBER(12, 0);
  BEGIN

    SELECT USER_id
      INTO v_user_id
      FROM dm_user
      WHERE user_name = UPPER(P_USER_NAME);
    RETURN v_user_id;
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
  END GET_SUBJ_ID;

/
