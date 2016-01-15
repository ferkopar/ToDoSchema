--------------------------------------------------------
--  DDL for Function SUM_COL_VALUE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SUM_COL_VALUE" (p_beerk_id     NUMBER,
                                                    p_col_no       NUMBER,
                                                    p_list_id      NUMBER,
                                                    p_row_order_no NUMBER)
  RETURN NUMBER
  AS
    v_dm_xl_row       dm_xl % ROWTYPE;
    v_retval          NUMBER := 0;
    v_cell_value      NUMBER;
    v_cell_value_char VARCHAR2(10);
    v_tr_xl_id        NUMBER;
  BEGIN
    SELECT SUM(PARAM_VALUE)
      INTO v_retval
      FROM TR_XL
      WHERE DATA_INCO_ID = p_beerk_id
        AND COLUMN_NO = p_col_no;
    RETURN v_retval;
  END;

/
