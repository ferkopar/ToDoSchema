--------------------------------------------------------
--  DDL for Function USER_PAGE_RIGHT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USER_PAGE_RIGHT" (P_USER_ID IN NUMBER,
                                                      P_PAGE_NO IN NUMBER)
  RETURN VARCHAR2
  AS
    v_ret_val VARCHAR(1) := 'N';
    v_cnt     NUMBER(12, 0);
  BEGIN
    RETURN 'Y';
  END USER_PAGE_RIGHT;

/
