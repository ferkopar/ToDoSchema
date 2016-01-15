--------------------------------------------------------
--  DDL for Function GET_RANDOM_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_RANDOM_ID" (p_table in varchar2)
  RETURN number
AS
  v_retval number (12,0);
BEGIN
 if p_table = 'DM_CITY' then
    SELECT dm_city_id into v_retval FROM( SELECT dm_city_id FROM dm_city ORDER BY dbms_random.value ) WHERE rownum = 1;
    RETURN v_retval;
 elsif p_table = 'SUBJECT' then
SELECT SUBJ_ID into v_retval  from
(select SUBJ_ID FROM V_SUBJECTIV where subj_category_id = 1300
 ORDER BY dbms_random.value)
  WHERE rownum = 1;
     RETURN v_retval;
 elsif p_table = 'DM_LANGUAGE' then
    SELECT LANGUAGE_ID into v_retval FROM( SELECT LANGUAGE_ID FROM DM_LANGUAGE WHERE STATUS_ID = 3 ORDER BY dbms_random.value ) WHERE rownum = 1;
    RETURN v_retval;
 ELSE
  return null;
 END IF; 
 
END;

/
