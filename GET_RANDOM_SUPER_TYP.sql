--------------------------------------------------------
--  DDL for Function GET_RANDOM_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_RANDOM_SUPER_TYP" (p_group_id number)
  RETURN number
AS
  v_retval number (12,0);
BEGIN
    SELECT super_typ_id into v_retval FROM( SELECT super_typ_id FROM  dm_super_typ where GROUP_ID = p_group_id  ORDER BY dbms_random.value ) WHERE rownum = 1;
    RETURN v_retval;
END;

/
