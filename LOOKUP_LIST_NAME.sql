--------------------------------------------------------
--  DDL for Function LOOKUP_LIST_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LOOKUP_LIST_NAME" 
(
  P_LIST_ID NUMBER
 ,P_TRANSLATE NUMBER DEFAULT 0
 ,P_LANGUAGE_ID NUMBER DEFAULT 0
) return varchar2 as 

 v_ret varchar2(2000);
begin
  BEGIN   
    IF p_translate != 0 THEN
       v_ret := DM_TRANSLATE_F('TREATM_PARAM','VALUE',P_LIST_ID,p_language_id);
    ELSE
       select VALUE into v_ret from  treatm_param WHERE treatm_param_id = P_LIST_ID;
    END IF;
  EXCEPTION 
  when OTHERS THEN -- Ha nem talált rekordot super_type tekordot
    return null;
 end;
 return V_RET;
END ; 

/
