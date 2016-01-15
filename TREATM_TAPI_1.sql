--------------------------------------------------------
--  DDL for Package Body TREATM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_TAPI" 
IS
  -- insert 
PROCEDURE ins(
      p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
      p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
      p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
      p_TO_DATE            IN TREATM.TO_DATE%type ,
      p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
      p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
      p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
      p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE          IN TREATM.FROM_DATE%type ,
      p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
      p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
      p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
      p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
      p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
      p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
      p_TREATM_ID          IN TREATM.TREATM_ID%type ,
      p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
      p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
      p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL )
  IS
  BEGIN
    INSERT
    INTO TREATM
      (
        CRU ,
        TIME_START ,
        SUBJ2_ID ,
        TO_DATE ,
        STATUS_ID ,
        DESCRIPTION ,
        MDU ,
        TYPE2_ID ,
        TREATM_CATEGORY_ID ,
        MM_ID ,
        FROM_DATE ,
        TREATM_GROUP_ID ,
        TYPE1_ID ,
        CRD ,
        MDD ,
        TREATM_NAME ,
        SUBJ1_ID ,
        TREATM_ID ,
        TIME_END ,
        TREATM_NAME_ID ,
        TREATM_TYPE_ID
      )
      VALUES
      (
        p_CRU ,
        p_TIME_START ,
        p_SUBJ2_ID ,
        p_TO_DATE ,
        p_STATUS_ID ,
        p_DESCRIPTION ,
        p_MDU ,
        p_TYPE2_ID ,
        p_TREATM_CATEGORY_ID ,
        p_MM_ID ,
        p_FROM_DATE ,
        p_TREATM_GROUP_ID ,
        p_TYPE1_ID ,
        p_CRD ,
        p_MDD ,
        p_TREATM_NAME ,
        p_SUBJ1_ID ,
        p_TREATM_ID ,
        p_TIME_END ,
        p_TREATM_NAME_ID ,
        p_TREATM_TYPE_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
      p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
      p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
      p_TO_DATE            IN TREATM.TO_DATE%type ,
      p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
      p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
      p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
      p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE          IN TREATM.FROM_DATE%type ,
      p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
      p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
      p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
      p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
      p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
      p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
      p_TREATM_ID          IN TREATM.TREATM_ID%type ,
      p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
      p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
      p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE TREATM
    SET CRU              = p_CRU ,
      TIME_START         = p_TIME_START ,
      SUBJ2_ID           = p_SUBJ2_ID ,
      TO_DATE            = p_TO_DATE ,
      STATUS_ID          = p_STATUS_ID ,
      DESCRIPTION        = p_DESCRIPTION ,
      MDU                = p_MDU ,
      TYPE2_ID           = p_TYPE2_ID ,
      TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID ,
      MM_ID              = p_MM_ID ,
      FROM_DATE          = p_FROM_DATE ,
      TREATM_GROUP_ID    = p_TREATM_GROUP_ID ,
      TYPE1_ID           = p_TYPE1_ID ,
      CRD                = p_CRD ,
      MDD                = p_MDD ,
      TREATM_NAME        = p_TREATM_NAME ,
      SUBJ1_ID           = p_SUBJ1_ID ,
      TIME_END           = p_TIME_END ,
      TREATM_NAME_ID     = p_TREATM_NAME_ID ,
      TREATM_TYPE_ID     = p_TREATM_TYPE_ID
    WHERE TREATM_ID      = p_TREATM_ID;
  END;
-- del
  PROCEDURE del(
      p_TREATM_ID IN TREATM.TREATM_ID%type )
  IS
  BEGIN
    DELETE FROM TREATM WHERE TREATM_ID = p_TREATM_ID;
  END;
-- invalidate
PROCEDURE invalidate(p_treatm_id_to_invalidate IN TREATM.TREATM_ID%TYPE)
IS
v_treatm_row TREATM%ROWTYPE;
BEGIN
  delete from TREATM_PARAM where TREATM_ID = p_treatm_id_to_invalidate;
  delete from TREATM_REL where TREATM_ID1 = p_treatm_id_to_invalidate or TREATM_ID2 = p_treatm_id_to_invalidate;
END;
--copy
FUNCTION copy(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
              p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%TYPE,
              p_copy_type VARCHAR2 DEFAULT 'P304_LEVEL') RETURN NUMBER
IS
  
  BEGIN
    
    IF p_treatm_id IS NULL THEN
      RETURN NULL;
    END IF;
    IF p_copy_type = 'P304_LEVEL' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID);
    ELSIF p_copy_type = 'P304_TREE' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID); 
    ELSIF p_copy_type = 'P304_LEAF' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID);   
    ELSE 
      raise_application_error(-20000,'Nem implementált másolás típus:'||p_copy_type); 
    END IF; 
  END;
   

