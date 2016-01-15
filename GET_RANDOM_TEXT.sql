--------------------------------------------------------
--  DDL for Function GET_RANDOM_TEXT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_RANDOM_TEXT" (p_table in varchar2, p_neme out varchar2,  p_sex in varchar2 default null)
  RETURN varchar2
AS
l_retval varchar2 (2000);
l_dm_First_names_row dm_First_names%rowtype;
l_sex varchar2 (1);
l_where varchar2 (100) := null;
BEGIN
  if p_table = 'DM_FIRST_NAMES' then
     if p_sex is null then
        SELECT * into l_dm_First_names_row FROM( SELECT * FROM dm_First_names ORDER BY dbms_random.value ) WHERE rownum = 1;
     ELSE
        SELECT * into l_dm_First_names_row FROM( SELECT * FROM dm_First_names WHERE sex = p_sex ORDER BY dbms_random.value ) WHERE rownum = 1;

     END IF;
     l_retval := l_dm_First_names_row.description;
     l_sex := l_dm_First_names_row.sex;
     p_neme := l_dm_First_names_row.sex;
 elsif p_table = 'DM_LAST_NAME' then
     SELECT NAME into l_retval FROM( SELECT NAME FROM dm_last_name ORDER BY dbms_random.value ) WHERE rownum = 1;
     l_sex := null;
 elsif p_table = 'DM_CITY' then
     SELECT NAME into l_retval FROM( SELECT NAME FROM varosok ORDER BY dbms_random.value ) WHERE rownum = 1;
     l_sex := null;
 elsif p_table = 'UCCAK' then
     SELECT NAME into l_retval FROM( SELECT "Közterület elnevezése"||' '||"Közterület jellege" name FROM UCCAK ORDER BY dbms_random.value ) WHERE rownum = 1;
  
   elsif p_table = 'SUBJECT' then
SELECT subj_name INTO l_retval from
(select subj_name FROM V_SUBJECTIV where subj_category_id = 1300
 ORDER BY dbms_random.value)
  WHERE rownum = 1;
  else 
    return null;
  end if;
  return l_retval;
END;

/
