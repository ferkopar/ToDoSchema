--------------------------------------------------------
--  DDL for Function HAS_CALC_RULE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HAS_CALC_RULE" (p_result_id number, p_rel_type_id number)
  RETURN NUMBER 
AS
  l_ret_val number;
BEGIN
  select count(1) into l_ret_val from DM_XL_REL
    where DM_XL_ID3 = p_result_id and REL_TYPE_ID = p_rel_type_id;
  return l_ret_val;
END;

/
