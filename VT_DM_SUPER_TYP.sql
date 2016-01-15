--------------------------------------------------------
--  DDL for View VT_DM_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VT_DM_SUPER_TYP" ("SUPER_TYP_ID", "GROUP_ID", "SUPER_TYPE_NAME", "T_GROUP_NAME", "SLEVEL", "SOPTIONAL", "DESCRIPTION", "FROM_DATE", "TO_DATE", "SUPER_GROUP_NAME") AS 
  select 
    t.SUPER_TYP_ID,
    T.GROUP_ID,
    SUPER_TYPE_NAME,
    ' ('
    ||t.SUPER_GROUP_NAME
    ||')'||'('||t.GROUP_ID||')' T_GROUP_NAME,
    t.SLEVEL,
    t.SOPTIONAL,
    t.DESCRIPTION,
    t.FROM_DATE,
    t.TO_DATE,
    T.SUPER_GROUP_NAME
  FROM DM_SUPER_TYP t;
