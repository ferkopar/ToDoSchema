--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_GROUP_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_GROUP_ID" (P_SUPER_TYPE_ID NUMBER)
  RETURN DM_SUPER_TYP.GROUP_ID % TYPE
  AS

    v_ret DM_SUPER_TYP.GROUP_ID % TYPE;
  BEGIN
    BEGIN
      SELECT GROUP_ID
        INTO v_ret
        FROM dm_super_typ
        WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
    EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
    END;
    RETURN V_RET;
  END LOOKUP_SUPER_TYPE_GROUP_ID;

/
