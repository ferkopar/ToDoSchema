--------------------------------------------------------
--  DDL for Function LOOKUP_TR_XL_VALUE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_TR_XL_VALUE" (p_beerkezes_id     NUMBER,
                                                         p_list_type_id     NUMBER,
                                                         p_param_type_id    NUMBER,
                                                         p_column_no        NUMBER,
                                                         p_tr_xl_id     OUT NUMBER,
                                                         p_row_no           NUMBER)
  RETURN VARCHAR2
  AS
    v_rec_no    INTEGER;
    v_tr_xl_row tr_xl % ROWTYPE;
  BEGIN

    SELECT COUNT(1)
      INTO v_rec_no
      FROM tr_xl
      WHERE data_inco_id = p_beerkezes_id
        AND list_type_id = p_list_type_id
        AND order_no = p_row_no
        AND column_no = p_column_no
        AND status_id != 919;

    IF v_rec_no = 0
    THEN
      RETURN '';
    ELSIF v_rec_no = 1
    THEN
      SELECT *
        INTO v_tr_xl_row
        FROM tr_xl
        WHERE data_inco_id = p_beerkezes_id
          AND list_type_id = p_list_type_id
          AND order_no = p_row_no
          AND column_no = p_column_no
          AND status_id != 919;
      IF v_tr_xl_row.param_value IS NOT NULL
      THEN
        IF v_tr_xl_row.param_value != -2
        THEN
          p_tr_xl_id := v_tr_xl_row.tr_xl_id;
          RETURN TO_CHAR(TO_NUMBER(REPLACE(v_tr_xl_row.param_value, ',', '.')), '999G999G990', 'nls_numeric_characters='', ''');
        ELSE
          RETURN 'N/A';
        END IF;
      ELSE
        RETURN v_tr_xl_row.param_value_chr;
      END IF;
    ELSE
      RETURN 'HIBA';
    END IF;

  END;

/
