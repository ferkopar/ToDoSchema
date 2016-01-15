--------------------------------------------------------
--  DDL for Function REV_LOOKUP_SUPER_TYPE_NAME_EX
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "REV_LOOKUP_SUPER_TYPE_NAME_EX" (P_SUPER_TYPE_NAME VARCHAR2)
  RETURN NUMBER
  AS

    v_ret NUMBER(12, 0);
  BEGIN
    BEGIN
      SELECT SUPER_TYP_ID
        INTO V_RET
        FROM DM_SUPER_TYP
        WHERE REPLACE(UPPER(TRIM(SUPER_TYPE_NAME)), ' ', '') = REPLACE(UPPER(TRIM(P_SUPER_TYPE_NAME)), ' ', '');
    EXCEPTION
      WHEN OTHERS THEN RETURN 2106;
    END;
    RETURN V_RET;
  END REV_LOOKUP_SUPER_TYPE_NAME_EX;

/
