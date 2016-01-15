--------------------------------------------------------
--  DDL for Function SUBJ_IS_IN_TYPE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SUBJ_IS_IN_TYPE" 
(
  P_USER_NAME IN VARCHAR2 ,
  P_USER_TYPE_ID IN NUMBER
) RETURN NUMBER AS 
v_user_type_id number (12,0);
v_user_id NUMBER (12,0);
v_user_in_role NUMBER (10) := 0;
BEGIN
  select subj_id  into v_user_id from dm_user where user_name = P_USER_NAME;
  select count(1) into v_user_in_role
    from V_SUBJ_SUBJ_TYPE WHERE SUBJ_ID = v_user_id AND SUBJ_TYPE_ID = P_USER_TYPE_ID;
  RETURN v_user_in_role;
END SUBJ_IS_IN_TYPE;

/
