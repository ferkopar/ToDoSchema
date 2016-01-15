--------------------------------------------------------
--  DDL for Package Body COMPUTE_JSON
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "COMPUTE_JSON" AS

function iifn(n number) return number as
  begin
    if n = 0 then
      return null;
    else 
      return n;
    end if;
  end; 

FUNCTION TREATM(p_json varchar2)  
return number
  is
  l_json json := json(p_json);
  l_json_list json_list;
  l_list_cnt number (2,0);
  l_treatm_id number (12,0);
  l_param_type_id number (12,0);
  l_dm_treatm_row obh_test.dm_treatm%ROWTYPE;
  l_dummy number (12,0);
  BEGIN
    l_treatm_id := json_ext.get_number  (l_json, 'TREATM_ID');
    if l_treatm_id != 0 then
      update TREATM 
        set
        TREATM_NAME = json_ext.GET_STRING(l_json, 'TREATM_NAME'),
        TREATM_TYPE_ID = json_ext.get_number(l_json, 'TREATM_TYPE_ID'), 
        TREATM_CATEGORY_ID = json_ext.get_number(l_json, 'TREATM_CATEGORY_ID'), 
        FROM_DATE = TO_DATE(json_ext.GET_STRING(l_json, 'FROM_DATE'),'YYYY.MM.DD'),
        TO_DATE = TO_DATE(json_ext.GET_STRING(l_json, 'FROM_DATE'),'YYYY.MM.DD'),
        TYPE1_ID = json_ext.get_number(l_json, 'TYPE1_ID'), 
        TYPE2_ID = json_ext.get_number(l_json, 'TYPE2_ID')
        WHERE treatm_id = l_treatm_id;
    else
        select SEQ_BASE.NEXTVAL INTO l_treatm_id FROM DUAL;
        INSERT into TREATM (TREATM_ID,TREATM_GROUP_ID,TREATM_CATEGORY_ID,TREATM_NAME)
        values(l_treatm_id,json_ext.get_number(l_json, 'TREATM_GROUP_ID'),
                           json_ext.get_number(l_json, 'TREATM_CATEGORY_ID'),
                           json_ext.GET_STRING(l_json, 'TREATM_NAME'));
    end if;
    if l_treatm_id != 0 and l_json.exist('TREATM_PARAMS') then
        l_json_list := json_ext.get_json_list(l_json,'TREATM_PARAMS');
        l_list_cnt  := l_json_list.count;
        insert INTO WK_PF_AUDIT_TABLE VALUES('TREATM_PARAMS count',l_list_cnt,sysdate);
        for i in 1 .. l_list_cnt loop
            l_param_type_id := json_ext.get_number(json(l_json_list.get(i)), 'PARAM_TYPE');
            insert INTO WK_PF_AUDIT_TABLE VALUES('PARAM_TYPE',l_param_type_id,sysdate);
--            SELECT * into l_dm_treatm_row from DM_TREATM 
--              where TREATM_ID = l_treatm_id and TREATM_PARAM_TYPE_ID = l_param_type_id;

            l_dummy := OBH_TEST.INSERT_OR_UPDATE_TREATM_PARAM( 
              p_treatm_param_id  => iifn( json_ext.get_number(json(l_json_list.get(i)), 'TREATM_PARAM_ID') ),
              p_treatm_param_id1 => null,
              p_treatm_id        => l_treatm_id,
              p_subj_id          => iifn( json_ext.get_number(json(l_json_list.get(i)), 'SUBJ_ID') ),
              p_subj_type_id     => iifn( json_ext.get_number(json(l_json_list.get(i)), 'SUBJ_TYP_ID') ),
              p_param_type_id    => l_param_type_id,
              p_value            => json_ext.get_string(json(l_json_list.get(i)), 'VALUE'),
              p_unit_type_id     => iifn( json_ext.get_number(json(l_json_list.get(i)), 'DIM_TYPE') ),
              p_value_type_id    => json_ext.get_number(json(l_json_list.get(i)), 'VALUE'),
              p_order_no         => 0,
              p_from_date        => sysdate,
              p_to_date          => to_date('2099.12.31','YYYY.MM.DD'),
              p_unit             => null);
        end loop;


    end IF;
 
    return l_treatm_id;
  END;

