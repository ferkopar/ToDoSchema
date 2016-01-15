--------------------------------------------------------
--  DDL for Function LOOKUP_MENU_LABEL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_MENU_LABEL" (P_MENU_ID     NUMBER,
                                                        P_TRANSLATE   NUMBER DEFAULT 0,
                                                        P_LANGUAGE_ID NUMBER DEFAULT 0)
  RETURN VARCHAR2
  AS

    v_ret     VARCHAR2(2000);
    v_forgein VARCHAR2(2000);
  BEGIN
    BEGIN
      SELECT LABEL
        INTO v_ret
        FROM wk_pf_menu
        WHERE menu_id = p_menu_id;
      IF p_translate != 0
      THEN
        v_forgein := DM_TRANSLATE_F('MENU', NULL, p_menu_id, p_language_id);
        IF v_forgein != 'nn'
        THEN
          v_ret := v_forgein;
        END IF;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN -- Ha nem talált rekordot super_type tekordot
          NULL;
    END;
    RETURN V_RET;
  END LOOKUP_MENU_LABEL;

/
