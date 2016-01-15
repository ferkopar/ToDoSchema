--------------------------------------------------------
--  DDL for Function GEN_SUB_TREATM_FROM_DOC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GEN_SUB_TREATM_FROM_DOC" (p_treatm_id number, p_prev_treatm_id number, p_norma_id number)
  RETURN number
AS
  cursor params is
    select * from TREATM_PARAM where TREATM_ID = p_treatm_id;
  l_treatm_row treatm%rowtype;
  l_new_treatm_id number(12,0);
  l_new_doc_id  number(12,0);
  l_norma_id NUMBER(12,0);
  l_norma_doc_id NUMBER(12,0);
  l_dummy NUMBER(12,0);

BEGIN
  insert into WK_PF_AUDIT_TABLE VALUES ('p_treatm_id',p_treatm_id);
  INSERT INTO WK_PF_AUDIT_TABLE VALUES ('p_prev_treatm_id',p_prev_treatm_id);
  INSERT INTO WK_PF_AUDIT_TABLE VALUES ('p_norma_id',p_norma_id);
  

    SELECT treatm_id2 into l_norma_id FROM TREATM_REL WHERE TREATM_ID1 = p_norma_id and REL_TYPE_ID =  1308590116;
    l_norma_id := 1308590102;
    --SELECT treatm_id1 INTO l_norma_doc_id FROM TREATM_REL WHERE TREATM_ID2 = l_norma_id AND REL_TYPE_ID = 1308590191;
    l_new_treatm_id := COPY_TREATM_AND_PARAMS(p_treatm_id);
    --l_new_doc_id := COPY_TREATM_AND_PARAMS(l_norma_doc_id);
    --l_dummy := INSERT_TREATM_DOC_REL(l_new_treatm_id,l_new_doc_id);
    l_dummy := INSERT_TREATM_SUB(l_new_treatm_id,p_norma_id);
    l_dummy := INSERT_TREATM_N_K_REL(l_norma_id,l_new_treatm_id);

  INSERT INTO WK_PF_AUDIT_TABLE VALUES ('l_norma_id',l_norma_id);
  return l_new_treatm_id;
  
END;

/
