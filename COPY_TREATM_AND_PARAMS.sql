--------------------------------------------------------
--  DDL for Function COPY_TREATM_AND_PARAMS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COPY_TREATM_AND_PARAMS" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    CURSOR params IS
        SELECT *
          FROM TREATM_PARAM
          WHERE TREATM_ID = p_treatm_id;
    l_treatm_row    treatm % ROWTYPE;
    l_new_treatm_id NUMBER(12, 0);
  BEGIN
    SELECT *
      INTO l_treatm_row
      FROM TREATM
      WHERE TREATM_ID = p_treatm_id;
    SELECT seq_base.NEXTVAL
      INTO l_new_treatm_id
      FROM dual;


    INSERT INTO TREATM (
      TREATM_ID, TREATM_NAME, TREATM_GROUP_ID, TREATM_TYPE_ID, TREATM_CATEGORY_ID, TYPE1_ID, TYPE2_ID
    )
    VALUES (l_new_treatm_id, NULL, l_treatm_row.TREATM_GROUP_ID, l_treatm_row.TREATM_TYPE_ID, l_treatm_row.TREATM_CATEGORY_ID, l_treatm_row.TYPE1_ID, l_treatm_row.TYPE2_ID);
    IF l_treatm_row.TREATM_CATEGORY_ID != 2000
    THEN

      FOR param IN params
      LOOP
        INSERT INTO TREATM_PARAM (
          TREATM_ID, SUBJ_ID, SUBJ_TYPE_ID, PARAM_TYPE_ID, VALUE, VALUE_TYPE_ID, UNIT_TYPE_ID, UNIT, ORDER_NO
        )
        VALUES (l_new_treatm_id, param.SUBJ_ID, param.SUBJ_TYPE_ID, param.PARAM_TYPE_ID, param.VALUE, param.VALUE_TYPE_ID, param.UNIT_TYPE_ID, param.UNIT, param.ORDER_NO);
      END LOOP;

    END IF;
    RETURN l_new_treatm_id;
  END;

/
