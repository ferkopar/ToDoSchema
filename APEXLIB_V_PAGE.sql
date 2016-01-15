--------------------------------------------------------
--  DDL for View APEXLIB_V_PAGE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "APEXLIB_V_PAGE" ("ID", "APPLICATION_ID", "NAME", "GROUP_ID", "TAB_SET", "NOT_AUTHORIZATION", "AUTHORIZATION_SCHEME") AS 
  SELECT PAGE_ID         AS ID
     , APPLICATION_ID
     , PAGE_NAME       AS NAME
     , PAGE_GROUP_ID   AS GROUP_ID
     , TAB_SET
     , CASE SUBSTR(AUTHORIZATION_SCHEME, 1, 4)
         WHEN 'Not ' THEN 'YES'
         ELSE             'NO'
       END             AS NOT_AUTHORIZATION
     , LTRIM
         ( AUTHORIZATION_SCHEME
         , 'Not '
         )             AS AUTHORIZATION_SCHEME
  FROM APEX_APPLICATION_PAGES;
