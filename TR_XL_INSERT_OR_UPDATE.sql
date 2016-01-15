--------------------------------------------------------
--  DDL for Procedure TR_XL_INSERT_OR_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TR_XL_INSERT_OR_UPDATE" (p_value        NUMBER,
                                                              p_doc_id       NUMBER,
                                                              p_list_id      NUMBER,
                                                              p_col_order_no NUMBER,
                                                              p_row_order_no NUMBER)
  AS
    v_tr_xl_row tr_xl % ROWTYPE;
    v_dm_xl_col dm_xl % ROWTYPE;
    v_dm_xl_row dm_xl % ROWTYPE;
  BEGIN
    SELECT *
      INTO v_dm_xl_col
      FROM DM_XL
      WHERE REL_TYPE_ID = 42
        AND LIST_TYPE_ID = p_list_id
        AND ORDER_NO = TO_CHAR(p_col_order_no);
    BEGIN
      SELECT *
        INTO v_tr_xl_row
        FROM TR_XL
        WHERE LIST_TYPE_ID = p_list_id
          AND COLUMN_NO = p_col_order_no
          AND DATA_INCO_ID = p_doc_id
          AND ORDER_NO = p_row_order_no
          AND STATUS_ID != 919;
      UPDATE TR_XL
        SET PARAM_VALUE = p_value, PARAM_VALUE_CHR = TO_CHAR(p_value)
        WHERE TR_XL_ID = v_tr_xl_row.TR_XL_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN INSERT INTO TR_XL (
            LIST_TYPE_ID, DATA_INCO_ID, COLUMN_NO, ORDER_NO, PARAM_VALUE, PARAM_VALUE_CHR, PARAM_TYPE_ID, COLUMN_DATA_TYPE_ID, col_dm_xl_id, row_dm_xl_id
          )
          VALUES (p_list_id, p_doc_id, p_col_order_no, p_row_order_no, p_value, TO_CHAR(p_value), 60505, v_dm_xl_col.param_type_id, v_dm_xl_col.dm_xl_id, 60572);
      WHEN OTHERS THEN htp.p('hiba:TR_XL_INSERT_OR_UPDATE');
    END;

  END;

/
