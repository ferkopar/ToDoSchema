--------------------------------------------------------
--  DDL for Function INSERT_OR_UPDATE_TREATM_PARAM
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INSERT_OR_UPDATE_TREATM_PARAM" (p_treatm_param_id  NUMBER DEFAULT NULL,
                                                                  p_treatm_param_id1 NUMBER DEFAULT NULL,
                                                                  p_treatm_id        NUMBER DEFAULT NULL,
                                                                  p_subj_id          NUMBER DEFAULT NULL,
                                                                  p_subj_type_id     NUMBER DEFAULT NULL,
                                                                  p_param_type_id    NUMBER DEFAULT NULL,
                                                                  p_value            VARCHAR2,
                                                                  p_unit_type_id     NUMBER DEFAULT NULL,
                                                                  p_value_type_id    NUMBER DEFAULT NULL,
                                                                  p_order_no         NUMBER DEFAULT NULL,
                                                                  p_from_date        DATE,
                                                                  p_to_date          DATE,
                                                                  p_unit             VARCHAR2)
  RETURN NUMBER
  AS
    l_ret_val          NUMBER(12, 0);
    l_treatm_param_row TREATM_PARAM % ROWTYPE;
  BEGIN
    IF p_treatm_param_id IS NULL
    THEN
      INSERT INTO OBH_TEST.TREATM_PARAM (
        TREATM_PARAM1_ID, TREATM_ID, SUBJ_ID, SUBJ_TYPE_ID, PARAM_TYPE_ID, VALUE, UNIT_TYPE_ID, VALUE_TYPE_ID, ORDER_NO, FROM_DATE, TO_DATE, UNIT
      )
      VALUES (p_treatm_param_id1 -- TREATM_PARAM1_ID - NUMBER(12, 0)
        , p_treatm_id -- TREATM_ID - NUMBER(12, 0)
        , p_subj_id -- SUBJ_ID - NUMBER(12, 0)
        , p_subj_type_id -- SUBJ_TYPE_ID - NUMBER(12, 0)
        , p_param_type_id -- PARAM_TYPE_ID - NUMBER(12, 0) NOT NULL
        , p_value -- VALUE - VARCHAR2(255 BYTE)
        , p_unit_type_id -- UNIT_TYPE_ID - NUMBER(12, 0)
        , p_value_type_id -- VALUE_TYPE_ID - NUMBER(12, 0)
        , p_order_no -- ORDER_NO - NUMBER(4, 0)
        , p_from_date -- FROM_DATE - DATE NOT NULL
        , p_to_date -- TO_DATE - DATE NOT NULL
        , p_unit_type_id -- UNIT - VARCHAR2(50 BYTE)
      ) RETURNING TREATM_PARAM_ID INTO l_ret_val;
    ELSE
      l_ret_val := p_treatm_param_id;
      SELECT *
        INTO l_treatm_param_row
        FROM TREATM_PARAM tp
        WHERE TREATM_PARAM_ID = p_treatm_param_id;
      UPDATE OBH_TEST.TREATM_PARAM
        SET TREATM_PARAM1_ID = NVL(p_treatm_param_id1, l_treatm_param_row.TREATM_PARAM1_ID) -- TREATM_PARAM1_ID - NUMBER(12, 0)
        , SUBJ_ID = NVL(p_subj_id, l_treatm_param_row.SUBJ_ID)                            -- SUBJ_ID - NUMBER(12, 0)
        , SUBJ_TYPE_ID = NVL(p_subj_type_id, l_treatm_param_row.SUBJ_TYPE_ID)             -- SUBJ_TYPE_ID - NUMBER(12, 0)
        , PARAM_TYPE_ID = NVL(p_param_type_id, l_treatm_param_row.PARAM_TYPE_ID)          -- PARAM_TYPE_ID - NUMBER(12, 0) NOT NULL
        , VALUE = NVL(p_value, l_treatm_param_row.VALUE)                                  -- VALUE - VARCHAR2(255 BYTE)
        , UNIT_TYPE_ID = NVL(p_unit_type_id, l_treatm_param_row.UNIT_TYPE_ID)             -- UNIT_TYPE_ID - NUMBER(12, 0)
        , VALUE_TYPE_ID = NVL(p_value_type_id, l_treatm_param_row.VALUE_TYPE_ID)          -- VALUE_TYPE_ID - NUMBER(12, 0)
        , ORDER_NO = NVL(p_order_no, l_treatm_param_row.ORDER_NO)                         -- ORDER_NO - NUMBER(4, 0)
        , FROM_DATE = NVL(p_from_date, SYSDATE)                      -- FROM_DATE - DATE NOT NULL
        , TO_DATE = NVL(p_to_date, TO_DATE('2099.12.30', 'YYYY.MM.DD'))                            -- TO_DATE - DATE NOT NULL
        , UNIT = NVL(p_unit, l_treatm_param_row.UNIT)                                     -- UNIT - VARCHAR2(50 BYTE)
        WHERE TREATM_PARAM_ID = p_treatm_param_id;
    END IF;
    RETURN l_ret_val;
  END;

/
