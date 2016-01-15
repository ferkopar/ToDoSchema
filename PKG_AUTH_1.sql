--------------------------------------------------------
--  DDL for Package Body PKG_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PKG_AUTH" as

FUNCTION custom_hash(p_username IN VARCHAR2, p_password IN VARCHAR2)
  RETURN VARCHAR2
  IS
    l_password VARCHAR2(4000);
    l_salt     VARCHAR2(4000) := '3FJ7EDNDLQ3ZMA5DONJ88L7ZE4G3FD';
  BEGIN

    -- This function should be wrapped, as the hash algorhythm is exposed here.
    -- You can change the value of l_salt or the method of which to call the
    -- DBMS_OBFUSCATOIN toolkit, but you much reset all of your passwords
    -- if you choose to do this.

    l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5
    (input_string => p_password || SUBSTR(l_salt, 10, 13) || p_username ||
    SUBSTR(l_salt, 4, 10)));
    RETURN l_password;
  END;

 function authenticate(p_username in varchar2,
 p_password in varchar2) return boolean is
 -- default the result to 0
 v_result integer := 0;
 v_dm_user_row dm_user%rowtype;
 l_password varchar2(4000);

 begin
 -- store 1 in v_result if a matching row
 -- can be found
 select *
 into v_dm_user_row
 from dm_user
 where upper(USER_NAME) = upper(p_username);
 
 l_password := custom_hash(p_username, p_password);
 if l_password = v_dm_user_row.USER_PSWD then
  return true;
 elsif p_password = v_dm_user_row.USER_PSWD then
  return true;
 else
  return false;
 end if;

 
 exception

 -- if no record was found then return false
 when no_data_found then
 return false;
 end authenticate;


procedure register( p_username   in varchar2,
                    p_password   in varchar2,
                    p_first_name in varchar2,
                    p_last_name  in varchar2,
                    p_email      in varchar2,
                    p_phone      in varchar2) is
v_subj_id number (12,0);
v_subj_type_id number := 1011;
v_subj_category_id number := 1010;
begin

insert INTO SUBJECT 
            (ROLL_TYPE,SUBJ_CATEGORY_ID)
       VALUES (0,v_subj_category_id)
       RETURNING subj_id INTO v_subj_id;

-- Vezetéknév
insert INTO subj_param 
            (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID)
       VALUES
            (v_subj_id,1112,p_last_name,v_subj_type_id);
-- Keresztnév
insert INTO subj_param 
            (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID)
       VALUES
            (v_subj_id,1113,p_first_name,v_subj_type_id);
-- Emilcím
insert INTO subj_param 
            (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID)
       VALUES
            (v_subj_id,1121,p_email,v_subj_type_id);

-- Telefon
insert INTO subj_param 
            (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID)
       VALUES
            (v_subj_id,1125,p_phone,v_subj_type_id);

-- subj típus felhasználó
insert INTO subj_param 
            (SUBJ_ID,PARAM_TYPE_ID,VALUE,VALUE_TYPE_ID,SUBJ_TYPE_ID)
       VALUES
            (v_subj_id,1001,'1011', v_subj_type_id,v_subj_type_id);

--insert INTO DM_USER
--            (USER_NAME,USER_PSWD,EMAIL,SUBJ_ID)
--       VALUES
--            (p_username,p_password,p_email,v_subj_id);


apex_authentication.login(
    p_username => p_username,
    p_password => p_password );


end register;

end;

/
