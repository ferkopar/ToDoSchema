--------------------------------------------------------
--  DDL for Function HAS_CALC_COLUMN_RULE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HAS_CALC_COLUMN_RULE" (p_result_id number)
  RETURN NUMBER 
AS
 
BEGIN
  return HAS_CALC_RULE(p_result_id,46);
END;

/
