--------------------------------------------------------
--  DDL for Procedure CPY_DM_XL_DOC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CPY_DM_XL_DOC" (p_doc_id      dm_super_typ.super_typ_id % TYPE,
                                                     p_param_fdate dm_xl.param_fdate % TYPE,
                                                     p_param_tdate dm_xl.param_tdate % TYPE)
  AS
    CURSOR listak IS
        SELECT SUPER_TYP_id,
               SUPER_TYPE_NAME
          FROM dm_super_typ
          WHERE GROUP_ID = p_doc_id
            AND EXISTS (SELECT 1
                FROM dm_xl
                WHERE LIST_TYPE_ID = dm_super_typ.SUPER_TYP_ID
                  AND PARAM_FDATE = p_param_fdate
                  AND PARAM_TDATE = p_param_tdate);
  BEGIN
    FOR l IN listak
    LOOP
      dbms_output.put_line('CPY_DM_XL_DOC:' || l.SUPER_TYP_id || ' ' || l.SUPER_TYPE_NAME || ' feldolgozása.');
      CPY_DM_XL_LIST(p_list_id => l.SUPER_TYP_id
      , p_param_fdate => p_param_fdate
      , p_param_tdate => p_param_tdate);
    END LOOP;
  END;

/
