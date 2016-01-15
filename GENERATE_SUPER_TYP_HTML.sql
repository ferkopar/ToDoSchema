--------------------------------------------------------
--  DDL for Package GENERATE_SUPER_TYP_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GENERATE_SUPER_TYP_HTML" AS

  PROCEDURE SAVE_CHANGES(p_json varchar2);
  PROCEDURE GENERATE_SUPER_TYP_TOP_LEVEL;
  PROCEDURE GENERATE_TREE_TABLE_ROWS(p_group_id number);

  PROCEDURE GENERATE_SUPER_TYP_EDITOR (p_super_typ_id number, p_group_id number default null);

END GENERATE_SUPER_TYP_HTML;

/
