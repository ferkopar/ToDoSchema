--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_DESCRIPTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_DESCRIPTION" (P_SUPER_TYPE_ID NUMBER)
  RETURN VARCHAR2
  AS

    v_ret VARCHAR2(2000);
  BEGIN
    BEGIN
      SELECT DESCRIPTION
        INTO v_ret
        FROM dm_super_typ
        WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
    EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
    END;
    RETURN V_RET;
  END LOOKUP_SUPER_TYPE_DESCRIPTION;

/
