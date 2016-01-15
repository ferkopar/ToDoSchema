--------------------------------------------------------
--  DDL for Function SEARCH_FIRST_LEVEL_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SEARCH_FIRST_LEVEL_ID" (p_super_type_id NUMBER)
  RETURN NUMBER
  AS
    v_super_typ_row dm_super_typ % ROWTYPE;
  BEGIN
    IF p_super_type_id IS NULL
    THEN
      RETURN NULL;
    END IF;

    SELECT *
      INTO v_super_typ_row
      FROM DM_SUPER_TYP
      WHERE SUPER_TYP_ID = p_super_type_id;

    IF v_super_typ_row.SLEVEL = 1
    THEN
      RETURN v_super_typ_row.super_typ_id;
    ELSIF v_super_typ_row.SLEVEL > 0
    THEN
      RETURN SEARCH_FIRST_LEVEL_ID(v_super_typ_row.group_id);
    ELSE
      RETURN NULL;
    END IF;

  END;

/
