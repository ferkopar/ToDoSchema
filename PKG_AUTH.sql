--------------------------------------------------------
--  DDL for Package PKG_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PKG_AUTH" as
 function authenticate(p_username in varchar2,
 p_password in varchar2) return boolean;

 procedure register(p_username   in varchar2,
                    p_password   in varchar2,
                    p_first_name in varchar2,
                    p_last_name  in varchar2,
                    p_email      in varchar2,
                    p_phone      in varchar2);

end;

/
