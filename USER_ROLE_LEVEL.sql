--------------------------------------------------------
--  DDL for Function USER_ROLE_LEVEL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USER_ROLE_LEVEL" (user varchar2)
  RETURN number
AS
BEGIN
  IF USER IN ('FPARDI', 'RENDEK', 'LGABORI')
  THEN
    RETURN 0;
  ELSIF USER IN ('ZWENINGER')
  THEN
    RETURN 1;
  ELSE
    RETURN 2;
  END IF;
END;

/
