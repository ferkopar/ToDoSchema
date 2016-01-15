--------------------------------------------------------
--  DDL for Function GENERATE_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GENERATE_DOC" (p_treatm_id NUMBER)
  RETURN NUMBER
  AS
    l_treatm_row     TREATM % ROWTYPE;
    l_norma_id       NUMBER(12, 0);
    l_norma_doc_id   NUMBER(12, 0);
    l_new_doc_id     NUMBER(12, 0);
    l_dummy          NUMBER(12, 0);
    l_prev_treatm_id NUMBER(12, 0);

  BEGIN
    l_treatm_row := GET_TREATM_ROW(p_treatm_id);
    l_prev_treatm_id := GET_PREV_TREATM_ID(p_treatm_id);
    --  INSERT INTO WK_PF_AUDIT_TABLE VALUES('l_treatm_row',p_treatm_id,SYSDATE);
    --  INSERT INTO WK_PF_AUDIT_TABLE VALUES('l_prev_treatm_id',l_prev_treatm_id,SYSDATE);

    IF l_prev_treatm_id IS NULL
    THEN
      l_norma_id := GET_NORMA_ID(p_treatm_id);
      l_norma_doc_id := GET_NORMA_DOC_ID(l_norma_id);
      --      INSERT INTO WK_PF_AUDIT_TABLE VALUES('l_norma_doc_id',l_norma_doc_id,SYSDATE);
      l_new_doc_id := COPY_TREATM_AND_PARAMS(l_norma_doc_id);
    ELSE
      l_new_doc_id := COPY_TREATM_DOC(l_prev_treatm_id, p_treatm_id);
    END IF;
    l_dummy := INSERT_TREATM_DOC_REL(p_treatm_id, l_new_doc_id);
    -- HACK
    UPDATE TREATM
      SET TYPE1_ID = l_treatm_row.TYPE1_ID, TYPE2_ID = l_treatm_row.TYPE2_ID, SUBJ1_ID = l_treatm_row.SUBJ1_ID, SUBJ2_ID = l_treatm_row.SUBJ2_ID, FROM_DATE = l_treatm_row.FROM_DATE, TO_DATE = l_treatm_row.TO_DATE, TIME_START = l_treatm_row.TIME_START, TIME_END = l_treatm_row.TIME_END, TREATM_NAME = LOOKUP_SUBJ_NAME(l_treatm_row.SUBJ2_ID) || ' ' || LOOKUP_SUPER_TYPE_NAME(l_treatm_row.TREATM_TYPE_ID) || ' ' || TO_CHAR(l_treatm_row.TIME_START, 'YYYY.MM.DD HH24:MIN:SS')
      WHERE TREATM_ID = l_new_doc_id;


    -- /HACK

    RETURN l_new_doc_id;
  END;

/
