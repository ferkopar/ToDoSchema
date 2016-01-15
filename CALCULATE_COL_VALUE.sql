--------------------------------------------------------
--  DDL for Function CALCULATE_COL_VALUE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CALCULATE_COL_VALUE" (p_beerk_id      NUMBER,
                                                          p_col_no        NUMBER,
                                                          p_param_type_id NUMBER,
                                                          p_list_id       NUMBER,
                                                          p_row_order_no  NUMBER)
  RETURN NUMBER
  AS
    CURSOR RULES (p_list_id NUMBER, p_param_type_id NUMBER) IS
        SELECT dm_xl_id1,
               mathop,
               connum
          FROM dm_xl dx,
               dm_xl_rel dxr
          WHERE list_type_id = p_list_id
            AND dx.order_no = TO_CHAR(p_col_no)
            AND dx.dm_xl_id = dxr.dm_xl_id2
          ORDER BY dxr.dm_xl_id2;

    v_dm_xl_row       dm_xl % ROWTYPE;
    v_retval          NUMBER := 0;
    v_cell_value      NUMBER;
    v_cell_value_char VARCHAR2(10);
    v_tr_xl_id        NUMBER;
  BEGIN
    --  htp.p('<br> Start CALCULATE_COL_VALUE p_col_no:' || p_col_no);
    FOR rule IN RULES(p_list_id, p_col_no)
    LOOP

      SELECT *
        INTO v_dm_xl_row
        FROM dm_xl
        WHERE dm_xl_id = rule.dm_xl_id1;
      v_cell_value_char := lookup_tr_xl_value(p_beerk_id, p_list_id, p_param_type_id, v_dm_xl_row.order_no, v_tr_xl_id, p_row_order_no);
      IF v_cell_value_char IS NOT NULL
        AND v_cell_value_char != 'N/A'
        AND v_cell_value_char != 'HIBA'
      THEN
        BEGIN
          v_cell_value := v_cell_value_char;
        EXCEPTION
          WHEN OTHERS THEN v_cell_value := 0;
        END;
      ELSE
        v_cell_value := 0;
      END IF;
      IF v_dm_xl_row.order_no = 209
      THEN
        IF v_cell_value = 0
        THEN
          v_cell_value := 100;
        ELSIF v_cell_value > 0
        THEN
          v_cell_value := 100 + v_cell_value;
        ELSE
          v_cell_value := 100 - v_cell_value;
        END IF;
      END IF;

      --   htp.p('<br>  v_cell_value_char :'||v_cell_value_char||';'||rule.mathop||' ;v_dm_xl_row.order_no:'||v_dm_xl_row.order_no);
      IF rule.mathop = '+'
      THEN
        v_retval := v_retval * rule.connum + v_cell_value;
      ELSIF rule.mathop = '-'
      THEN
        v_retval := v_retval * rule.connum - v_cell_value;
      ELSIF rule.mathop = '*'
      THEN
        IF v_dm_xl_row.param_unit_id = 20005
        THEN
          v_cell_value := v_cell_value / 100;
        END IF;
        IF v_retval = 0
        THEN
          v_retval := v_retval + 1 * v_cell_value;
        ELSE
          v_retval := v_retval * v_cell_value;
        END IF;
      END IF;
      TR_XL_INSERT_OR_UPDATE(v_retval, p_beerk_id, p_list_id, p_col_no, p_row_order_no);
    END LOOP;
    RETURN v_retval;
  END;

/
