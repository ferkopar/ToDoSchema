--------------------------------------------------------
--  DDL for Function COPY_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COPY_DOC" (p_data_inco_id        NUMBER,
                                               p_target_doc_type OUT NUMBER)
  RETURN NUMBER
  AS
    CURSOR tr_xl_rows IS
        SELECT *
          FROM TR_XL
          WHERE DATA_INCO_ID = p_data_inco_id
            AND STATUS_ID != 919;
    v_dm_xl_row        DM_XL % ROWTYPE;      -- source
    v_dm_xl_row_id     NUMBER(12, 0);   -- target
    v_new_data_inco_id NUMBER(12, 0);
  BEGIN
    SELECT GROUP_ID
      INTO p_target_doc_type
      FROM DM_SUPER_TYP
      WHERE SUPER_TYP_ID = (SELECT DISTINCT list_type_id1
            FROM V_DM_XL_REL
            WHERE LIST_TYPE_ID2 = 100122
              AND REL_TYPE_ID = 45);
    SELECT seq_base.NEXTVAL
      INTO v_new_data_inco_id
      FROM dual;
    FOR tr_xl_row IN tr_xl_rows
    LOOP
      v_dm_xl_row_id := GET_DM_XL_ID_TO(tr_xl_row.col_dm_xl_id);

      IF v_dm_xl_row_id IS NOT NULL
      THEN

        SELECT *
          INTO v_dm_xl_row
          FROM DM_XL
          WHERE DM_XL_ID = v_dm_xl_row_id;

        INSERT_TR_XL_REC(
        p_PARAM_VALUE_CHR => tr_xl_row.PARAM_VALUE_CHR,
        p_PARAM_UNIT => tr_xl_row.PARAM_UNIT,
        p_ROW_DM_XL_ID => tr_xl_row.ROW_DM_XL_ID,
        p_PARAM_TYPE_ID => tr_xl_row.PARAM_TYPE_ID,
        p_COL_DM_XL_ID => v_dm_xl_row.dm_xl_id,
        p_DATA_INCO_ID => v_new_data_inco_id,
        p_ORDER_NO => tr_xl_row.ORDER_NO,
        p_PARAM_VALUE => tr_xl_row.PARAM_VALUE,
        p_COLUMN_DATA_TYPE_ID => v_dm_xl_row.PARAM_TYPE_ID,
        p_COLUMN_NO => v_dm_xl_row.ORDER_NO,
        p_LIST_TYPE_ID => v_dm_xl_row.LIST_TYPE_ID,
        p_STATUS_ID => 912);
      END IF;
    END LOOP;
    RETURN v_new_data_inco_id;
  END;

/
