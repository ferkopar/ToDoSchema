--------------------------------------------------------
--  DDL for Function MENU_RIGHT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "MENU_RIGHT" (p_user_name VARCHAR2)
  RETURN NUMBER
  AS
  BEGIN
    IF UPPER(p_user_name) IN ('FPARDI', 'LGABORI', 'RENDEK', 'ZWENINGER', 'ATOTH')
    THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END;

/