FUNCTION copy_n(p_TREATM_ROW IN TREATM%ROWTYPE,
                  p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER
    IS
      v_teatm_id TREATM.TREATM_ID%TYPE;
      v_param_id NUMBER;
    BEGIN
--      SELECT seq_base.nextval INTO v_teatm_id FROM dual d;
--      ins(
--            p_TIME_START => p_treatm_row.TIME_START, 
--            p_SUBJ2_ID => p_treatm_row.SUBJ2_ID ,
--            p_TO_DATE => p_treatm_row.TO_DATE  ,
--            p_STATUS_ID => 921 ,
--            p_TREATM_CATEGORY_ID => p_treatm_row.TREATM_CATEGORY_ID  ,
--            p_TYPE2_ID  => p_treatm_row.TYPE2_ID ,
--            p_treatm_group_id => p_treatm_group_id ,
--            p_TREATM_NAME => p_treatm_row.TREATM_NAME ,
--            p_TREATM_ID =>   v_teatm_id,
--            p_TREATM_NAME_ID  => p_treatm_row.TREATM_NAME_ID ,
--            p_DESCRIPTION     => 'forrás:'||p_treatm_row.TREATM_NAME || ' ' ||p_treatm_row.DESCRIPTION,
--            p_MM_ID => p_treatm_row.MM_ID ,
--            p_FROM_DATE => p_treatm_row.FROM_DATE ,
--            p_TYPE1_ID => p_treatm_row.TYPE1_ID,
--            p_SUBJ1_ID => p_treatm_row.SUBJ1_ID ,
--            p_TIME_END => p_treatm_row.TIME_END ,
--            p_TREATM_TYPE_ID  => p_treatm_row.TREATM_TYPE_ID );
--
--           FOR param IN (SELECT * FROM treatm_param WHERE p_treatm_row.treatm_id = treatm_param.treatm_id)
--             LOOP
--               select seq_base.nextval INTO v_param_id FROM dual;
--               treatm_param_tapi.ins(
--    
--                  p_TREATM_PARAM_ID => v_param_id ,
--                  p_STATUS_ID       => 921 ,
--                  p_TO_DATE         => param.TO_DATE ,
--                  p_SUBJ_ID         => param.SUBJ_ID  ,
--                  p_UNIT_TYPE_ID    => param.UNIT_TYPE_ID ,
--                  p_DESCRIPTION     => param.DESCRIPTION ,
--                  p_SUBJ_TYPE_ID    => param.SUBJ_TYPE_ID ,
--                  p_ORDER_NO        => param.ORDER_NO  ,
--                  p_MM_ID           => param.MM_ID ,
--                  p_FROM_DATE       => param.FROM_DATE ,
--                  p_treatm_param1_id => param.TREATM_PARAM_ID ,
--                  p_VALUE_TYPE_ID   => param.VALUE_TYPE_ID ,
--                  p_TREATM_ID       => v_teatm_id ,
--                  p_VALUE           => param.VALUE ,
--                  p_PARAM_TYPE_ID   => param.PARAM_TYPE_ID,
--                  p_EPI_ID          => param.EPI_ID );
--              END LOOP;
--
--           FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE p_treatm_row.treatm_id = treatm_rel.treatm_id2)
--            LOOP
--              
--              treatm_rel_tapi.ins(
--                                    p_TREATM_ID2   => v_teatm_id ,
--                                    p_TREATM_ID1   => child.TREATM_ID1,
--                                    p_REL_TYPE_ID  => 1610,
--                                    p_Status_id    => 921
--                                );
--
--            END LOOP;

       RETURN v_teatm_id;
    END;

