--------------------------------------------------------
--  DDL for Function CAN_EDIT_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CAN_EDIT_SUPER_TYP" (user varchar2)
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
