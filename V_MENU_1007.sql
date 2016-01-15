--------------------------------------------------------
--  DDL for View V_MENU_1007
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_MENU_1007" ("MENU_ITEM_ID", "MENU_ITEM_NAME", "CONTROL_ITEM_ID", "CONTROL_ITEM_NAME") AS 
  select 
    TYPE_VALUE1 MENU_ITEM_ID,
   (select SUPER_TYPE_NAME from DM_SUPER_TYP where SUPER_TYP_ID = TYPE_VALUE1) MENU_ITEM_NAME,
   TYPE_VALUE2 CONTROL_ITEM_ID,
   (select SUPER_TYPE_NAME from DM_SUPER_TYP where SUPER_TYP_ID = TYPE_VALUE2) CONTROL_ITEM_NAME
from DM_REGULATION where REGUL_TYPE_ID = 1007;
