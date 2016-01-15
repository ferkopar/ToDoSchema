--------------------------------------------------------
--  DDL for Function COLUMN_SHOW
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COLUMN_SHOW" (p_beerkezes_id  NUMBER,
                                           p_lista    NUMBER,
                                           p_col_sign VARCHAR2)
  RETURN NUMBER
  AS
    v_ret NUMBER(5, 0) := -1;
  BEGIN
    BEGIN
      SELECT 1
        INTO v_ret
        FROM TABLE (AMNIS.FN_GET_DM_XL_COLS(p_beerkezes_id,p_lista))
        WHERE order_sign = p_col_sign;
    EXCEPTION  -- exception handlers begin 
      WHEN OTHERS THEN NULL;
    END;
    RETURN v_ret;
  END COLUMN_SHOW;

/
