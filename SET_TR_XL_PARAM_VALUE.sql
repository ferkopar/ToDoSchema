--------------------------------------------------------
--  DDL for Procedure SET_TR_XL_PARAM_VALUE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SET_TR_XL_PARAM_VALUE" (p_tr_xl_id NUMBER,
                                                             p_value    VARCHAR2)
  AS
    v_tr_xl_row     tr_xl % ROWTYPE;
    v_col_dm_xl_row dm_xl % ROWTYPE;
    v_new_tr_xl_id  tr_xl.tr_xl_id % TYPE;
    v_cell_id       VARCHAR2(255);
    v_cell_value    NUMBER(15, 2) := 0;
    v_sum_value     NUMBER(15, 2) := 0;

  BEGIN
    SELECT SEQ_BASE.NEXTVAL
      INTO v_new_tr_xl_id
      FROM DUAL;
    SELECT *
      INTO v_tr_xl_row
      FROM tr_xl
      WHERE tr_xl_id = p_tr_xl_id;
    SELECT *
      INTO v_col_dm_xl_row
      FROM dm_xl
      WHERE dm_xl_id = v_tr_xl_row.COL_DM_XL_ID;
    UPDATE tr_xl tx
      SET status_id = 919
      WHERE tx.tr_xl_id = p_tr_xl_id;
    --UPDATE tr_xl tx SET status_id = 919
    --  WHERE data_inco_id = v_tr_xl_row.data_inco_id                
    --    AND param_type_id = v_tr_xl_row.param_type_id
    --    AND column_no = v_tr_xl_row.order_no
    --    AND list_type_id = v_tr_xl_row.list_type_id;

    IF v_col_dm_xl_row.PARAM_DATA_TYPE = 'N'
    THEN
      v_cell_value := p_value;
    ELSE
      v_cell_value := NULL;
    END IF;
    UPDATE TR_XL
      SET TR_XL_ID = v_new_tr_xl_id
      WHERE TR_XL_ID = v_tr_xl_row.TR_XL_ID;
    INSERT INTO tr_xl (
      tr_xl_id, list_type_id, param_date, param_type_id, param_value, param_unit, subj_id, column_no, data_inco_id, status_id, order_no, param_date_type_id, param_adate_type_id, param_fdate, param_tdate, COLUMN_DATA_TYPE_ID, PARAM_VALUE_CHR, COL_DM_XL_ID, ROW_DM_XL_ID
    )
    VALUES (v_tr_xl_row.tr_xl_id, v_tr_xl_row.list_type_id, v_tr_xl_row.param_date, v_tr_xl_row.param_type_id, v_cell_value, v_tr_xl_row.param_unit, v_tr_xl_row.subj_id, v_tr_xl_row.column_no, v_tr_xl_row.data_inco_id, 916, v_tr_xl_row.order_no, v_tr_xl_row.param_date_type_id, v_tr_xl_row.param_adate_type_id, v_tr_xl_row.param_fdate, v_tr_xl_row.param_tdate, v_tr_xl_row.COLUMN_DATA_TYPE_ID, p_value, v_tr_xl_row.COL_DM_XL_ID, v_tr_xl_row.ROW_DM_XL_ID);
  /*
      for x in 
        (select 
        (select param_type_id from dm_xl where DM_XL_ID = DM_XL_ID1) tag,
        (select param_type_id from dm_xl where DM_XL_ID = DM_XL_ID2) res,
         MATHOP
         FROM dm_xl_rel where DM_XL_ID2 in
          (
             select DM_XL_ID2 from dm_xl_rel
             where DM_XL_ID1 in
            (
             select DM_XL_ID FROM dm_xl
             where REL_TYPE_ID = 42
             and LIST_TYPE_ID  = v_tr_xl_row.list_type_id
             and PARAM_TYPE_ID = v_tr_xl_row.COLUMN_DATA_TYPE_ID
           )
         )) 
        loop
            select distinct tr_xl_id into v_cell_id from TR_XL where COLUMN_DATA_TYPE_ID = x.res 
                                                      AND   data_inco_id = v_tr_xl_row.data_inco_id
                                                      AND   list_type_id = v_tr_xl_row.list_type_id
                                                      AND   order_no = v_tr_xl_row.order_no;
            select PARAM_VALUE into v_cell_value from TR_XL where COLUMN_DATA_TYPE_ID = x.tag 
                                                      AND   data_inco_id = v_tr_xl_row.data_inco_id
                                                      AND   list_type_id = v_tr_xl_row.list_type_id
                                                      AND   order_no = v_tr_xl_row.order_no
                                                      AND   STATUS_ID !=919;
            v_sum_value := v_sum_value + v_cell_value;
        end loop;
      update TR_XL SET PARAM_VALUE = v_sum_value,PARAM_VALUE_CHR = TO_CHAR(v_sum_value) WHERE TR_XL_ID = v_cell_id;
      htp.p('{"Cell": [{');
      htp.p('        "key": "cell_id_'|| v_cell_id ||'",');
      htp.p('        "value": "'|| v_sum_value ||'"');
      htp.p('        }');
      htp.p('    ]}'); */
  END;

/
