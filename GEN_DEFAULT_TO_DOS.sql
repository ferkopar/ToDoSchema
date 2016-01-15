--------------------------------------------------------
--  DDL for Procedure GEN_DEFAULT_TO_DOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GEN_DEFAULT_TO_DOS" (p_user_name VARCHAR2) 
AS

cursor treatments(p_user_id number) is
SELECT to_number(VALUE)AS TREATM_ID from SUBJ_PARAM
  where SUBJ_ID = p_user_id
  and PARAM_TYPE_ID = 11250;

v_user_id NUMBER (12,0);
v_treatm TREATM%ROWTYPE;
v_treatm_param TREATM_PARAM%ROWTYPE;
v_treatm_id NUMBER (12,0);
v_new_treatm_id NUMBER (12,0);
v_alert_id NUMBER (12,0);
v_message_id NUMBER (12,0);
v_treatm_param_exists NUMBER(1,0);
v_dummy number;
v_treatm_exist NUMBER(1,0);
BEGIN
  v_user_id := get_subj_id(p_user_name);
  if v_user_id is null then
     return;
  end if;
  for treatment in treatments(v_user_id) 
    LOOP

       SELECT COUNT(1) into v_treatm_exist FROM TREATM 
        where TREATM_GROUP_ID = 1604 
        and   TREATM_NAME_ID = treatment.TREATM_ID
        AND   TO_CHAR(FROM_DATE,'YYYY.MM.DD') = TO_CHAR(SYSDATE,'YYYY.MM.DD');

       IF v_treatm_exist > 0 then
        continue;
       end if;

       select * into v_treatm from TREATM  where TREATM_ID = treatment.TREATM_ID;
       select * into v_treatm_param from TREATM_PARAM WHERE TREATM_ID = treatment.TREATM_ID AND PARAM_TYPE_ID = 1308590031;


       v_message_id := 300;
--       SELECT alert_text_id into v_message_id from W_PF_TREATM_ALERT_TEXT where TREATM_ID = treatment.TREATM_ID;
       SELECT SEQ_BASE.NEXTVAL INTO v_new_treatm_id from DUAL; 
       SELECT SEQ_BASE.NEXTVAL INTO v_alert_id from DUAL;  

       INSERT INTO TREATM (TREATM_ID, TREATM_NAME, TREATM_GROUP_ID,TREATM_CATEGORY_ID, TREATM_TYPE_ID, TIME_START,TYPE1_ID,SUBJ1_ID,TYPE2_ID,STATUS_ID,TREATM_NAME_ID )
                   VALUES (v_new_treatm_id,TO_CHAR(SYSDATE,'YYYY.MM.DD HH24:MI.SS')||' '||v_treatm.TREATM_NAME,1604,
                           v_treatm.TREATM_CATEGORY_ID,v_treatm.TREATM_TYPE_ID,SYSDATE,v_treatm.TYPE1_ID,1308590112,v_treatm.TYPE2_ID,913,treatment.TREATM_ID);
       INSERT INTO TREATM_PARAM (TREATM_PARAM1_ID,SUBJ_TYPE_ID,SUBJ_ID, TREATM_ID,PARAM_TYPE_ID)
                        VALUES  (v_treatm_param.TREATM_PARAM_ID,v_treatm_param.SUBJ_TYPE_ID,v_user_id,v_new_treatm_id,v_treatm_param.PARAM_TYPE_ID);
      
       INSERT INTO ALERT (ALERT_ID, ALERT_TYPE_ID, MESSAGE_ID, SUBJ_ID,STATUS_ID)
                  VALUES (v_alert_id,100,v_message_id,v_user_id,913);     
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_PAGE)
                     VALUES (v_alert_id,30201,401);
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_VARIABLE,VALUE)
                     VALUES (v_alert_id,30202,'P401_NORMA_ID',v_new_treatm_id);
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_VARIABLE,VALUE)
                     VALUES (v_alert_id,30202,'P401_ALERT_ID',v_alert_id);
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_VARIABLE,VALUE)
                     VALUES (v_alert_id,30202,'P401_ACTION','CREATE_FACT');
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,VALUE)
                   VALUES (v_alert_id,30203,'BRANCH_TO_PAGE_ACCEPT');
     
        v_dummy := insert_treatm_N_K_REL(v_treatm.TREATM_ID, v_new_treatm_id);
    END LOOP;
END;

/
