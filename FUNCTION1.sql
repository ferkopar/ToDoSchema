--------------------------------------------------------
--  DDL for Function FUNCTION1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FUNCTION1" (p_user_name VARCHAR2)
  RETURN NUMBER
AS
BEGIN
  IF p_user_name IN ('FPARDI','LGABORI','RENDEK') THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;

/
