--------------------------------------------------------
--  DDL for Function LOOKUP_SUPER_TYPE_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUPER_TYPE_NAME" (P_SUPER_TYPE_ID NUMBER,
                                                              P_LANGUAGE_ID   NUMBER DEFAULT null)
  RETURN VARCHAR2
  AS

    v_ret VARCHAR2(2000);
    v_language_id number(12,0);
  BEGIN
--      if P_LANGUAGE_ID is null then 
--        v_language_id := V('LANGUAGE');
--      else
--        v_language_id := P_LANGUAGE_ID;
--      end if;
      v_language_id := 1;
      v_ret := DM_TRANSLATE_F('DM_SUPER_TYP', 'SUPER_TYPE_NAME', P_SUPER_TYPE_ID, v_language_id);
      IF v_ret NOT IN ('nn','tn') then
        return v_ret;
      ELSE
        SELECT SUPER_TYPE_NAME
          INTO v_ret
          FROM dm_super_typ
          WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
      END IF;

    RETURN V_RET;
    EXCEPTION
      WHEN OTHERS THEN -- Ha nem talált rekordot super_type tekordot
          RETURN NULL;

  END LOOKUP_SUPER_TYPE_NAME;

/
