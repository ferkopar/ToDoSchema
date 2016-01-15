--------------------------------------------------------
--  DDL for Package MENU
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MENU" AS
  FUNCTION GenerateMenu RETURN MENU_TYPE PIPELINED;
  PROCEDURE GENERATE_MENU_HTML;
  END MENU;

/
