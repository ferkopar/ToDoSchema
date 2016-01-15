--------------------------------------------------------
--  DDL for Function INSERT_TR_XL_ROW
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_TR_XL_ROW" (p_value         VARCHAR,
                                                       p_dm_xl_id      dm_xl.dm_xl_id % TYPE,
                                                       p_param_type_id tr_xl.param_type_id % TYPE,
                                                       p_treatm_id     tr_xl.DATA_INCO_ID % TYPE,
                                                       p_order_no      tr_xl.order_no % TYPE)
  RETURN NUMBER
  AS
    v_dm_xl_row dm_xl % ROWTYPE;
    v_tr_xl_id  tr_xl.tr_xl_id % TYPE;
  BEGIN
    -- insert INTO WK_PF_AUDIT_TABLE VALUES('p_value',p_value);
    -- insert INTO WK_PF_AUDIT_TABLE VALUES('p_dm_xl_id',p_dm_xl_id);
    -- insert INTO WK_PF_AUDIT_TABLE VALUES('p_param_type_id',p_param_type_id);
    -- insert INTO WK_PF_AUDIT_TABLE VALUES('p_treatm_id',p_treatm_id);
    -- insert INTO WK_PF_AUDIT_TABLE VALUES('p_order_no',p_order_no);
    SELECT *
      INTO v_dm_xl_row
      FROM dm_xl
      WHERE dm_xl_id = p_dm_xl_id;
    INSERT INTO tr_xl (
      list_type_id, param_type_id, column_data_type_id, param_value, param_value_chr, order_no, column_no, data_inco_id
    )
    VALUES (v_dm_xl_row.list_type_id, p_param_type_id, v_dm_xl_row.param_type_id, p_value, p_value, p_order_no, v_dm_xl_row.order_no, p_treatm_id) RETURNING tr_xl_id INTO v_tr_xl_id;
    RETURN v_tr_xl_id;
    RETURN v_tr_xl_id;
  END;

/
