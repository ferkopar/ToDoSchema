--------------------------------------------------------
--  DDL for View V_MENU_1012
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_MENU_1012" ("MENU_ITEM_ID", "MENU_ITEM_NAME", "ASSIGNED_ROLE_ID", "ASSIGNED_ROLE_NAME") AS 
  select 
   TYPE_VALUE1 MENU_ITEM_ID,
   (select SUPER_TYPE_NAME from DM_SUPER_TYP where SUPER_TYP_ID = TYPE_VALUE1) MENU_ITEM_NAME,
    ROLE_ID ASSIGNED_ROLE_ID,
   (select ROLE_NAME from DM_ROLE where DM_ROLE.ROLE_ID = DM_REGULATION.ROLE_ID) ASSIGNED_ROLE_NAME
from DM_REGULATION where REGUL_TYPE_ID = 1012;
