--------------------------------------------------------
--  DDL for View APEXLIB_V_PAGE_ITEM
--------------------------------------------------------

  CREATE OR REPLACE VIEW "APEXLIB_V_PAGE_ITEM" ("ID", "APPLICATION_ID", "PAGE_ID", "REGION_ID", "REGION_NAME", "NAME", "LABEL", "LABEL_TEMPLATE_NAME", "DISPLAY_SEQUENCE", "DISPLAY_AS", "FORMAT_MASK", "LOV_TYPE", "LOV_QUERY", "LOV_DISPLAY_NULL", "LOV_DISPLAY_EXTRA_VALUES", "LOV_NULL_TEXT", "LOV_NULL_VALUE", "IGNORE_LOV", "IGNORE_LOV_NULL", "IGNORE_VALIDATION", "NO_TRIM", "IS_REQUIRED", "MAX_LENGTH", "MIN_VALUE", "MAX_VALUE", "ALWAYS_REFRESH", "ONLY_UPPERCASE", "ONLY_LOWERCASE", "ONLY_CAPITALIZED", "IS_VERTICAL_RESIZEABLE", "READ_ONLY_CONDITION_TYPE", "READ_ONLY_EXPRESSION1", "READ_ONLY_EXPRESSION2", "CONDITION_TYPE", "CONDITION_EXPRESSION1", "CONDITION_EXPRESSION2", "NOT_AUTHORIZATION", "AUTHORIZATION_SCHEME") AS 
  SELECT ITEM_ID               AS ID
     , APPLICATION_ID
     , PAGE_ID
     , REGION_ID
     , TO_CHAR(NULL)         AS REGION_NAME
     , ITEM_NAME             AS NAME
     , LABEL
     , ITEM_LABEL_TEMPLATE   AS LABEL_TEMPLATE_NAME
     , DISPLAY_SEQUENCE
     , CASE DISPLAY_AS
           WHEN 'Display as Text (based on LOV, does not save state)'     THEN 'DISPLAY_ONLY_LOV'
           WHEN 'Display as Text (based on LOV, saves state)'             THEN 'DISPLAY_AND_SAVE_LOV'
           WHEN 'Display as Text (based on PLSQL, does not save state)'   THEN 'DISPLAY_ONLY_PLSQL'
           WHEN 'Display as Text (does not save state)'                   THEN 'DISPLAY_ONLY_HTML'
           WHEN 'Display as Text (escape special characters, does not save state)' THEN 'DISPLAY_ONLY_ESCAPE_SC'
           WHEN 'Display as Text (saves state)'                           THEN 'DISPLAY_AND_SAVE'
           WHEN 'File Browse...'                                          THEN 'FILE'
           WHEN 'Hidden'                                                  THEN 'HIDDEN'
           WHEN 'Hidden and Protected'                                    THEN 'HIDDEN_PROTECTED'
           WHEN 'List Manager (View Only)'                                THEN 'LIST_MGR_VIEW'
           WHEN 'List Manager (based on Popup LOV)'                       THEN 'LIST_MGR'
           WHEN 'List Manager (based on Popup LOV, no fetch)'             THEN 'LIST_MGR2'
           WHEN 'List Manager (based on Popup LOV, preserves case)'       THEN 'LIST_MGR3'
           WHEN 'Multiselect List'                                        THEN 'MULTIPLESELECT'
           WHEN 'Password'                                                THEN 'PASSWORD'
           WHEN 'Password (submits when Enter pressed)'                   THEN 'PASSWORD_WITH_ENTER_SUBMIT'
           WHEN 'Popup Key LOV (Displays description, returns key value)' THEN 'POPUP_KEY_LOV'
           WHEN 'Popup Key LOV No Fetch (Displays description, returns key value without pre-fetch)' THEN 'POPUP_KEY_LOV_NOFETCH'
           WHEN 'Popup LOV (fetches first rowset and filters)'            THEN 'POPUP_FILTER'
           WHEN 'Popup LOV (fetches first rowset)'                        THEN 'POPUP'
           WHEN 'Popup LOV (no fetch)'                                    THEN 'POPUP2'
           WHEN 'Radiogroup'                                              THEN 'RADIOGROUP'
           WHEN 'Radiogroup (with Submit)'                                THEN 'RADIOGROUP_WITH_SUBMIT'
           WHEN 'Radiogroup with Redirect'                                THEN 'RADIOGROUP_WITH_REDIRECT'
           WHEN 'Select List'                                             THEN 'COMBOBOX'
           WHEN 'Select List Returning URL redirect'                      THEN 'COMBOBOX_WITH_URL_REDIRECT'
           WHEN 'Select List with Branch to Page'                         THEN 'COMBOBOX_WITH_BRANCH_TO_PAGE'
           WHEN 'Select List with POPUP LOV'                              THEN 'SHOW_AS_SL_WITH_POPUP'
           WHEN 'Select List with Redirect'                               THEN 'COMBOBOX_WITH_JS_REDIRECT'
           WHEN 'Select List with Submit'                                 THEN 'COMBOBOX_WITH_SUBMIT'
           WHEN 'Stop and Start HTML Table (Displays label only)'         THEN 'STOP_AND_START_HTML_TABLE'
           WHEN 'Text Field'                                              THEN 'TEXT'
           WHEN 'Text Field (Disabled, does not save state)'              THEN 'TEXT_DISABLED'
           WHEN 'Text Field (Disabled, saves state)'                      THEN 'TEXT_DISABLED_AND_SAVE'
           WHEN 'Text Field (always submits page when Enter pressed)'     THEN 'TEXT_WITH_ENTER_SUBMIT'
           WHEN 'Text Field with Calculator Popup'                        THEN 'TEXT_WITH_CALCULATOR'
           WHEN 'Textarea'                                                THEN 'TEXTAREA'
           WHEN 'Textarea (auto-height)'                                  THEN 'TEXTAREA-AUTO-HEIGHT'
           WHEN 'Textarea with Character Counter'                         THEN 'TEXTAREA_CHAR_COUNT'
           WHEN 'Textarea with Character Counter Spellcheck'              THEN 'TEXTAREA_CHAR_COUNT_SPELL'
           WHEN 'Textarea with HTML Editor'                               THEN 'TEXTAREA_WITH_CONTROLS'
           WHEN 'Textarea with Spell Checker'                             THEN 'TEXTAREA_WITH_SPELL_CHECK'
           WHEN 'Checkbox'                                                THEN 'CHECKBOX'
           WHEN 'Popup Color Picker'                                      THEN 'POPUP_COLOR'
           WHEN 'Basic HTML Editor'                                       THEN 'TEXTAREA_WITH_HTML_EDITOR_BASIC'
           WHEN 'Standard HTML Editor'                                    THEN 'TEXTAREA_WITH_HTML_EDITOR_STANDARD'
           WHEN 'Shuttle'                                                 THEN 'SHUTTLE'
           ELSE CASE
                    WHEN DISPLAY_AS LIKE 'Date Picker%' THEN 'DATE_POPUP'
                    ELSE                                     DISPLAY_AS
                END
       END                      AS DISPLAY_AS
     , CASE
           WHEN DISPLAY_AS IN ( 'Date Picker (use application format mask)'
                              , 'Date Picker using application format mask'
                              , 'Date Picker using Application Date Format'
                              ) THEN (SELECT V('PICK_DATE_FORMAT_MASK') FROM DUAL)
           WHEN DISPLAY_AS IN ( 'Date Picker using item format mask'
                              , 'Date Picker (Classic)'
                              ) THEN FORMAT_MASK
           WHEN DISPLAY_AS LIKE 'Date Picker%' THEN
               REPLACE(SUBSTR(DISPLAY_AS, 14, LENGTH(DISPLAY_AS)-14), 'HH:MI', 'HH:MI AM')
           ELSE
               FORMAT_MASK
       END                   AS FORMAT_MASK
     , CASE
           WHEN LOV_DEFINITION IS NULL THEN NULL
           ELSE CASE SUBSTR(LOV_DEFINITION, 1, 1)
                    WHEN '.' THEN 'STATIC'
                    ELSE          'DYNAMIC'
                END
       END                   AS LOV_TYPE
     , LTRIM(LOV_DEFINITION) AS LOV_QUERY
     , CASE LOV_DISPLAY_NULL
           WHEN 'Yes' THEN 'YES'
           WHEN 'No'  THEN 'NO'
           ELSE            LOV_DISPLAY_NULL
       END                   AS LOV_DISPLAY_NULL
     , CASE LOV_DISPLAY_EXTRA
           WHEN 'Yes' THEN 'YES'
           WHEN 'No'  THEN 'NO'
           ELSE            LOV_DISPLAY_EXTRA
       END                   AS LOV_DISPLAY_EXTRA_VALUES
     , LOV_NULL_TEXT
     , LOV_NULL_VALUE
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_IGNORE_LOV$')        > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                   AS IGNORE_LOV
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_IGNORE_LOV_NULL$')   > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                   AS IGNORE_LOV_NULL
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_IGNORE_VALIDATION$') > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                   AS IGNORE_VALIDATION
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_NO_TRIM$') > 0           THEN 'YES'
           ELSE                                                                    'NO'
       END                   AS NO_TRIM
     , COALESCE
         ( CASE
               WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_REQUIRED$')      > 0 THEN 'YES'
               WHEN UPPER(ITEM_LABEL_TEMPLATE) LIKE 'REQUIRED%'               THEN 'YES'
               ELSE ( SELECT 'YES'
                        FROM DUAL
                       WHERE EXISTS ( SELECT 1
                                        FROM APEX_APPLICATION_PAGE_VAL VAL
                                       WHERE VAL.APPLICATION_ID                = ITEM.APPLICATION_ID
                                         AND VAL.PAGE_ID                       = ITEM.PAGE_ID
                                         AND VAL.VALIDATION_TYPE               = 'Item specified is NOT NULL'
                                         AND UPPER(VAL.VALIDATION_EXPRESSION1) = ITEM.ITEM_NAME
                                         AND VAL.CONDITION_TYPE                IS NULL
                                         AND VAL.WHEN_BUTTON_PRESSED           IS NULL
                                         AND VAL.AUTHORIZATION_SCHEME          IS NULL
                                    )
                    )
           END
         , 'NO'
         )                     AS IS_REQUIRED
     , ITEM_ELEMENT_MAX_LENGTH AS MAX_LENGTH
     , CASE
           WHEN MIN_VALUE_POS > 0 THEN SUBSTR
                                         ( APEXLIB_HINTS
                                         , MIN_VALUE_POS+19
                                         , INSTR(APEXLIB_HINTS, '$', MIN_VALUE_POS+19)-MIN_VALUE_POS-19
                                         )
           ELSE                        NULL
       END                   AS MIN_VALUE
     , CASE
           WHEN MAX_VALUE_POS > 0 THEN SUBSTR
                                         ( APEXLIB_HINTS
                                         , MAX_VALUE_POS+19
                                         , INSTR(APEXLIB_HINTS, '$', MAX_VALUE_POS+19)-MAX_VALUE_POS-19
                                         )
           ELSE                        NULL
       END                   AS MAX_VALUE
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_ALWAYS_REFRESH$')    > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                     AS ALWAYS_REFRESH
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_UPPERCASE$')         > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                     AS ONLY_UPPERCASE
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_LOWERCASE$')         > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                     AS ONLY_LOWERCASE
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_CAPITALIZE$')        > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                     AS ONLY_CAPITALIZED
     , CASE
           WHEN INSTR(APEXLIB_HINTS_UPPER, '$APEXLIB_V_RESIZE$')          > 0 THEN 'YES'
           ELSE                                                                    'NO'
       END                     AS IS_VERTICAL_RESIZEABLE
     , READ_ONLY_CONDITION_TYPE AS READ_ONLY_CONDITION_TYPE -- $$$ has to be mapped to constant values
     , READ_ONLY_CONDITION_EXP1 AS READ_ONLY_EXPRESSION1
     , READ_ONLY_CONDITION_EXP2 AS READ_ONLY_EXPRESSION2
     , CONDITION_TYPE                                       -- $$$ has to be mapped to constant values
     , CONDITION_EXPRESSION1
     , CONDITION_EXPRESSION2
     , CASE SUBSTR(AUTHORIZATION_SCHEME, 1, 4)
           WHEN 'Not ' THEN 'YES'
           ELSE             'NO'
       END                     AS NOT_AUTHORIZATION
     , LTRIM
         ( AUTHORIZATION_SCHEME
         , 'Not '
         )                     AS AUTHORIZATION_SCHEME
  FROM ( SELECT ITEM.*
              , INSTR
                  ( UPPER(ITEM.COMPONENT_COMMENT)
                  , '$APEXLIB_MIN_VALUE='
                  )                          AS MIN_VALUE_POS
              , INSTR
                  ( UPPER(ITEM.COMPONENT_COMMENT)
                  , '$APEXLIB_MAX_VALUE='
                  )                          AS MAX_VALUE_POS
              , UPPER(ITEM.COMPONENT_COMMENT) AS APEXLIB_HINTS_UPPER
              , ITEM.COMPONENT_COMMENT        AS APEXLIB_HINTS
           FROM APEX_APPLICATION_PAGE_ITEMS ITEM
       ) ITEM;
