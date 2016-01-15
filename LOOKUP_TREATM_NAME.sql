--------------------------------------------------------
--  DDL for Function LOOKUP_TREATM_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_TREATM_NAME" (
  P_TREATM_ID NUMBER
 ,P_TRANSLATE NUMBER DEFAULT 0
 ,P_LANGUAGE_ID NUMBER DEFAULT 0)
  RETURN varchar2 
AS
   v_ret varchar2(2000);
BEGIN
    IF p_translate != 0 THEN
       v_ret := DM_TRANSLATE_F('TREATM','TREATM_NAME',P_TREATM_ID,p_language_id);
    ELSE
       select TREATM_NAME into v_ret from  TREATM WHERE TREATM_ID = P_TREATM_ID;
    END IF;
    return v_ret;
  EXCEPTION 
  when OTHERS THEN -- Ha nem talált rekordot super_type tekordot
    return null;
END;

/