FUNCTION   copy_tree(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
                p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER
    IS
    v_teatm_id TREATM.TREATM_ID%TYPE;
    v_child_id TREATM.TREATM_ID%TYPE;
    v_treatm_row treatm%ROWTYPE;
    v_param_id treatm_param.treatm_param_id%TYPE;
    v_cnt NUMBER (12,0);
    v_new_treatm_id NUMBER(12,0);
    BEGIN
--     
--      SELECT count(1) INTO v_cnt FROM treatm_copy_temp WHERE treatm_id =  p_treatm_id;
--      IF v_cnt > 0 THEN
--        select new_treatm_id INTO v_new_treatm_id from treatm_copy_temp WHERE treatm_id =  p_treatm_id;
--        RETURN (v_new_treatm_id);
--      END IF;
--
--      SELECT seq_base.nextval INTO v_teatm_id FROM dual d;
--      SELECT * INTO v_treatm_row FROM treatm WHERE treatm_id = p_TREATM_ID;
--      INSERT INTO treatm_copy_temp (treatm_id,new_treatm_id) VALUES (p_treatm_id,v_teatm_id);
--
--     ins(
--    p_TIME_START => v_treatm_row.TIME_START, 
--    p_SUBJ2_ID => v_treatm_row.SUBJ2_ID ,
--    p_STATE_START_ID => v_treatm_row.STATE_START_ID ,
--    p_TO_DATE => v_treatm_row.TO_DATE  ,
--    p_STATUS_ID => 921 ,
--    p_TREATM_CATEGORY_ID => v_treatm_row.TREATM_CATEGORY_ID  ,
--    p_STATE_END_ID => v_treatm_row.STATE_END_ID,
--    p_TYPE2_ID  => v_treatm_row.TYPE2_ID ,
--    p_treatm_group_id => p_treatm_group_id ,
--    p_TREATM_NAME => v_treatm_row.TREATM_NAME ,
--    p_TREATM_ID =>   v_teatm_id,
--    p_TREATM_NAME_ID  => v_treatm_row.TREATM_NAME_ID ,
--    p_DESCRIPTION     => 'forrás:'||v_treatm_row.TREATM_NAME || ' ' ||v_treatm_row.DESCRIPTION,
--    p_DATA_OWNER_ID => v_treatm_row.DATA_OWNER_ID ,
--    p_MM_ID => v_treatm_row.MM_ID ,
--    p_FROM_DATE => v_treatm_row.FROM_DATE ,
--    p_TYPE1_ID => v_treatm_row.TYPE1_ID,
--    p_SUBJ1_ID => v_treatm_row.SUBJ1_ID ,
--    p_TIME_END => v_treatm_row.TIME_END ,
--    p_EPI_ID  => v_treatm_row.EPI_ID ,
--    p_TREATM_TYPE_ID  => v_treatm_row.TREATM_TYPE_ID );
--
--    FOR param IN (SELECT * FROM treatm_param WHERE v_treatm_row.treatm_id = treatm_param.treatm_id)
--      LOOP
--      select seq_base.nextval INTO v_param_id FROM dual;
--      treatm_param_tapi.ins(
--    
--    p_TREATM_PARAM_ID => v_param_id ,
--    p_STATUS_ID       => 921 ,
--    p_TO_DATE         => param.TO_DATE ,
--    p_SUBJ_ID         => param.SUBJ_ID  ,
--    p_UNIT_TYPE_ID    => param.UNIT_TYPE_ID ,
--    p_DESCRIPTION     => param.DESCRIPTION ,
--    p_SUBJ_TYPE_ID    => param.SUBJ_TYPE_ID ,
--    p_ORDER_NO        => param.ORDER_NO  ,
--    p_MM_ID           => param.MM_ID ,
--    p_FROM_DATE       => param.FROM_DATE ,
--    p_treatm_param1_id => param.TREATM_PARAM_ID ,
--    p_VALUE_TYPE_ID   => param.VALUE_TYPE_ID ,
--    p_TREATM_ID       => v_teatm_id ,
--    p_VALUE           => param.VALUE ,
--    p_PARAM_TYPE_ID   => param.PARAM_TYPE_ID,
--    p_EPI_ID          => param.EPI_ID );
--
--      END LOOP;
--
--      FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE v_treatm_row.treatm_id = treatm_rel.treatm_id2)
--        LOOP
--         v_child_id := copy_tree(child.treatm_id1,p_treatm_group_id);
--         treatm_rel_tapi.ins(
--            p_TREATM_ID2   => v_teatm_id ,
--            p_TREATM_ID1   => v_child_id ,
--            p_REL_TYPE_ID  => 1610,
--            p_Status_id    => 921
--        );
--
--        END LOOP;

      RETURN v_teatm_id;
    END;

  PROCEDURE activate(p_TREATM_ID IN TREATM.TREATM_ID%TYPE)
    IS
    v_treatm_row treatm%ROWTYPE;
    v_param_id treatm_param.treatm_param_id%TYPE;
    v_cnt NUMBER (12,0);
    v_error_text VARCHAR2(2000);
    BEGIN   
