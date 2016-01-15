--------------------------------------------------------
--  DDL for Function HAS_CALC_COLUM_RULE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HAS_CALC_COLUM_RULE" (p_result_id number)
  RETURN NUMBER
AS
 
BEGIN
  return HAS_CALC_RULE(p_result_id,46);
END;

/