FUNCTION DM_TREATM(p_json varchar2)
  return number
  is
  l_json json := json(p_json);
  l_dm_TREATM_id number;
  begin
    insert INTO WK_PF_AUDIT_TABLE values('json', p_json, SYSDATE);
    l_dm_treatm_id := json_ext.get_number  (l_json, 'DM_XL_ID');
    insert INTO WK_PF_AUDIT_TABLE values('l_dm_treatm_id', l_dm_treatm_id, SYSDATE);
    if l_dm_treatm_id != 0 then
    UPDATE DM_TREATM
    SET 
      VALUE_GROUP_ID       = json_ext.get_number(l_json, 'VALUE_GROUP_ID'),
      SUBJ_GROUP_ID        = json_ext.get_number(l_json, 'SUBJ_GROUP_ID'),
      PARAM_VISIBLE        = json_ext.get_number(l_json, 'PARAM_VISIBLE'),
      TREATM_PARAM_TYPE_ID = json_ext.get_number(l_json, 'TREATM_PARAM_TYPE_ID') ,
      VALUE_TYPE           = json_ext.GET_STRING(l_json, 'VALUE_TYPE'),
      MANDATORY            = json_ext.get_number(l_json, 'MANDATORY'),
      DIMENSION_GROUP_ID   = json_ext.get_number(l_json, 'DIMENSION_GROUP_ID') ,
      DIMENSION_ALLOWED    = json_ext.get_number(l_json, 'DIMENSION_ALLOWED'),
      ORDER_NO             = json_ext.GET_STRING(l_json, 'ORDER_NO') ,
      MULTIPLY             = json_ext.get_number(l_json, 'MULTIPLY') ,
      VALUE_GROUP_TABLE    = json_ext.GET_STRING(l_json, 'VALUE_GROUP_TABLE'),
      VALUE_ALLOWED        = json_ext.get_number(l_json, 'VALUE_ALLOWED') 
    WHERE DM_TREATM_ID     = l_dm_treatm_id;
    ELSE
     select SEQ_BASE.NEXTVAL INTO l_dm_treatm_id FROM DUAL;
     dm_treatm_tapi.ins(
      p_VALUE_GROUP_ID       => json_ext.get_number(l_json, 'VALUE_GROUP_ID') ,
      p_SUBJ_GROUP_ID        => json_ext.get_number(l_json, 'SUBJ_GROUP_ID'),
      p_PARAM_VISIBLE        => json_ext.get_number(l_json, 'PARAM_VISIBLE'),
      p_TREATM_PARAM_TYPE_ID => json_ext.get_number(l_json, 'TREATM_PARAM_TYPE_ID') ,
      p_VALUE_TYPE           => json_ext.GET_STRING(l_json, 'VALUE_TYPE'),
      p_MANDATORY            => json_ext.get_number(l_json, 'MANDATORY'),
      p_DM_TREATM_ID         => l_dm_treatm_id,
      p_DIMENSION_GROUP_ID   => json_ext.get_number(l_json, 'DIMENSION_ALLOWED') ,
      p_DIMENSION_ALLOWED    => json_ext.get_number(l_json, 'DIMENSION_ALLOWED'), 
      p_ORDER_NO             => json_ext.GET_STRING(l_json, 'ORDER_NO'),
      p_MULTIPLY             => json_ext.get_number(l_json, 'MULTIPLY') ,
      p_VALUE_GROUP_TABLE    => json_ext.GET_STRING(l_json, 'VALUE_GROUP_TABLE') ,
      p_VALUE_ALLOWED        => json_ext.get_number(l_json, 'VALUE_ALLOWED') ,
      p_TREATM_ID            => json_ext.get_number(l_json, 'TREATM_ID'  ));    
    END IF;
  return l_dm_treatm_id;
  end DM_TREATM;

FUNCTION DM_SUPER_TYPE(p_json varchar2)
 return number
  is
  l_json json := json(p_json);
  l_super_type_id number;
  l_lang_id number;
  l_lang_text varchar2(2000);
  l_json_list json_list;
  l_list_cnt number (2,0);
  l_cnt number;
  l_dummy number;
  l_super_type_name varchar2(2000);
  l_super_type_short_name varchar2(2000);
  l_group_id number;
  l_roll_type number;
