--------------------------------------------------------
--  DDL for Function SEARCH_GROUND_LEVEL_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SEARCH_GROUND_LEVEL_ID" (p_super_type_id NUMBER)
  RETURN NUMBER
AS
  v_super_typ_row dm_super_typ%rowtype;
BEGIN
  select * INTO v_super_typ_row FROM DM_SUPER_TYP WHERE SUPER_TYP_ID = p_super_type_id;
  if v_super_typ_row.GROUP_ID is null then
     return v_super_typ_row.super_typ_id;
  else
     return SEARCH_GROUND_LEVEL_ID (v_super_typ_row.group_id);
  end if;
END;

/
