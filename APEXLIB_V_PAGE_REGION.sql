--------------------------------------------------------
--  DDL for View APEXLIB_V_PAGE_REGION
--------------------------------------------------------

  CREATE OR REPLACE VIEW "APEXLIB_V_PAGE_REGION" ("ID", "APPLICATION_ID", "PAGE_ID", "NAME", "SOURCE_TYPE", "SOURCE", "SOURCE_UPPER", "DISPLAY_SEQUENCE", "HEADING_TYPE", "HEADING_SOURCE", "USES_APEX_ITEM", "IGNORE_VALIDATION", "HIDE_SELECT_ALL", "CONDITION_TYPE", "CONDITION_EXPRESSION1", "CONDITION_EXPRESSION2", "NOT_AUTHORIZATION", "AUTHORIZATION_SCHEME") AS 
  SELECT ID
     , APPLICATION_ID
     , PAGE_ID
     , NAME
     , CASE SOURCE_TYPE
           WHEN 'LIST' THEN
               CASE -- try to correct above APEX bug
                   WHEN INSTR(SOURCE_UPPER, 'RETURN ') > 0 THEN 'FUNCTION_RETURNING_SQL_QUERY'
                   ELSE                                          SOURCE_TYPE
               END
           ELSE
               SOURCE_TYPE
       END               AS SOURCE_TYPE
     , SOURCE
     , SOURCE_UPPER
     , DISPLAY_SEQUENCE
     , HEADING_TYPE
     , HEADING_SOURCE
     , CASE
           WHEN INSTR(SOURCE_UPPER, 'APEX_ITEM.') > 0 THEN 'YES'
           ELSE                                            'NO'
       END               AS USES_APEX_ITEM
     , CASE
           WHEN INSTR(APEXLIB_HINTS, '$APEXLIB_IGNORE_VALIDATION$') > 0 THEN 'YES'
           ELSE                                                              'NO'
       END               AS IGNORE_VALIDATION
     , CASE
           WHEN INSTR(APEXLIB_HINTS, '$APEXLIB_HIDE_SELECT_ALL$')   > 0 THEN 'YES'
           ELSE                                                              'NO'
       END               AS HIDE_SELECT_ALL
     , CONDITION_TYPE
     , CONDITION_EXPRESSION1
     , CONDITION_EXPRESSION2
     , NOT_AUTHORIZATION
     , AUTHORIZATION_SCHEME
  FROM ( SELECT REG.REGION_ID         AS ID
              , REG.APPLICATION_ID
              , REG.PAGE_ID
              , REG.REGION_NAME       AS NAME
              , CASE REG.SOURCE_TYPE
                    WHEN 'PL/SQL'                                THEN 'PLSQL_PROCEDURE'
                    WHEN 'HTML Chart'                            THEN 'SIMPLE_CHART'
                    WHEN 'Report'                                THEN 'SQL_QUERY'
                    WHEN 'HTML/Text'                             THEN 'STATIC_TEXT'
                    WHEN 'HTML/Text (escape special characters)' THEN 'STATIC_TEXT_ESCAPE_SC'
                    WHEN 'HTML/Text (with shortcuts)'            THEN 'STATIC_TEXT_WITH_SHORTCUTS'
                    WHEN 'Report'                                THEN 'STRUCTURED_QUERY'
                    WHEN 'SVG Chart'                             THEN 'SVG_CHART'
                    WHEN 'Tree'                                  THEN 'TREE'
                    WHEN 'Tabular Form'                          THEN 'UPDATABLE_SQL_QUERY'
                    WHEN 'URL'                                   THEN 'URL'
                    WHEN 'Interactive Report'                    THEN 'DYNAMIC_QUERY'
                    WHEN 'FUNCTION_RETURNING_SQL_QUERY'          THEN 'FUNCTION_RETURNING_SQL_QUERY' -- $$$ APEX bug, not yet supported
                    WHEN 'Breadcrumb'                            THEN 'BREADCRUMB'
                    ELSE CASE -- try to correct above APEX bug
                             WHEN INSTR(UPPER(REG.REGION_SOURCE), 'RETURN ') > 0 THEN 'FUNCTION_RETURNING_SQL_QUERY'
                             ELSE                                                     'LIST'
                         END
                END                          AS SOURCE_TYPE
              , REG.REGION_SOURCE            AS SOURCE
              , REPLACE(UPPER(REG.REGION_SOURCE), 'HTMLDB_ITEM.', 'APEX_ITEM.') AS SOURCE_UPPER
              , REG.DISPLAY_SEQUENCE
              , NVL
                  ( REG.HEADINGS_TYPE
                  , 'COLON_DELMITED_LIST'
                  )                          AS HEADING_TYPE
              , REG.REPORT_COLUMN_HEADINGS   AS HEADING_SOURCE
              , UPPER(REG.COMPONENT_COMMENT) AS APEXLIB_HINTS
              , CASE REG.CONDITION_TYPE
                    WHEN 'Value of Item in Expression 1 Is NULL'     THEN 'ITEM_IS_NULL'
                    WHEN 'Value of Item in Expression 1 Is NOT NULL' THEN 'ITEM_IS_NOT_NULL'
                    ELSE                                                  REG.CONDITION_TYPE
                END                          AS CONDITION_TYPE
              , REG.CONDITION_EXPRESSION1
              , REG.CONDITION_EXPRESSION2
              , CASE SUBSTR(REG.AUTHORIZATION_SCHEME, 1, 4)
                    WHEN 'Not ' THEN 'YES'
                    ELSE             'NO'
                END                          AS NOT_AUTHORIZATION
              , LTRIM
                  ( REG.AUTHORIZATION_SCHEME
                  , 'Not '
                  )                          AS AUTHORIZATION_SCHEME
           FROM APEX_APPLICATION_PAGE_REGIONS  REG
       );
