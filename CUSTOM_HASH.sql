--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CUSTOM_HASH" (p_username IN VARCHAR2,
                                                p_password IN VARCHAR2)
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

/
