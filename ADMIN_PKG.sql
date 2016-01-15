--------------------------------------------------------
--  DDL for Package ADMIN_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "ADMIN_PKG" is
  apex_user  VARCHAR2 (100) := NVL (APEX_APPLICATION.g_user, USER);
  FUNCTION GET_USER_TABLE_PK(p_table IN user_tables.table_name%TYPE) return VARCHAR2;
  PROCEDURE cre_logtrg_t (p_table IN user_tables.table_name%TYPE);
                                                            -- logoló trigger létrehozása a táblanév like paraméter táblá(k)-ra
  PROCEDURE cre_trg;
                                                            -- id, cru, crd, mdu, mdd kezelõ trigger létrehozása a táblanév like paraméter táblá(k)-ra
  PROCEDURE dis_logtrg (p_table IN user_tables.table_name%TYPE);
                                                           -- logoló trigger kikapcsolása a táblanév like paraméter táblá(k)-ra
  PROCEDURE en_logtrg (p_table IN user_tables.table_name%TYPE);
                                                           -- logoló trigger bekapcsolása a táblanév like paraméter táblá(k)-ra
  procedure enable_all_constraint (p_table in user_tables.table_name%type default null);
  procedure disable_all_constraint (p_table in user_tables.table_name%type default null);
  procedure translate_remove_dupl;
  PROCEDURE Image_Load (vFileName  in varchar2);
  PROCEDURE all_Image_Load;
  PROCEDURE TR_ITEMS;
  --procedure translate_prc  (p_table in user_tables.table_name%type default null);
end ADMIN_PKG; 

/