--      /*  
--      SELECT count(1) INTO v_cnt FROM treatm_copy_temp WHERE treatm_id =  p_treatm_id;
--      IF v_cnt > 0 THEN
--        RETURN;
--      END IF;
--      */
--      BEGIN
--        SELECT * into v_treatm_row FROM treatm  WHERE p_treatm_id = treatm_id;
--       EXCEPTION
--        WHEN OTHERS THEN
--           raise_application_error(-20000,'Nem lelt ilyen treatment_id-t:'||p_treatm_id);
--      END;
--      v_error_text := apex_condtion
--                    (
--                           p_treatm_id          => v_treatm_row.treatm_id,
--                           p_treatm_name        => v_treatm_row.treatm_name,
--                           p_treatm_group_id    => v_treatm_row.treatm_group_id ,
--                           p_TREATM_TYPE_ID     => v_treatm_row.TREATM_TYPE_ID,
--                           p_TREATM_CATEGORY_ID => v_treatm_row.TREATM_CATEGORY_ID,
--                           p_TYPE1_ID           => v_treatm_row.TYPE1_ID,
--                           p_TYPE2_ID           => v_treatm_row.TYPE2_ID,
--                           p_SUBJ1_ID           => v_treatm_row.SUBJ1_ID ,
--                           p_SUBJ2_ID           => v_treatm_row.SUBJ2_ID,
--                           p_STATE_START_ID     => v_treatm_row.STATE_START_ID,
--                           p_STATE_END_ID       => v_treatm_row.STATE_END_ID ,
--                           p_TIME_START         => v_treatm_row.TIME_START ,
--                           p_TIME_END           => v_treatm_row.TIME_END,
--                           p_from_date          => v_treatm_row.from_date,
--                           p_to_date            => v_treatm_row.to_date,
--                           p_STATUS_ID          => 917
--                    );
--    IF v_error_text != NULL THEN
--      RAISE_APPLICATION_ERROR(-20000,v_error_text); 
--    END IF;  
--      --INSERT INTO treatm_copy_temp (treatm_id,new_treatm_id) VALUES (p_treatm_id,null);
--      update treatm SET status_id = 917 where treatm_id = p_treatm_id;
--      UPDATE treatm_param SET status_id = 917 where treatm_id = p_treatm_id;
--      UPDATE treatm_rel SET status_id = 917 WHERE p_treatm_id = treatm_rel.treatm_id2; 
--      FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE p_treatm_id = treatm_rel.treatm_id2)
--        LOOP
--         activate(child.treatm_id1);
--        END LOOP;
    return;
    END;
    

