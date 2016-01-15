--------------------------------------------------------
--  DDL for View VT_DM_TRANSLATE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VT_DM_TRANSLATE" ("DM_TEXT_ID", "TEXT_ID", "LANGUAGE_ID", "TRANSL_TYPE", "NAMES", "HELP_TEXT", "TEXT_DESCRIPTION", "PRINT_TEXT", "TEXT_FROM_DAT", "TEXT_TO_DATE", "HUN_NAMES", "REFERENCE_CODE", "TRANSLATE_ID", "DISPLAY_TYPE_ID", "TBL_NAME", "TBL_COL_NAME", "TBL_PK_ID", "TBL_ROWS", "APEX_VARIABLE", "APEX_VARIABLE_PAGE", "PARAM_TYPE1", "PARAM_VALUE1", "PARAM_TYPE2", "PARAM_VALUE2", "TRANSLATE_DESCRIPTION", "TRANSLATE_FROM_DATE", "TRANSLATE_TO_DATE") AS 
  SELECT t.DM_TEXT_ID ,
    t.TEXT_ID ,
    t.LANGUAGE_ID ,
    t.TRANSL_TYPE ,
    t.CNAMES NAMES,
    t.HELP_TEXT ,
    t.DESCRIPTION text_description ,
    t.PRINT_TEXT ,
    t.FROM_DATE text_FROM_DAT ,
    t.TO_DATE text_TO_DATE ,
    t.HUN_NAMES ,
    t.REFERENCE_CODE ,
    tr.TRANSLATE_ID ,
    tr.DISPLAY_TYPE_ID ,
    tr.TBL_NAME ,
    tr.TBL_COL_NAME ,
    tr.TBL_PK_ID ,
    tr.TBL_ROWS ,
    tr.APEX_VARIABLE ,
    tr.APEX_PAGE ,
    tr.PARAM_TYPE1 ,
    tr.PARAM_VALUE1 ,
    tr.PARAM_TYPE2 ,
    tr.PARAM_VALUE2 ,
    tr.DESCRIPTION translate_description ,
    tr.FROM_DATE translate_FROM_DATE ,
    tr.TO_DATE translate_TO_DATE
  FROM DM_TEXT t,
    DM_TRANSLATE tr
  WHERE t.TEXT_ID=tr.TEXT_ID;
