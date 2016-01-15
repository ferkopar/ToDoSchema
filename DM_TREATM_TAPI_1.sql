--------------------------------------------------------
--  DDL for Package Body DM_TREATM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_TREATM_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU                  IN DM_TREATM.CRU%type DEFAULT NULL ,
      p_VALUE_GROUP_ID       IN DM_TREATM.VALUE_GROUP_ID%type DEFAULT NULL ,
      p_SUBJ_GROUP_ID        IN DM_TREATM.SUBJ_GROUP_ID%type DEFAULT NULL ,
      p_TO_DATE              IN DM_TREATM.TO_DATE%type DEFAULT NULL ,
      p_MDU                  IN DM_TREATM.MDU%type DEFAULT NULL ,
      p_PARAM_VISIBLE        IN DM_TREATM.PARAM_VISIBLE%type DEFAULT NULL ,
      p_TREATM_PARAM_TYPE_ID IN DM_TREATM.TREATM_PARAM_TYPE_ID%type DEFAULT NULL ,
      p_VALUE_TYPE           IN DM_TREATM.VALUE_TYPE%type DEFAULT NULL ,
      p_MDD                  IN DM_TREATM.MDD%type DEFAULT NULL ,
      p_MANDATORY            IN DM_TREATM.MANDATORY%type DEFAULT NULL ,
      p_DM_TREATM_ID         IN DM_TREATM.DM_TREATM_ID%type ,
      p_DIMENSION_GROUP_ID   IN DM_TREATM.DIMENSION_GROUP_ID%type DEFAULT NULL ,
      p_DIMENSION_ALLOWED    IN DM_TREATM.DIMENSION_ALLOWED%type DEFAULT NULL ,
      p_USER_TYPE2_GROUP     IN DM_TREATM.USER_TYPE2_GROUP%type DEFAULT NULL ,
      p_DESCRIPTION          IN DM_TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_ORDER_NO             IN DM_TREATM.ORDER_NO%type DEFAULT NULL ,
      p_MULTIPLY             IN DM_TREATM.MULTIPLY%type DEFAULT NULL ,
      p_VALUE_GROUP_TABLE    IN DM_TREATM.VALUE_GROUP_TABLE%type DEFAULT NULL ,
      p_FROM_DATE            IN DM_TREATM.FROM_DATE%type DEFAULT NULL ,
      p_TABLE_ROLL           IN DM_TREATM.TABLE_ROLL%type DEFAULT NULL ,
      p_CRD                  IN DM_TREATM.CRD%type DEFAULT NULL ,
      p_VALUE_ALLOWED        IN DM_TREATM.VALUE_ALLOWED%type DEFAULT NULL ,
      p_ROLL_TYPE            IN DM_TREATM.ROLL_TYPE%type DEFAULT NULL ,
      p_USER_TYPE1_GROUP     IN DM_TREATM.USER_TYPE1_GROUP%type DEFAULT NULL ,
      p_TREATM_ID            IN DM_TREATM.TREATM_ID%type DEFAULT NULL )
  IS 
  BEGIN
    INSERT
    INTO DM_TREATM
      (
        CRU ,
        VALUE_GROUP_ID ,
        SUBJ_GROUP_ID ,
        TO_DATE ,
        MDU ,
        PARAM_VISIBLE ,
        TREATM_PARAM_TYPE_ID ,
        VALUE_TYPE ,
        MDD ,
        MANDATORY ,
        DM_TREATM_ID ,
        DIMENSION_GROUP_ID ,
        DIMENSION_ALLOWED ,
        USER_TYPE2_GROUP ,
        DESCRIPTION ,
        ORDER_NO ,
        MULTIPLY ,
        VALUE_GROUP_TABLE ,
        FROM_DATE ,
        TABLE_ROLL ,
        CRD ,
        VALUE_ALLOWED ,
        ROLL_TYPE ,
        USER_TYPE1_GROUP ,
        TREATM_ID
      )
      VALUES
      (
        p_CRU ,
        p_VALUE_GROUP_ID ,
        p_SUBJ_GROUP_ID ,
        p_TO_DATE ,
        p_MDU ,
        p_PARAM_VISIBLE ,
        p_TREATM_PARAM_TYPE_ID ,
        p_VALUE_TYPE ,
        p_MDD ,
        p_MANDATORY ,
        p_DM_TREATM_ID ,
        p_DIMENSION_GROUP_ID ,
        p_DIMENSION_ALLOWED ,
        p_USER_TYPE2_GROUP ,
        p_DESCRIPTION ,
        p_ORDER_NO ,
        p_MULTIPLY ,
        p_VALUE_GROUP_TABLE ,
        p_FROM_DATE ,
        p_TABLE_ROLL ,
        p_CRD ,
        p_VALUE_ALLOWED ,
        p_ROLL_TYPE ,
        p_USER_TYPE1_GROUP ,
        p_TREATM_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU                  IN DM_TREATM.CRU%type DEFAULT NULL ,
      p_VALUE_GROUP_ID       IN DM_TREATM.VALUE_GROUP_ID%type DEFAULT NULL ,
      p_SUBJ_GROUP_ID        IN DM_TREATM.SUBJ_GROUP_ID%type DEFAULT NULL ,
      p_TO_DATE              IN DM_TREATM.TO_DATE%type DEFAULT NULL ,
      p_MDU                  IN DM_TREATM.MDU%type DEFAULT NULL ,
      p_PARAM_VISIBLE        IN DM_TREATM.PARAM_VISIBLE%type DEFAULT NULL ,
      p_TREATM_PARAM_TYPE_ID IN DM_TREATM.TREATM_PARAM_TYPE_ID%type DEFAULT NULL ,
      p_VALUE_TYPE           IN DM_TREATM.VALUE_TYPE%type DEFAULT NULL ,
      p_MDD                  IN DM_TREATM.MDD%type DEFAULT NULL ,
      p_MANDATORY            IN DM_TREATM.MANDATORY%type DEFAULT NULL ,
      p_DM_TREATM_ID         IN DM_TREATM.DM_TREATM_ID%type ,
      p_DIMENSION_GROUP_ID   IN DM_TREATM.DIMENSION_GROUP_ID%type DEFAULT NULL ,
      p_DIMENSION_ALLOWED    IN DM_TREATM.DIMENSION_ALLOWED%type DEFAULT NULL ,
      p_USER_TYPE2_GROUP     IN DM_TREATM.USER_TYPE2_GROUP%type DEFAULT NULL ,
      p_DESCRIPTION          IN DM_TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_ORDER_NO             IN DM_TREATM.ORDER_NO%type DEFAULT NULL ,
      p_MULTIPLY             IN DM_TREATM.MULTIPLY%type DEFAULT NULL ,
      p_VALUE_GROUP_TABLE    IN DM_TREATM.VALUE_GROUP_TABLE%type DEFAULT NULL ,
      p_FROM_DATE            IN DM_TREATM.FROM_DATE%type DEFAULT NULL ,
      p_TABLE_ROLL           IN DM_TREATM.TABLE_ROLL%type DEFAULT NULL ,
      p_CRD                  IN DM_TREATM.CRD%type DEFAULT NULL ,
      p_VALUE_ALLOWED        IN DM_TREATM.VALUE_ALLOWED%type DEFAULT NULL ,
      p_ROLL_TYPE            IN DM_TREATM.ROLL_TYPE%type DEFAULT NULL ,
      p_USER_TYPE1_GROUP     IN DM_TREATM.USER_TYPE1_GROUP%type DEFAULT NULL ,
      p_TREATM_ID            IN DM_TREATM.TREATM_ID%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE DM_TREATM
    SET CRU                = p_CRU ,
      VALUE_GROUP_ID       = p_VALUE_GROUP_ID ,
      SUBJ_GROUP_ID        = p_SUBJ_GROUP_ID ,
      TO_DATE              = p_TO_DATE ,
      MDU                  = p_MDU ,
      PARAM_VISIBLE        = p_PARAM_VISIBLE ,
      TREATM_PARAM_TYPE_ID = p_TREATM_PARAM_TYPE_ID ,
      VALUE_TYPE           = p_VALUE_TYPE ,
      MDD                  = p_MDD ,
      MANDATORY            = p_MANDATORY ,
      DIMENSION_GROUP_ID   = p_DIMENSION_GROUP_ID ,
      DIMENSION_ALLOWED    = p_DIMENSION_ALLOWED ,
      USER_TYPE2_GROUP     = p_USER_TYPE2_GROUP ,
      DESCRIPTION          = p_DESCRIPTION ,
      ORDER_NO             = p_ORDER_NO ,
      MULTIPLY             = p_MULTIPLY ,
      VALUE_GROUP_TABLE    = p_VALUE_GROUP_TABLE ,
      FROM_DATE            = p_FROM_DATE ,
      TABLE_ROLL           = p_TABLE_ROLL ,
      CRD                  = p_CRD ,
      VALUE_ALLOWED        = p_VALUE_ALLOWED ,
      ROLL_TYPE            = p_ROLL_TYPE ,
      USER_TYPE1_GROUP     = p_USER_TYPE1_GROUP ,
      TREATM_ID            = p_TREATM_ID
    WHERE DM_TREATM_ID     = p_DM_TREATM_ID;
  END;
-- del
  PROCEDURE del(
      p_DM_TREATM_ID IN DM_TREATM.DM_TREATM_ID%type )
  IS
  BEGIN
    DELETE FROM DM_TREATM WHERE DM_TREATM_ID = p_DM_TREATM_ID;
  END;

FUNCTION get_all(norma_id number)
  RETURN DM_TREATM_tab 
        PIPELINED IS


        cursor params 
          IS SELECT * FROM dm_treatm 
            where  TREATM_ID = norma_id;
            

          rec            DM_TREATM_rec;     
                                                
          l_treatm_row TREATM%ROWTYPE;
          l_parent_treatm_id NUMBER(12,0);
          l_DM_TREATM_tab DM_TREATM_tab;
    BEGIN
        l_DM_TREATM_tab := DM_TREATM_tab();
        SELECT * INTO l_treatm_row FROM TREATM WHERE  TREATM_ID=norma_id;
        FOR param in params loop
          rec.VALUE_GROUP_ID := param.VALUE_GROUP_ID;
          rec.SUBJ_GROUP_ID := param.SUBJ_GROUP_ID;
          rec.TO_DATE := param.TO_DATE;
          rec.PARAM_VISIBLE := param.PARAM_VISIBLE;
          rec.TREATM_PARAM_TYPE_ID := param.TREATM_PARAM_TYPE_ID;
          rec.VALUE_TYPE := param.VALUE_TYPE;
          rec.MANDATORY := param.MANDATORY;
          rec.DM_TREATM_ID := param.DM_TREATM_ID;
          rec.DIMENSION_GROUP_ID := param.DIMENSION_GROUP_ID;
          rec.DIMENSION_ALLOWED := param.DIMENSION_ALLOWED;
          rec.USER_TYPE2_GROUP := param.USER_TYPE2_GROUP;
          rec.DESCRIPTION := param.DESCRIPTION;
          rec.ORDER_NO := param.ORDER_NO;
          rec.MULTIPLY := param.MULTIPLY;
          rec.VALUE_GROUP_TABLE := param.VALUE_GROUP_TABLE;
          rec.FROM_DATE := param.FROM_DATE;
          rec.TABLE_ROLL := param.TABLE_ROLL;
          rec.VALUE_ALLOWED := param.VALUE_ALLOWED;
          rec.ROLL_TYPE := param.ROLL_TYPE;
          rec.USER_TYPE1_GROUP := param.USER_TYPE1_GROUP;
          rec.TREATM_ID := param.TREATM_ID;
          l_DM_TREATM_tab.extend;
          l_DM_TREATM_tab(l_DM_TREATM_tab.count) := rec;

        END loop;
        begin
          select TREATM_ID2 INTO l_parent_treatm_id FROM TREATM_REL WHERE TREATM_ID1 = norma_id;
          for r in (SELECT * FROM table(DM_TREATM_tapi.get_all(l_parent_treatm_id))) loop
            if not HAS_PARAM_TYPE(l_DM_TREATM_tab,r)  then
              l_DM_TREATM_tab.extend;
              l_DM_TREATM_tab(l_DM_TREATM_tab.count) := r;
            end if;
          end loop;
        exception when others then
          null;
        end;
        FOR i IN 1 ..l_DM_TREATM_tab.count LOOP
           PIPE ROW (l_DM_TREATM_tab(i));
        END LOOP;
        RETURN;
    END get_all;

FUNCTION HAS_PARAM_TYPE(p_DM_TREATM_tab DM_TREATM_tab, DM_TREATM_rec DM_TREATM_rec) 
  RETURN BOOLEAN
  IS
  BEGIN
    for i in 1..p_DM_TREATM_tab.count loop  
        if p_DM_TREATM_tab(i).TREATM_PARAM_TYPE_ID = DM_TREATM_rec.TREATM_PARAM_TYPE_ID 
          then
         return true; 
        end if;   
    end loop;
  return false; 
  END HAS_PARAM_TYPE;

FUNCTION JSON_INSERT_OR_UPDATE(p_json varchar2)
  return number
  is
  l_json json := json(p_json);
  l_dm_TREATM_id number;
--  l_dm_treatm_row dm_xl%rowtype;
  begin
    insert INTO WK_PF_AUDIT_TABLE values('json', p_json, SYSDATE);
    l_dm_treatm_id := json_ext.get_number  (l_json, 'DM_XL_ID');
    insert INTO WK_PF_AUDIT_TABLE values('l_dm_treatm_id', l_dm_treatm_id, SYSDATE);
    if l_dm_treatm_id != 0 then
--      select * INTO l_dm_treatm_row FROM DM_TREATM WHERE DM_TREATM_ID = l_dm_treatm_id;
     
      insert INTO WK_PF_AUDIT_TABLE values('update', '', SYSDATE);

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
     ins(
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
  end JSON_INSERT_OR_UPDATE;

END DM_TREATM_tapi;

/