FUNCTION apex_condtion(  p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
IS
  BEGIN
--
--    IF p_from_date > p_to_date THEN 
--        
--        INSERT INTO wk_pf_audit_table VALUES ('hiba','A záró dátum nem lehet kisebb a kezdõ dátumnál');
--        COMMIT;
--        RETURN 'A záró dátum nem lehet kisebb a kezdõ dátumnál';
--    END IF;
--    IF p_treatm_group_id  = 1601 THEN /*Norma*/
--        RETURN apex_condtion_norma(  
--                           p_treatm_id => p_treatm_id,
--                           p_treatm_name => p_treatm_name,
--                           p_treatm_group_id => p_treatm_group_id,
--                           p_TREATM_TYPE_ID => p_TREATM_TYPE_ID,
--                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
--                           p_TYPE1_ID => p_TYPE1_ID,
--                           p_TYPE2_ID => p_TYPE2_ID,
--                           p_from_date => p_from_date,
--                           p_to_date => p_to_date,
--                           p_STATUS_ID => p_STATUS_ID
--                       );
--      ELSE 
--         RETURN apex_condtion_other(  
--                           p_treatm_id  => p_treatm_id,
--                           p_treatm_name  => p_treatm_name,
--                           p_treatm_group_id  => p_treatm_group_id,
--                           p_TREATM_TYPE_ID  => p_TREATM_TYPE_ID ,
--                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
--                           p_TYPE1_ID  => p_TYPE1_ID,
--                           p_TYPE2_ID  => p_TYPE2_ID,
--                           p_SUBJ1_ID  => p_SUBJ1_ID,
--                           p_SUBJ2_ID  => p_SUBJ2_ID,
--                           p_STATE_START_ID  => p_STATE_START_ID,
--                           p_STATE_END_ID  => p_STATE_END_ID,
--                           p_TIME_START  => p_TIME_START,
--                           p_TIME_END  => p_TIME_END,
--                           p_from_date  => p_from_date,
--                           p_to_date  => p_to_date,
--                           p_STATUS_ID  => p_STATUS_ID
--                       );
--    END IF;

    return null;
  END; 


FUNCTION apex_condtion_norma(  p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
is
  l_rows pls_integer;
  v_error_text VARCHAR2(2000) := 'Már létezik sor a következõ értékekkel';
  BEGIN
    SELECT count(1) INTO l_rows FROM treatm 
      WHERE  
      TREATM.TREATM_GROUP_ID = p_treatm_group_id
      AND (p_treatm_id IS NULL OR p_treatm_id != treatm_id)
      AND TREATM.TREATM_NAME = p_treatm_name 
      AND TREATM.TREATM_TYPE_ID = p_TREATM_TYPE_ID
      AND TREATM.TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID
      AND TREATM.TYPE1_ID = p_TYPE1_ID
      AND TREATM.TYPE2_ID = p_TYPE2_ID 
      AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
      AND STATUS_ID NOT IN (919,921);     
      IF l_rows > 0 THEN 
        v_error_text := v_error_text ||  '<br/>;p_treatm_group_id    :'|| lookup_super_type_name(p_treatm_group_id);
        v_error_text := v_error_text ||  '<br/>;p_treatm_name        :'|| p_treatm_name;
        v_error_text := v_error_text ||  '<br/>;p_treatm_type_id     :'|| lookup_super_type_name(p_TREATM_TYPE_ID);   
        v_error_text := v_error_text ||  '<br/>;p_treatm_category_id :'|| lookup_super_type_name(p_TREATM_CATEGORY_ID);
        v_error_text := v_error_text ||  '<br/>;p__type1_id          :'|| lookup_super_type_name(p_TYPE1_ID);
        v_error_text := v_error_text ||  '<br/>;p_type2_id           :'|| lookup_super_type_name(p_TYPE2_ID);       
        v_error_text := v_error_text ||  '<br/>;p_from_date          :'|| to_char(p_from_date,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>;p_to_date            :'|| to_char(p_to_date,'YYYY.MM.DD');
       -- v_error_text := v_error_text ||  '<br/>;p_status_id          :'|| lookup_super_type_name(p_STATUS_ID);
        RETURN v_error_text;
      END IF;      
    RETURN NULL;
  END;

  FUNCTION apex_condtion_other(  
                           p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
    AS
    l_rows pls_integer;
    v_error_text VARCHAR2(2000) := 'Már létezik sor a következõ értékekkel';
    BEGIN 
      SELECT count(1) INTO l_rows FROM treatm 
      WHERE  
      TREATM.TREATM_GROUP_ID = p_treatm_group_id
      AND (p_treatm_id IS NULL OR p_treatm_id != treatm_id)
      AND TREATM.TREATM_NAME = p_treatm_name 
      AND TREATM.TREATM_TYPE_ID = p_TREATM_TYPE_ID
      AND TREATM.TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID
      AND TREATM.TYPE1_ID = p_TYPE1_ID
      AND TREATM.TYPE2_ID = p_TYPE2_ID 
      AND nvl(treatm.subj1_id,-1) = nvl(p_subj1_id,-1)
      AND nvl(treatm.subj2_id,-1) = nvl(p_subj2_id,-1)
      AND nvl(treatm.time_start,sysdate) = nvl(p_time_start,sysdate )
      AND nvl(treatm.time_end,sysdate) = nvl( p_time_end,sysdate )
      AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
      AND STATUS_ID NOT IN (919,921);     
      IF l_rows > 0 THEN 
        v_error_text := v_error_text ||  '<br/>;p_treatm_group_id    :'|| lookup_super_type_name(p_treatm_group_id);
        v_error_text := v_error_text ||  '<br/>;p_treatm_name        :'|| p_treatm_name;
        v_error_text := v_error_text ||  '<br/>;p_treatm_type_id     :'|| lookup_super_type_name(p_TREATM_TYPE_ID);   
        v_error_text := v_error_text ||  '<br/>null;p_treatm_category_id :'|| lookup_super_type_name(p_TREATM_CATEGORY_ID);
        v_error_text := v_error_text ||  '<br/>;p__type1_id          :'|| lookup_super_type_name(p_TYPE1_ID);
        v_error_text := v_error_text ||  '<br/>;p_type2_id           :'|| lookup_super_type_name(p_TYPE2_ID);
        v_error_text := v_error_text ||  '<br/>;p_subj1_id           :'|| lookup_subj_name(p_subj1_id);
        v_error_text := v_error_text ||  '<br/>;p_subj2_id           :'|| lookup_subj_name(p_subj2_id);
        v_error_text := v_error_text ||  '<br/>;p_time_start          :'|| to_char(p_time_start,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>;p_time_end           :'|| to_char(p_time_end,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>;p_from_date          :'|| to_char(p_from_date,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>;p_to_date            :'|| to_char(p_to_date,'YYYY.MM.DD');
        --v_error_text := v_error_text ||  '<br/>;p_status_id          :'|| lookup_super_type_name(p_STATUS_ID);
        RETURN v_error_text;
      END IF;  
             COMMIT;      
    RETURN NULL;
    END;
    
    FUNCTION GET_NAME(p_treatm_id TREATM.TREATM_ID%TYPE) RETURN VARCHAR2 AS
    v_ret_val VARCHAR2 (255);
    BEGIN
      SELECT TREATM_NAME INTO v_ret_val FROM TREATM WHERE TREATM_ID = p_treatm_id; 
      RETURN v_ret_val;
    END;

END TREATM_tapi;

/