begin
  DBMS_OUTPUT.PUT_LINE(' DM_SUPER_TYPE:'); 
  l_super_type_id := json_ext.get_number  (l_json, 'SUPER_TYP_ID');
  l_super_type_name := json_ext.get_string(l_json, 'SUPER_TYPE_NAME');
  l_super_type_short_name := json_ext.get_string(l_json, 'SUPER_TYPE_SHORT_NAME');
  l_group_id := json_ext.get_number  (l_json, 'GROUP_ID');
  l_roll_type := json_ext.get_number  (l_json, 'ROLL_TYPE');

  select count(1) into l_cnt FROM DM_SUPER_TYP WHERE SUPER_TYP_ID = l_super_type_id;

  IF l_cnt > 0 then
     update DM_SUPER_TYP SET GROUP_ID = l_group_id, 
            SUPER_TYPE_NAME = l_super_type_name, 
            SUPER_TYPE_SHORT_NAME = l_super_type_short_name,
            ROLL_TYPE = l_roll_type
    WHERE SUPER_TYP_ID = l_super_type_id;
                              
  else
    if l_super_type_id is null or l_super_type_id = 0 then
      select SEQ_BASE.NEXTVAL INTO l_super_type_id from DUAL;
    end if;
    INSERT into DM_SUPER_TYP (SUPER_TYP_ID,SUPER_TYPE_NAME,SUPER_TYPE_SHORT_NAME,GROUP_ID,ROLL_TYPE,GROUND_LEVEL_ID)
                       VALUES (l_super_type_id,l_super_type_name,l_super_type_short_name,l_group_id,l_roll_type,
                               SEARCH_GROUND_LEVEL_ID(l_group_id));
  end if;

  DBMS_OUTPUT.PUT_LINE(' DM_SUPER_TYPE:'||l_super_type_id); 
  if  l_json.exist('TRANSALTES') then
    l_json_list := json_ext.get_json_list(l_json,'TRANSALTES');
    l_list_cnt  := l_json_list.count;
    DBMS_OUTPUT.PUT_LINE('sorok:'||l_list_cnt); 

      for i in 1 .. l_list_cnt loop
          l_lang_id   := json_ext.get_number(json(l_json_list.get(i)), 'LANGUAGE_ID');
          l_lang_text := json_ext.get_string(json(l_json_list.get(i)), 'TEXT');
          DBMS_OUTPUT.PUT_LINE('lang_id:'|| l_lang_id ||' text:'||l_lang_text); 
          l_dummy := OBH_TEST.TRANSLATE.ADD_OR_REPLACE_SUPER_TYP_TR(l_super_type_id,l_lang_id,l_lang_text);
--          DBMS_OUTPUT.PUT_LINE('translate_id:'|| l_dummy); 
      end loop;
  end if; 
  return l_super_type_id;
  end;
 

FUNCTION SUBJECTIV(p_json varchar2)
 return number as

 l_json json := json(p_json);
 l_subj_id number;
 l_subj_category_id number;
 l_organization_id number;

 l_from_date varchar2 (50);
 l_to_date varchar2 (50);

begin
   DBMS_OUTPUT.PUT_LINE('p_json:'|| p_json); 
   l_subj_id := json_ext.get_number  (l_json, 'SUBJ_ID');
   l_organization_id := json_ext.get_number  (l_json, 'ORGAIZATION');
   l_subj_category_id := json_ext.get_number  (l_json, 'SUBJ_CATEGORY_ID');
   l_from_date := json_ext.get_string(l_json, 'FROM_DATE');
   l_to_date := json_ext.get_string(l_json, 'TO_DATE');

--
--   if l_subj_id = 0 then
--      insert INTO SUBJECT (SUBJ_CATEGORY_ID, FROM_DATE, TO_DATE)
--        VALUES (l_subj_category_id,l_from_date,l_to_date)
--        RETURNING SUBJ_ID INTO l_subj_id;     
--   else
--      
--    null;
--   end if;
--   DELETE FROM SUBJ_REL WHERE SUBJ_ID1 = l_subj_id AND REL_TYPE_ID = 160;
--   insert into SUBJ_REL (SUBJ_ID1,SUBJ_ID2,REL_TYPE_ID)
--        VALUES(l_subj_id,l_organization_id,160);
  return l_subj_id;
end SUBJECTIV;

END COMPUTE_JSON;

/
