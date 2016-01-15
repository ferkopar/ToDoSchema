--------------------------------------------------------
--  DDL for Function COPY_TREATM_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COPY_TREATM_DOC" (p_parent NUMBER,
                                                    p_child  NUMBER)
  RETURN NUMBER
  AS

    CURSOR source_params (p_parent NUMBER) IS
        SELECT *
          FROM TREATM_PARAM tp
          WHERE tp.TREATM_ID = p_parent;

    l_child_norma      NUMBER(12, 0);
    l_child_norma_doc  NUMBER(12, 0);
    l_new_doc_id       NUMBER(12, 0);
    l_source_doc_id    NUMBER(12, 0);
    l_dummy            NUMBER(12, 0);
    l_treatm_row       TREATM % ROWTYPE;
    l_treatm_param_row TREATM_PARAM % ROWTYPE;
    l_muv_ido          NUMBER;
    l_ear              NUMBER;
    l_afa_kulcs        NUMBER;
    l_netto            NUMBER;
    l_afa              NUMBER;
    l_brutto           NUMBER;

  BEGIN

    l_child_norma := GET_NORMA_ID(p_child);
    l_child_norma_doc := GET_TREATM_DOC_ID(l_child_norma);
    l_new_doc_id := COPY_TREATM_AND_PARAMS(l_child_norma_doc);
    l_dummy := INSERT_TREATM_DOC_REL(p_child, l_new_doc_id);
    l_source_doc_id := GET_TREATM_DOC_ID(p_parent);

    -- update TREATM set TYPE1_ID = l_source_row.TYPE1_ID wher 
    INSERT INTO WK_PF_AUDIT_TABLE
    VALUES ('l_source_doc_id', l_source_doc_id, SYSDATE);
    INSERT INTO WK_PF_AUDIT_TABLE
    VALUES ('l_new_doc_id', l_new_doc_id, SYSDATE);
    FOR source_param IN source_params(l_source_doc_id)
    LOOP
      SELECT *
        INTO l_treatm_param_row
        FROM TREATM_PARAM tp
        WHERE tp.TREATM_PARAM_ID = source_param.TREATM_PARAM_ID;
      IF HAS_TREATM_PARAM(l_new_doc_id, source_param.PARAM_TYPE_ID) = TRUE
      THEN
        UPDATE TREATM_PARAM tp
          SET tp.VALUE = source_param.VALUE, tp.TREATM_PARAM1_ID = source_param.TREATM_PARAM_ID, tp.VALUE_TYPE_ID = source_param.VALUE_TYPE_ID, tp.UNIT_TYPE_ID = source_param.UNIT_TYPE_ID, tp.SUBJ_TYPE_ID = source_param.SUBJ_TYPE_ID, tp.SUBJ_ID = source_param.SUBJ_TYPE_ID
          WHERE tp.TREATM_PARAM_ID = GET_TREATM_PARAM_BY_PARAM_TYPE(l_new_doc_id, source_param.PARAM_TYPE_ID);
      ELSE
        INSERT INTO TREATM_PARAM (
          TREATM_ID, VALUE, TREATM_PARAM1_ID, VALUE_TYPE_ID, UNIT_TYPE_ID, SUBJ_TYPE_ID, SUBJ_ID, PARAM_TYPE_ID
        )
        VALUES (l_new_doc_id, source_param.VALUE, source_param.TREATM_PARAM_ID, source_param.VALUE_TYPE_ID, source_param.UNIT_TYPE_ID, source_param.SUBJ_TYPE_ID, source_param.SUBJ_ID, source_param.PARAM_TYPE_ID);
      END IF;
    END LOOP;

    -- hack
    SELECT *
      INTO l_treatm_row
      FROM TREATM t
      WHERE t.TREATM_ID = l_source_doc_id;
    IF l_treatm_row.TREATM_TYPE_ID = 1308590037
    THEN
      SELECT TO_NUMBER(VALUE)
        INTO l_ear
        FROM TREATM_PARAM tp
        WHERE tp.TREATM_ID = l_source_doc_id
          AND tp.PARAM_TYPE_ID = 1308590881; -- egységár
      SELECT TO_NUMBER(VALUE)
        INTO l_muv_ido
        FROM TREATM_PARAM tp
        WHERE tp.TREATM_ID = l_source_doc_id
          AND tp.PARAM_TYPE_ID = 5071; -- mûveleti idõ
      SELECT TO_NUMBER(VALUE)
        INTO l_afa_kulcs
        FROM TREATM_PARAM tp
        WHERE tp.TREATM_ID = l_source_doc_id
          AND tp.PARAM_TYPE_ID = 1308590882; -- áfa %
      l_netto := l_ear * l_muv_ido;
      l_afa := ROUND(l_netto * l_afa_kulcs / 100);
      l_brutto := l_netto + l_afa;
      IF HAS_TREATM_PARAM(l_child_norma_doc, 1308593299) = TRUE
      THEN --netto
        UPDATE TREATM_PARAM tp
          SET tp.VALUE = l_netto, tp.UNIT_TYPE_ID = 20004
          WHERE tp.TREATM_PARAM_ID = 1308593299;
      ELSE
        INSERT INTO TREATM_PARAM (
          TREATM_ID, VALUE, UNIT_TYPE_ID, PARAM_TYPE_ID
        )
        VALUES (l_new_doc_id, l_netto, 20004, 1308593299);
      END IF;
      IF HAS_TREATM_PARAM(l_child_norma_doc, 1308593300) = TRUE
      THEN --áfa
        UPDATE TREATM_PARAM tp
          SET tp.VALUE = l_afa, tp.UNIT_TYPE_ID = 20004
          WHERE tp.TREATM_PARAM_ID = 1308593300;
      ELSE
        INSERT INTO TREATM_PARAM (
          TREATM_ID, VALUE, UNIT_TYPE_ID, PARAM_TYPE_ID
        )
        VALUES (l_new_doc_id, l_afa, 20004, 1308593300);
      END IF;
      IF HAS_TREATM_PARAM(l_child_norma_doc, 1308592031) = TRUE
      THEN --bruttó
        UPDATE TREATM_PARAM tp
          SET tp.VALUE = l_brutto, tp.UNIT_TYPE_ID = 20004
          WHERE tp.TREATM_PARAM_ID = 1308592031;
      ELSE
        INSERT INTO TREATM_PARAM (
          TREATM_ID, VALUE, VALUE_TYPE_ID, PARAM_TYPE_ID
        )
        VALUES (l_new_doc_id, l_brutto, 20004, 1308592031);
      END IF;
    ELSIF l_treatm_row.TREATM_TYPE_ID = 1308590038
    THEN
      IF HAS_TREATM_PARAM(l_child_norma_doc, 1308592031) = TRUE
      THEN --bruttó
        UPDATE TREATM_PARAM tp
          SET tp.VALUE = l_brutto, tp.UNIT_TYPE_ID = 20004
          WHERE tp.TREATM_PARAM_ID = 1308592031;
      ELSE
        INSERT INTO TREATM_PARAM (
          TREATM_ID, VALUE, VALUE_TYPE_ID, PARAM_TYPE_ID
        )
        VALUES (l_new_doc_id, 123123, 20004, 1308592031);
      END IF;
    END IF;
    -- /hack

    RETURN l_new_doc_id;
  END;

/
