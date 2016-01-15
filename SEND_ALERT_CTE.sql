--------------------------------------------------------
--  DDL for Procedure SEND_ALERT_CTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SEND_ALERT_CTE" 
(
   p_treatm_tmp_id NUMBER
  )
AS
   v_alert_id number (12,0);
begin
 v_alert_id := get_next_id();
INSERT INTO AMNIS.ALERT(ALERT_ID, ALERT_TYPE_ID, MESSAGE_ID, ALERT_STATUS, EPI_ID, U_COMMENT, TO_DATE, PRIORITY,SUBJ_ID) VALUES
(v_alert_id ,30101, 200, null, null,'Befejezetlen treatment szerkesztés', null, 0,GET_SUBJ_ID(V('APP_USER')));
INSERT INTO AMNIS.ALERT_PARAM(ALERT_PARAM_ID, ALERT_ID, PARAM_TYPE_ID, APEX_PAGE) VALUES
(get_next_id(), v_alert_id ,30201,610);
INSERT INTO AMNIS.ALERT_PARAM(ALERT_PARAM_ID, ALERT_ID, PARAM_TYPE_ID, APEX_VARIABLE, VALUE) VALUES
(get_next_id(), v_alert_id, 30202,'P610_TREATM_TMP_ID', p_treatm_tmp_id);
END;

/
