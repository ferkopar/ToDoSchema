--------------------------------------------------------
--  DDL for Function COLUMN_HEAD
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COLUMN_HEAD" (p_beerkezes_id  NUMBER,
                                           p_lista    NUMBER,
                                           p_col_sign VARCHAR2)
  RETURN VARCHAR2
  AS
    v_ret VARCHAR2(255) := '-DUMMY-';

  BEGIN
    BEGIN
      SELECT break_string(description, 10) || '<br>[' || param_unit || ']'
        INTO v_ret
        FROM TABLE (AMNIS.FN_GET_DM_XL_COLS(p_beerkezes_id,p_lista))
        WHERE order_sign = p_col_sign;
    -- v_ret := break_string(v_ret,10);
    EXCEPTION  -- exception handlers begin 
      WHEN OTHERS THEN v_ret := 'COLUMN<br>' || p_col_sign;
    END;
    RETURN v_ret;
  END COLUMN_HEAD;

/
