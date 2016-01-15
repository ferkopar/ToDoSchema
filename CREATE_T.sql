--------------------------------------------------------
--  DDL for Procedure CREATE_T
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CREATE_T" (
  p_treatm_id NUMBER
 ,p_subj_id NUMBER
 ,p_start_date DATE
 ,p_users VARCHAR2
 ,p_name VARCHAR2 )
AS
v_orig_treatm_row treatm%ROWTYPE;
v_new_treatm_id NUMBER (12,0);
  v_new_child_treatm_id NUMBER (12,0);
CURSOR childs (pc_treatm_id NUMBER) IS
  SELECT * FROM treatm T WHERE EXISTS
    (SELECT 1 FROM treatm_rel tr WHERE treatm_id1 = t.treatm_id AND treatm_id2 = pc_treatm_id);
CURSOR params (pc_treatm_id NUMBER) IS
  SELECT * FROM treatm_param tp WHERE  treatm_id = pc_treatm_id;
BEGIN
  SELECT * into v_orig_treatm_row FROM treatm T WHERE treatm_id = p_treatm_id;
  SELECT get_next_id() INTO v_new_treatm_id FROM dual d;
  INSERT INTO AMNIS.TREATM(treatm_id,TREATM_NAME,TREATM_GROUP_ID, TREATM_TYPE_ID, STATUS_ID, TREATM_CATEGORY_ID, TIME_START, TIME_END, SUBJ1_ID, TYPE1_ID, SUBJ2_ID, TYPE2_ID,DATA_OWNER_ID) 
                      VALUES(v_new_treatm_id,p_name,1603, v_orig_treatm_row.TREATM_TYPE_ID,v_orig_treatm_row.STATUS_ID
                             ,v_orig_treatm_row.TREATM_CATEGORY_ID,p_start_date,p_start_date
                             ,p_subj_id
                             ,v_orig_treatm_row.TYPE1_ID
                             ,GET_USER_ID(p_users,v_orig_treatm_row.TYPE2_ID)
                             ,v_orig_treatm_row.TYPE2_ID,v_orig_treatm_row.DATA_OWNER_ID);

  FOR param IN params(v_orig_treatm_row.treatm_id)
    LOOP
      INSERT INTO AMNIS.TREATM_PARAM(TREATM_PARAM1_ID,      TREATM_ID,       PARAM_TYPE_ID,      VALUE,      UNIT_TYPE_ID,       VALUE_TYPE_ID,       ORDER_NO,      DESCRIPTION, EPI_ID) VALUES
                                    (param.TREATM_PARAM_ID, v_new_treatm_id ,param.param_type_id,param.VALUE,param.UNIT_TYPE_ID, param.VALUE_TYPE_ID, param.ORDER_NO,param.DESCRIPTION,0);
    END LOOP;

  FOR child IN childs(v_orig_treatm_row.treatm_id)
    LOOP
    SELECT get_next_id() INTO v_new_child_treatm_id FROM dual d;

   INSERT INTO AMNIS.TREATM(treatm_id,TREATM_NAME,TREATM_GROUP_ID, TREATM_TYPE_ID, STATUS_ID, TREATM_CATEGORY_ID, TIME_START, TIME_END, SUBJ1_ID, TYPE1_ID, SUBJ2_ID, TYPE2_ID,DATA_OWNER_ID) 
                      VALUES(v_new_child_treatm_id,p_name,1603, child.TREATM_TYPE_ID,child.STATUS_ID
                             ,child.TREATM_CATEGORY_ID,p_start_date,p_start_date+get_intervall_days(child.treatm_id)
                             ,p_subj_id
                             ,child.TYPE1_ID
                             ,GET_USER_ID(p_users,child.TYPE2_ID)
                             ,child.TYPE2_ID,child.DATA_OWNER_ID);
    FOR param IN params(child.treatm_id)
    LOOP
      IF param.PARAM_TYPE_ID = 30203 THEN
        INSERT INTO AMNIS.TREATM_PARAM(TREATM_PARAM1_ID,      TREATM_ID,       PARAM_TYPE_ID,      VALUE,      UNIT_TYPE_ID,       VALUE_TYPE_ID,       ORDER_NO,      DESCRIPTION, EPI_ID, subj_type_id, subj_id) VALUES
                                    (param.TREATM_PARAM_ID, v_new_child_treatm_id ,param.param_type_id,param.VALUE,param.UNIT_TYPE_ID, param.VALUE_TYPE_ID, param.ORDER_NO,param.DESCRIPTION,0,param.subj_type_id,GET_USER_ID(p_users,param.subj_type_id));
      ELSE
          INSERT INTO AMNIS.TREATM_PARAM(TREATM_PARAM1_ID,      TREATM_ID,       PARAM_TYPE_ID,      VALUE,      UNIT_TYPE_ID,       VALUE_TYPE_ID,       ORDER_NO,      DESCRIPTION, EPI_ID) VALUES
                                    (param.TREATM_PARAM_ID, v_new_child_treatm_id ,param.param_type_id,param.VALUE,param.UNIT_TYPE_ID, param.VALUE_TYPE_ID, param.ORDER_NO,param.DESCRIPTION,0);
      END IF;
    END LOOP;

    INSERT INTO AMNIS.TREATM_REL( TREATM_ID1, TREATM_ID2, REL_TYPE_ID) 
                          VALUES( v_new_child_treatm_id, v_new_treatm_id,1611);
   
    END LOOP;
END;

/
