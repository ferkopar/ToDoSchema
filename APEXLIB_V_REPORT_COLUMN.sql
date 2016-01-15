--------------------------------------------------------
--  DDL for View APEXLIB_V_REPORT_COLUMN
--------------------------------------------------------

  CREATE OR REPLACE VIEW "APEXLIB_V_REPORT_COLUMN" ("ID", "APPLICATION_ID", "REGION_ID", "NAME", "HEADING", "DISPLAY_SEQUENCE", "DISPLAY_AS", "FORMAT_MASK", "IS_HIDDEN", "IS_REQUIRED", "MAX_LENGTH", "MIN_VALUE", "MAX_VALUE", "ONLY_UPPERCASE", "ONLY_LOWERCASE", "ONLY_CAPITALIZED", "IS_VERTICAL_RESIZEABLE", "LINK_URL", "LOV_NAMED_LOV_ID", "LOV_TYPE", "LOV_QUERY", "LOV_DISPLAY_NULL", "LOV_DISPLAY_EXTRA_VALUES", "LOV_NULL_TEXT", "LOV_NULL_VALUE", "CONDITION_TYPE", "CONDITION_EXPRESSION1", "CONDITION_EXPRESSION2", "NOT_AUTHORIZATION", "AUTHORIZATION_SCHEME") AS 
  SELECT ID
     , APPLICATION_ID
     , REGION_ID
     , NAME
     , HEADING
     , DISPLAY_SEQUENCE
     , DISPLAY_AS
     , CASE DISPLAY_AS
           WHEN 'DATE_POPUP' THEN
               CASE
                   WHEN FORMAT_MASK = 'USING_APP_FORMAT_MASK' THEN (SELECT V('PICK_DATE_FORMAT_MASK') FROM DUAL)
                   WHEN INSTR(FORMAT_MASK, '_DOT'  ) > 0 THEN REPLACE(REPLACE(FORMAT_MASK, '_DOT',   ''), '_', '.')
                   WHEN INSTR(FORMAT_MASK, '_SLASH') > 0 THEN REPLACE(REPLACE(FORMAT_MASK, '_SLASH', ''), '_', '/')
                   ELSE                                       REPLACE(REPLACE(FORMAT_MASK, '_DASH',  ''), '_', '-')
               END
           ELSE FORMAT_MASK
       END             AS FORMAT_MASK
     , IS_HIDDEN
     , IS_REQUIRED
     , CASE
           WHEN MAX_LENGTH_POS > 0 THEN TO_NUMBER
                                          ( SUBSTR
                                              ( APEXLIB_HINTS
                                              , MAX_LENGTH_POS+20
                                              , INSTR(APEXLIB_HINTS, '$', MAX_LENGTH_POS+20)-MAX_LENGTH_POS-20
                                              )
                                          )
           ELSE                         TO_NUMBER(NULL)
       END             AS MAX_LENGTH
     , CASE
           WHEN MIN_VALUE_POS > 0 THEN SUBSTR
                                         ( APEXLIB_HINTS
                                         , MIN_VALUE_POS+19
                                         , INSTR(APEXLIB_HINTS, '$', MIN_VALUE_POS+19)-MIN_VALUE_POS-19
                                         )
           ELSE                        NULL
       END             AS MIN_VALUE
     , CASE
           WHEN MAX_VALUE_POS > 0 THEN SUBSTR
                                         ( APEXLIB_HINTS
                                         , MAX_VALUE_POS+19
                                         , INSTR(APEXLIB_HINTS, '$', MAX_VALUE_POS+19)-MAX_VALUE_POS-19
                                         )
           ELSE                        NULL
       END             AS MAX_VALUE
     , ONLY_UPPERCASE
     , ONLY_LOWERCASE
     , ONLY_CAPITALIZED
     , IS_VERTICAL_RESIZEABLE
     , LINK_URL
     , LOV_NAMED_LOV_ID
     , LOV_TYPE
     , LOV_QUERY
     , LOV_DISPLAY_NULL
     , LOV_DISPLAY_EXTRA_VALUES
     , LOV_NULL_TEXT
     , LOV_NULL_VALUE
     , CONDITION_TYPE
     , CONDITION_EXPRESSION1
     , CONDITION_EXPRESSION2
     , NOT_AUTHORIZATION
     , AUTHORIZATION_SCHEME
  FROM ( SELECT COL.REGION_REPORT_COLUMN_ID  AS ID
              , COL.APPLICATION_ID
              , COL.REGION_ID
              , UPPER(COL.COLUMN_ALIAS)      AS NAME
              , COL.HEADING
              , COL.DISPLAY_SEQUENCE
              , CASE COL.DISPLAY_AS
                    WHEN 'Standard Report Column'                                           THEN 'WITHOUT_MODIFICATION'
                    WHEN 'Display as Text (based on LOV, does not save state)'              THEN 'TEXT_FROM_LOV'
                    WHEN 'Display as Text (saves state)'                                    THEN 'DISPLAY_AND_SAVE'
                    WHEN 'Display as Text (escape special characters, does not save state)' THEN 'ESCAPE_SC'
                    WHEN 'Date Picker'                                                      THEN 'DATE_POPUP'
                    WHEN 'Text Field'                                                       THEN 'TEXT'
                    WHEN 'Text Area'                                                        THEN 'TEXTAREA'
                    WHEN 'Select List (static LOV)'                                         THEN 'SELECT_LIST'
                    WHEN 'Select List (named LOV)'                                          THEN 'SELECT_LIST_FROM_LOV'
                    WHEN 'Select List (query based LOV)'                                    THEN 'SELECT_LIST_FROM_QUERY'
                    WHEN 'Hidden '                                                          THEN 'HIDDEN'
                    WHEN 'Hidden'                                                           THEN 'HIDDEN' -- in the case Oracle is fixing the space bug
                    WHEN 'Popup LOV (named LOV)'                                            THEN 'POPUP'
                    WHEN 'Popup LOV (query based LOV)'                                      THEN 'POPUP_QUERY'
                    ELSE
                        CASE
                            WHEN COL.DISPLAY_AS LIKE 'PICK_DATE_%' THEN 'DATE_POPUP'
                            ELSE                                        COL.DISPLAY_AS
                        END
                END                          AS DISPLAY_AS
              , CASE
                    WHEN COL.DISPLAY_AS = 'PICK_DATE_USING_FORMAT_MASK' THEN COL.FORMAT_MASK
                    WHEN COL.DISPLAY_AS LIKE 'PICK_DATE_%' THEN
                        REPLACE
                          ( REPLACE
                              ( REPLACE
                                  ( COL.DISPLAY_AS
                                  , '_HH24_MI'
                                  , ' HH24:MI'
                                  )
                              , '_HH_MI'
                              , ' HH:MI AM'
                              )
                          , 'PICK_DATE_'
                          , ''
                          )
                    ELSE COL.FORMAT_MASK
                END                   AS FORMAT_MASK
              , CASE COL.COLUMN_IS_HIDDEN
                    WHEN 'Yes' THEN 'YES'
                    ELSE            'NO'
                end                          AS IS_HIDDEN
              , CASE
                    WHEN INSTR(UPPER(COL.COLUMN_LINK_ATTRIBUTES), '$APEXLIB_REQUIRED$')   > 0 THEN 'YES'
                    ELSE                                                                           'NO'
                END                          AS IS_REQUIRED
              , INSTR
                  ( UPPER(COL.COLUMN_LINK_ATTRIBUTES)
                  , '$APEXLIB_MAX_LENGTH='
                  )                          AS MAX_LENGTH_POS
              , INSTR
                  ( UPPER(COL.COLUMN_LINK_ATTRIBUTES)
                  , '$APEXLIB_MIN_VALUE='
                  )                          AS MIN_VALUE_POS
              , INSTR
                  ( UPPER(COL.COLUMN_LINK_ATTRIBUTES)
                  , '$APEXLIB_MAX_VALUE='
                  )                          AS MAX_VALUE_POS
              , CASE
                    WHEN INSTR(UPPER(COL.COLUMN_LINK_ATTRIBUTES), '$APEXLIB_UPPERCASE$')  > 0 THEN 'YES'
                    ELSE                                                                           'NO'
                END                          AS ONLY_UPPERCASE
              , CASE
                    WHEN INSTR(UPPER(COL.COLUMN_LINK_ATTRIBUTES), '$APEXLIB_LOWERCASE$')  > 0 THEN 'YES'
                    ELSE                                                                           'NO'
                END                          AS ONLY_LOWERCASE
              , CASE
                    WHEN INSTR(UPPER(COL.COLUMN_LINK_ATTRIBUTES), '$APEXLIB_CAPITALIZE$') > 0 THEN 'YES'
                    ELSE                                                                           'NO'
                END                          AS ONLY_CAPITALIZED
              , CASE
                    WHEN INSTR(UPPER(COL.COLUMN_LINK_ATTRIBUTES), '$APEXLIB_V_RESIZE$')   > 0 THEN 'YES'
                    ELSE                                                                           'NO'
                END                          AS IS_VERTICAL_RESIZEABLE
              , COL.COLUMN_LINK_URL          AS LINK_URL
              , LOV.LOV_ID                   AS LOV_NAMED_LOV_ID
              , CASE COALESCE(LOV.LOV_TYPE, DECODE(COL.INLINE_LIST_OF_VALUES, NULL, NULL, 'Dynamic'))
                    WHEN 'Static'  THEN 'STATIC'
                    WHEN 'Dynamic' THEN 'DYNAMIC'
                    ELSE                LOV.LOV_TYPE
                END                          AS LOV_TYPE
              , COALESCE
                  ( LOV.LIST_OF_VALUES_QUERY
                  , COL.INLINE_LIST_OF_VALUES
                  )                          AS LOV_QUERY
              , CASE COL.LOV_SHOW_NULLS
                    WHEN 'Yes' THEN 'YES'
                    WHEN 'No'  THEN 'NO'
                    ELSE            COL.LOV_SHOW_NULLS
                END                          AS LOV_DISPLAY_NULL
              , CASE COL.LOV_DISPLAY_EXTRA_VALUES
                    WHEN 'Yes' THEN 'YES'
                    WHEN 'No'  THEN 'NO'
                    ELSE            COL.LOV_DISPLAY_EXTRA_VALUES
                END                          AS LOV_DISPLAY_EXTRA_VALUES
              , COL.LOV_NULL_TEXT
              , COL.LOV_NULL_VALUE
              , COL.CONDITION_TYPE -- $$$ has to be mapped to constant values
              , COL.CONDITION_EXPRESSION1
              , COL.CONDITION_EXPRESSION2
              , CASE SUBSTR(COL.AUTHORIZATION_SCHEME, 1, 4)
                    WHEN 'Not ' THEN 'YES'
                    ELSE             'NO'
                END                          AS NOT_AUTHORIZATION
             , LTRIM
                 ( COL.AUTHORIZATION_SCHEME
                 , 'Not '
                 )                           AS AUTHORIZATION_SCHEME
             , UPPER(COL.COLUMN_LINK_ATTRIBUTES) AS APEXLIB_HINTS
           FROM APEX_APPLICATION_PAGE_RPT_COLS COL
              , APEX_APPLICATION_LOVS          LOV
          WHERE LOV .APPLICATION_ID     (+) = COL.APPLICATION_ID
            AND LOV .LIST_OF_VALUES_NAME(+) = COL.NAMED_LIST_OF_VALUES
       );
