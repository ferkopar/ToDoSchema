--------------------------------------------------------
--  DDL for Procedure DO_SYSTEM_TASK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DO_SYSTEM_TASK" 
  (
     p_treatm_id NUMBER
   , p_data_owner_id NUMBER

  )
AS

CURSOR childs (pc_treatm_id NUMBER) IS
  SELECT * FROM treatm T WHERE EXISTS
    (SELECT 1 FROM treatm_rel tr WHERE treatm_id1 = t.treatm_id AND treatm_id2 = pc_treatm_id);
CURSOR params (pc_treatm_id NUMBER) IS
  SELECT * FROM treatm_param tp WHERE  treatm_id = pc_treatm_id;
v_cnt integer;
v_alert_user_id number (12,0);
v_u_comment varchar2(2000);
v_treatm_id number (12,0);
v_new_alert_id number (12,0);
v_apex_page number (12,0);
v_teny_id number (12,0);
v_new_child_treatm_id  number (12,0);
v_head treatm%rowtype;
v_adat_beerkezes_id NUMBER (12,0);
BEGIN

   v_treatm_id := p_treatm_id;
   select * into v_head from treatm where treatm_id = v_treatm_id;
   update treatm set status_id = 915 where treatm_id = v_treatm_id ;

  CREATE_ADAT_BEERKEZES(v_head.subj1_id, 20203, 61, v_head.TIME_START, v_head.TIME_END, P_DATA_OWNER_ID,v_adat_beerkezes_id);
/*
INSERT INTO AMNIS.TREATM(TREATM_NAME,TREATM_GROUP_ID, TREATM_TYPE_ID, STATUS_ID, TREATM_CATEGORY_ID, TIME_START, TIME_END, SUBJ1_ID, TYPE1_ID, SUBJ2_ID, TYPE2_ID,DATA_OWNER_ID) 
                      VALUES(v_head.treatm_name,1604, v_head.TREATM_TYPE_ID,v_head.STATUS_ID
                             ,v_head.TREATM_CATEGORY_ID,v_head.time_start,v_head.time_end
                             ,v_head.subj1_id
                             ,v_head.TYPE1_ID
                             ,v_head.subj1_id
                             ,v_head.TYPE2_ID
                             ,v_head.DATA_OWNER_ID) returning treatm_id  into v_teny_id; */


   for child in childs(v_treatm_id )
   loop
   if child .type2_id = 811 then
       v_cnt := 0;
       select count(1) into v_cnt from treatm_param where treatm_id = child.treatm_id and param_type_id = 30203;
       if v_cnt != 0 then
           select subj_id into v_alert_user_id  from treatm_param where treatm_id = child.treatm_id  and param_type_id = 30203;
           select treatm_name into v_u_comment from treatm where treatm_id = v_treatm_id;     
           select get_next_id() into v_new_alert_id from dual;
           INSERT INTO AMNIS.ALERT(ALERT_ID,ALERT_TYPE_ID,  STATUS_ID, SUBJ_ID, DESCRIPTION) VALUES(v_new_alert_id , 30101, 912, v_alert_user_id , v_u_comment );
           select lookup_super_type_name(value_type_id) into v_apex_page  from treatm_param  where treatm_id = child.treatm_id and param_type_id = 30201;
           begin
           INSERT INTO AMNIS.ALERT_PARAM(ALERT_ID,       PARAM_TYPE_ID, APEX_PAGE,   APEX_VARIABLE, VALUE, DESCRIPTION, status_id, SUBJ_ID) 
                                 VALUES (v_new_alert_id , 30201,        v_apex_page, null,          null,  null,        912,        null); 
           INSERT INTO AMNIS.ALERT_PARAM(ALERT_ID,       PARAM_TYPE_ID, APEX_PAGE,   APEX_VARIABLE, VALUE, DESCRIPTION, status_id, SUBJ_ID) 
                                 VALUES (v_new_alert_id , 30202,        null, 'P1900_BEERKEZES_ID',   v_adat_beerkezes_id,  null,        912,      null); 
           exception
              WHEN OTHERS THEN
                    INSERT INTO wk_pf_audit_table (error_number, error_message)
                    VALUES ('hiba','hiba');
           end;
          
           -- tény beszúrás 
/*
           INSERT INTO AMNIS.TREATM(TREATM_NAME,TREATM_GROUP_ID, TREATM_TYPE_ID, STATUS_ID, TREATM_CATEGORY_ID, TIME_START, TIME_END, SUBJ1_ID, TYPE1_ID, SUBJ2_ID, TYPE2_ID,DATA_OWNER_ID) 
                      VALUES(child.treatm_name,1604, child.TREATM_TYPE_ID,child.STATUS_ID
                             ,child.TREATM_CATEGORY_ID,child.time_start,child.time_end
                             ,child.subj1_id
                             ,child.TYPE1_ID
                             ,child.subj1_id
                             ,child.TYPE2_ID
                             ,child.DATA_OWNER_ID )RETURNING v_new_child_treatm_id into v_new_child_treatm_id;
         INSERT INTO AMNIS.TREATM_REL( TREATM_ID1, TREATM_ID2, REL_TYPE_ID) 
                          VALUES( v_new_child_treatm_id, v_teny_id ,1611);

          INSERT INTO AMNIS.ALERT_PARAM(ALERT_ID,       PARAM_TYPE_ID, APEX_PAGE,   APEX_VARIABLE, VALUE, DESCRIPTION, status_id, SUBJ_ID) 
                                 VALUES (v_new_alert_id , 30205,        null, null,          null,  v_teny_id,        912,      null); 
*/
       end if; 
    END IF;
   end loop;

END;

/
