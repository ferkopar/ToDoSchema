--------------------------------------------------------
--  DDL for Function GET_APEX_USER_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_APEX_USER_ID" (p_user_name VARCHAR2)
  RETURN NUMBER
  AS
    retval NUMBER(12, 0);
  BEGIN
    SELECT dm_user.user_id
      INTO retval
      FROM dm_user
      WHERE user_name = p_user_name;
    RETURN retval;
  END;

/
