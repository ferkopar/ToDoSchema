--------------------------------------------------------
--  DDL for Procedure CPY_DM_XL_LIST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CPY_DM_XL_LIST" (p_list_id     dm_super_typ.super_typ_id % TYPE,
                                                      p_param_fdate dm_xl.param_fdate % TYPE,
                                                      p_param_tdate dm_xl.param_tdate % TYPE)
  AS
    CURSOR dm_xl_row IS
        SELECT DM_XL.DM_XL_ID,
               DM_XL.LEAD_TYPE_ID,
               DM_XL.INC_TYPE_ID,
               DM_XL.PARAM_TYPE_ID,
               DM_XL.PARAM_DATE_TYPE_ID,
               DM_XL.PARAM_UNIT_ID,
               DM_XL.PARAM_UNIT,
               DM_XL.LIST_TYPE_ID,
               DM_XL.REL_TYPE_ID,
               DM_XL.SHEET_NAME,
               DM_XL.ORDER_NO,
               DM_XL.ORDER_SIGN,
               DM_XL.ORDER_REG,
               DM_XL.PRINT_TYPE,
               DM_XL.PARAM_FDATE,
               DM_XL.PARAM_TDATE,
               DM_XL.DESCRIPTION,
               DM_XL.DATA_OWNER_ID,
               DM_XL.PARAM_ADATE_TYPE_ID,
               DM_XL.PARAM_D1VALUE,
               DM_XL.PARAM_D2VALUE,
               DM_XL.MUTABLE
          FROM DM_XL
          WHERE LIST_TYPE_ID = p_list_id
            AND PARAM_FDATE = p_param_fdate
            AND PARAM_TDATE = p_param_tdate
        FOR UPDATE OF PARAM_TDATE;

    today_midnigth CONSTANT DATE := TRUNC(sysdate + 1) - 1 / 86400;
    tomorow_zero   CONSTANT DATE := TRUNC(sysdate + 1);

  BEGIN
    dbms_output.put_line('CPY_DM_XL_LIST:' || p_list_id || ' feldolgozása.');
    FOR row in dm_xl_row
     loop
UPDATE dm_xl
  SET PARAM_TDATE = date_util_pkg.today_midnigth
  WHERE row.DM_XL_ID = DM_XL_ID;
        dm_xl_tapi.ins(
                         p_INC_TYPE_ID             => row.INC_TYPE_ID,
                         p_ORDER_REG               => row.ORDER_REG,
                         p_PARAM_FDATE             => date_util_pkg.tomorow_zero ,
                         p_PARAM_UNIT              => row.PARAM_UNIT,
                         p_ORDER_SIGN              => row.ORDER_SIGN,
                         p_PARAM_TDATE             => date_util_pkg.close_day ,
                         p_PARAM_TYPE_ID           => row.PARAM_TYPE_ID,
                         p_PARAM_DATE_TYPE_ID      => row.PARAM_DATE_TYPE_ID,
                         p_LEAD_TYPE_ID            => row.LEAD_TYPE_ID,
                         p_DESCRIPTION             => row.DESCRIPTION,
                         p_PARAM_D2VALUE           => row.PARAM_D2VALUE,
                         p_PARAM_ADATE_TYPE_ID     => row.PARAM_ADATE_TYPE_ID,
                         p_DATA_OWNER_ID           => row.DATA_OWNER_ID,
                         p_ORDER_NO                => row.ORDER_NO,
                         p_PARAM_UNIT_ID           => row.PARAM_UNIT_ID,
                         p_REL_TYPE_ID             => row.REL_TYPE_ID,
                         p_MUTABLE                 => row.MUTABLE,
                         p_PRINT_TYPE              => row.PRINT_TYPE ,
                         p_SHEET_NAME              => row.SHEET_NAME ,
                         p_PARAM_D1VALUE           => row.PARAM_D1VALUE,
                         p_DM_XL_ID                => null,
                         p_LIST_TYPE_ID            => row.LIST_TYPE_ID); 
     end loop;
END;

/
