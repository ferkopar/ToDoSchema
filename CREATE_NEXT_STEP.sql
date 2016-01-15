--------------------------------------------------------
--  DDL for Procedure CREATE_NEXT_STEP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CREATE_NEXT_STEP" (p_treatm_id NUMBER,
                                                      p_alert_id  NUMBER)
  AS

    l_next_norma_id NUMBER(12, 0);
    l_norma_id      NUMBER(12, 0);
    l_next          NUMBER(12, 0);

    l_user_id       NUMBER(12, 0);
    l_alert_id      NUMBER(12, 0);
    l_message_id    NUMBER(12, 0);
    l_norma_doc_id  NUMBER(12, 0);
    l_dummy         NUMBER(12, 0);
    l_new_doc_id    NUMBER(12, 0);

    l_source_row    treatm % ROWTYPE;
    l_norma_row     treatm % ROWTYPE;
    l_treatm_id     NUMBER(12, 0);

  BEGIN

    l_norma_id := GET_NORMA_ID(p_treatm_id);
    SELECT *
      INTO l_source_row
      FROM TREATM
      WHERE TREATM_ID = p_treatm_id;
    BEGIN
      SELECT VALUE_TYPE_ID
        INTO l_next_norma_id
        FROM TREATM_PARAM
        WHERE TREATM_ID = l_norma_id
          AND PARAM_TYPE_ID = 1308590034;
    EXCEPTION
      WHEN OTHERS THEN RETURN;
    END;
    SELECT *
      INTO l_norma_row
      FROM TREATM
      WHERE TREATM_ID = l_next_norma_id;
    l_next := COPY_TREATM_AND_PARAMS(l_next_norma_id);
    BEGIN
      SELECT alert_text_id
        INTO l_message_id
        FROM W_PF_TREATM_ALERT_TEXT
        WHERE TREATM_ID = l_next_norma_id;
    EXCEPTION
      WHEN OTHERS THEN l_message_id := 100;
    END;

    --   SELECT alert_text_id into l_message_id from W_PF_TREATM_ALERT_TEXT where TREATM_ID = l_next_norma_id;
    l_dummy := INSERT_TREATM_N_K_REL(l_next_norma_id, l_next);
    l_dummy := INSERT_TREATM_REL(l_next, p_treatm_id, 1308592551);
    UPDATE TREATM
      SET TREATM_GROUP_ID = 1604, TREATM_NAME = LOOKUP_SUBJ_NAME(l_source_row.subj2_id) || '-' || LOOKUP_SUPER_TYPE_NAME(l_norma_row.treatm_type_id), TYPE1_ID = l_source_row.TYPE1_ID, TYPE2_ID = l_source_row.TYPE2_ID, SUBJ1_ID = l_source_row.SUBJ1_ID, SUBJ2_ID = l_source_row.SUBJ2_ID
      WHERE TREATM_ID = l_next;


    -- HACK
    IF l_next_norma_id = 1308590711
    THEN -- kezelés
      l_user_id := get_subj_id('PNAGY');
    ELSIF l_next_norma_id = 1308590708
    THEN -- számla készítés
      l_user_id := get_subj_id('PNAGY');
    ELSIF l_next_norma_id = 1308590704
    THEN -- számla kiegyenlítés
      l_user_id := get_subj_id('MFEHER');
    ELSIF l_next_norma_id = 1308590714
    THEN -- Beérkezõ paciensek fogadása
      l_user_id := get_subj_id('MFEHER');
      l_dummy := INSERT_TREATM_DOC_REL(l_next, GET_NORMA_DOC_ID(p_treatm_id));
    END IF;

    INSERT INTO TREATM_PARAM (
      TREATM_ID, PARAM_TYPE_ID, VALUE_TYPE_ID, ORDER_NO
    )
    VALUES (l_next, 1308591648, p_alert_id, 99);
    --HACK
    INSERT INTO ALERT (
      ALERT_TYPE_ID, MESSAGE_ID, SUBJ_ID, U_COMMENT
    )
    VALUES (100, l_message_id, l_user_id, LOOKUP_SUBJ_NAME(l_source_row.subj2_id)) RETURNING alert_id INTO l_alert_id;
    INSERT INTO ALERT_PARAM (
      ALERT_ID, PARAM_TYPE_ID, APEX_PAGE
    )
    VALUES (l_alert_id, 30201, 400);
    INSERT INTO ALERT_PARAM (
      ALERT_ID, PARAM_TYPE_ID, APEX_VARIABLE, VALUE
    )
    VALUES (l_alert_id, 30202, 'P400_TREATM_ID', l_next);
    INSERT INTO ALERT_PARAM (
      ALERT_ID, PARAM_TYPE_ID, APEX_VARIABLE, VALUE
    )
    VALUES (l_alert_id, 30202, 'P400_ACTION', 'CREATE_FACT');
    INSERT INTO ALERT_PARAM (
      ALERT_ID, PARAM_TYPE_ID, APEX_VARIABLE, VALUE
    )
    VALUES (l_alert_id, 30202, 'P400_ALERT_ID', l_alert_id);
    INSERT INTO ALERT_PARAM (
      ALERT_ID, PARAM_TYPE_ID, VALUE
    )
    VALUES (l_alert_id, 30203, 'NEXT');
    UPDATE ALERT a
      SET a.STATUS_ID = 919
      WHERE a.ALERT_ID = V('P1900_ALERT_ID')
      AND a.STATUS_ID != 913;
  END;

/
