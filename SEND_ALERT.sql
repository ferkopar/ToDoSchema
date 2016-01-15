--------------------------------------------------------
--  DDL for Procedure SEND_ALERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SEND_ALERT" (
   p_alert_id NUMBER
 , p_beerkezes_id NUMBER
 , p_user_id NUMBER
 , p_apex_page NUMBER
 , p_text VARCHAR2
  )
AS
   v_alert_id number (12,0);
begin
 v_alert_id := get_next_id();
INSERT INTO AMNIS.ALERT(ALERT_ID, ALERT_TYPE_ID, MESSAGE_ID, ALERT_STATUS, EPI_ID, U_COMMENT, TO_DATE, PRIORITY,SUBJ_ID) VALUES
(v_alert_id ,30101, 200, null, null, p_text, null, 0,p_user_id);
INSERT INTO AMNIS.ALERT_PARAM(ALERT_PARAM_ID, ALERT_ID, PARAM_TYPE_ID, APEX_PAGE) VALUES
(get_next_id(), v_alert_id ,30201,p_apex_page);
INSERT INTO AMNIS.ALERT_PARAM(ALERT_PARAM_ID, ALERT_ID, PARAM_TYPE_ID, APEX_VARIABLE, VALUE) VALUES
(get_next_id(), v_alert_id, 30202,'P1902_BEERKEZES_ID', p_beerkezes_id);
update alert set status_id = 919 where alert_id = p_alert_id;
END;

/
