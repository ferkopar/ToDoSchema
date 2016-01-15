--------------------------------------------------------
--  DDL for View APEXLIB_V_PAGE_VALIDATION
--------------------------------------------------------

  CREATE OR REPLACE VIEW "APEXLIB_V_PAGE_VALIDATION" ("ID", "APPLICATION_ID", "PAGE_ID", "NAME", "VALIDATION_FAILURE_TEXT", "ASSOCIATED_ITEM_ID", "ASSOCIATED_ITEM_NAME") AS 
  SELECT VAL.VALIDATION_ID           AS ID
     , VAL.APPLICATION_ID
     , VAL.PAGE_ID
     , VAL.VALIDATION_NAME         AS NAME
     , VAL.VALIDATION_FAILURE_TEXT
     , VAL.ASSOCIATED_ITEM         AS ASSOCIATED_ITEM_ID
     , ( SELECT ITEM_NAME
           FROM APEX_APPLICATION_PAGE_ITEMS ITEM
          WHERE ITEM_ID = VAL.ASSOCIATED_ITEM
       )                           AS ASSOCIATED_ITEM_NAME
  FROM APEX_APPLICATION_PAGE_VAL   VAL;
