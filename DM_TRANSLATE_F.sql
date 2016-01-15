--------------------------------------------------------
--  DDL for Function DM_TRANSLATE_F
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DM_TRANSLATE_F" (p_TBL_NAME     vt_DM_TRANSLATE.TBL_NAME % TYPE,
                                                     p_TBL_COL_NAME vt_DM_TRANSLATE.TBL_COL_NAME % TYPE,
                                                     p_TBL_PK_ID    vt_DM_TRANSLATE.TBL_PK_ID % TYPE,
                                                     p_LANGUAGE_ID  vt_DM_TRANSLATE.LANGUAGE_ID % TYPE)
  RETURN vt_DM_TRANSLATE.NAMES % TYPE
  IS
    v_return vt_DM_TRANSLATE.NAMES % TYPE;
  BEGIN
    BEGIN
      IF p_TBL_PK_ID IS NOT NULL
      THEN
        SELECT names
          INTO v_return
          FROM vt_DM_TRANSLATE
          WHERE TBL_NAME = p_TBL_NAME
            AND (tbl_col_name = p_TBL_COL_NAME
            OR p_tbl_col_name IS NULL)
            AND TBL_PK_ID = p_TBL_PK_ID
            AND LANGUAGE_ID = p_LANGUAGE_ID
        --ide mÚg lehetne ÚrvÚnyessÚg, stb...
        ;
      END IF;
    EXCEPTION
      WHEN no_data_found THEN v_return := 'nn';
      WHEN too_many_rows THEN v_return := 'tn';
    END;
    RETURN v_return;
  END DM_TRANSLATE_F;

/
