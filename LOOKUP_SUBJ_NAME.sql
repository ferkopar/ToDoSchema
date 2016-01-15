--------------------------------------------------------
--  DDL for Function LOOKUP_SUBJ_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_SUBJ_NAME" (P_SUBJ_ID NUMBER)
  RETURN VARCHAR2
  AS

    v_ret VARCHAR2(2000);
  BEGIN
    BEGIN
      v_ret := GET_SUBJECT_NAME(P_SUBJ_ID);
    EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
    END;
    RETURN V_RET;
  END LOOKUP_SUBJ_NAME;

/
