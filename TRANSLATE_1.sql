--------------------------------------------------------
--  DDL for Package Body TRANSLATE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TRANSLATE" AS

FUNCTION GET_SUPER_TYP_TEXT_ID(p_super_typ_id number)
  return number
  as
  l_ret_val number (12,0);
  begin
   select DISTINCT DM_TRANSLATE.TEXT_ID INTO l_ret_val  FROM DM_TRANSLATE WHERE TBL_PK_ID = p_super_typ_id and ROWNUM=1;
   return l_ret_val;
  exception
    when NO_DATA_FOUND then 
      select SEQ_BASE.NEXTVAL INTO l_ret_val FROM DUAL;
      RETURN l_ret_val;    
  end GET_SUPER_TYP_TEXT_ID;

FUNCTION ADD_OR_REPLACE_TEXT(p_text_id number,p_lang_id number, p_text varchar2)
  return number 
  as
   l_cnt number;
   l_ret_val number (12,0);
  begin    
    select count(1) into l_cnt from dm_text WHERE TEXT_ID = p_text_id and LANGUAGE_ID =  p_lang_id;
    -- itt kell bele, hogy mi van, ha sok van.
    if l_cnt > 0 then
      update DM_TEXT SET cnames = p_text WHERE TEXT_ID = p_text_id and LANGUAGE_ID =  p_lang_id RETURNING dm_text_id
    INTO l_ret_val;
    else 
      INSERT INTO DM_TEXT (TEXT_ID, LANGUAGE_ID, CNAMES)
        VALUES (p_text_id,p_lang_id,p_text) RETURNING dm_text_id INTO l_ret_val;
    end if;
    RETURN l_ret_val;
  end ADD_OR_REPLACE_TEXT;

  FUNCTION ADD_OR_REPLACE_SUPER_TYP_TR(p_super_typ_id number,p_language_id number, p_text varchar2)
    return number 
  as
    l_ret_val number (12,0);
    l_dummy number;
    l_text_id number;
  begin
    select DM_TRANSLATE.TEXT_ID INTO l_ret_val FROM DM_TRANSLATE WHERE TBL_PK_ID = p_super_typ_id
                                                    --AND   LANGUAGE_ID = p_language_id
                                                    AND   TBL_NAME = 'DM_SUPER_TYP'
                                                    AND   TBL_COL_NAME = 'SUPER_TYPE_NAME';
    l_dummy := ADD_OR_REPLACE_TEXT(p_super_typ_id,p_language_id,p_text);
    return l_ret_val;    
  exception when NO_DATA_FOUND then
    l_dummy := ADD_OR_REPLACE_TEXT(p_super_typ_id,p_language_id,p_text);   
    insert INTO DM_TRANSLATE (TEXT_ID,TBL_NAME,TBL_COL_NAME,TBL_PK_ID)
           VALUES(p_super_typ_id, 'DM_SUPER_TYP','SUPER_TYPE_NAME',p_super_typ_id)
      RETURNING TRANSLATE_ID INTO  l_ret_val;      
      return l_ret_val;   
  end ADD_OR_REPLACE_SUPER_TYP_TR;
END TRANSLATE;

/
