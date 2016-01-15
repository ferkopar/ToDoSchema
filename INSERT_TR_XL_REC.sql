--------------------------------------------------------
--  DDL for Procedure INSERT_TR_XL_REC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "INSERT_TR_XL_REC" (p_CRU                     IN TR_XL.CRU % TYPE                     DEFAULT NULL,
                                                        p_SUBJ_ID                 IN TR_XL.SUBJ_ID % TYPE                 DEFAULT NULL,
                                                        p_TR_XL_ID                IN TR_XL.TR_XL_ID % TYPE                DEFAULT NULL,
                                                        p_STATUS_ID               IN TR_XL.STATUS_ID % TYPE               DEFAULT NULL,
                                                        p_MDU                     IN TR_XL.MDU % TYPE                     DEFAULT NULL,
                                                        p_PARAM_VALUE_CHR         IN TR_XL.PARAM_VALUE_CHR % TYPE         DEFAULT NULL,
                                                        p_PARAM_FDATE             IN TR_XL.PARAM_FDATE % TYPE             DEFAULT NULL,
                                                        p_PARAM_DATE              IN TR_XL.PARAM_DATE % TYPE              DEFAULT NULL,
                                                        p_PARAM_UNIT              IN TR_XL.PARAM_UNIT % TYPE              DEFAULT NULL,
                                                        p_PARAM_TDATE             IN TR_XL.PARAM_TDATE % TYPE             DEFAULT NULL,
                                                        p_MDD                     IN TR_XL.MDD % TYPE                     DEFAULT NULL,
                                                        p_ROW_DM_XL_ID            IN TR_XL.ROW_DM_XL_ID % TYPE            DEFAULT NULL,
                                                        p_PARAM_TYPE_ID           IN TR_XL.PARAM_TYPE_ID % TYPE           DEFAULT NULL,
                                                        p_COL_DM_XL_ID            IN TR_XL.COL_DM_XL_ID % TYPE            DEFAULT NULL,
                                                        p_PARAM_DATE_TYPE_ID      IN TR_XL.PARAM_DATE_TYPE_ID % TYPE      DEFAULT NULL,
                                                        p_DATA_INCO_ID            IN TR_XL.DATA_INCO_ID % TYPE            DEFAULT NULL,
                                                        p_DESCRIPTION             IN TR_XL.DESCRIPTION % TYPE             DEFAULT NULL,
                                                        p_ORDER_NO                IN TR_XL.ORDER_NO % TYPE                DEFAULT NULL,
                                                        p_PARAM_ADATE_TYPE_ID     IN TR_XL.PARAM_ADATE_TYPE_ID % TYPE     DEFAULT NULL,
                                                        p_W_PARAM_DATE_TYPE_NAME  IN TR_XL.W_PARAM_DATE_TYPE_NAME % TYPE  DEFAULT NULL,
                                                        p_CONTROL_COL_VALUE       IN TR_XL.CONTROL_COL_VALUE % TYPE       DEFAULT NULL,
                                                        p_CRD                     IN TR_XL.CRD % TYPE                     DEFAULT NULL,
                                                        p_CONTROL_VALUE           IN TR_XL.CONTROL_VALUE % TYPE           DEFAULT NULL,
                                                        p_PARAM_VALUE             IN TR_XL.PARAM_VALUE % TYPE             DEFAULT NULL,
                                                        p_COLUMN_DATA_TYPE_ID     IN TR_XL.COLUMN_DATA_TYPE_ID % TYPE     DEFAULT NULL,
                                                        p_W_PARAM_ADATE_TYPE_NAME IN TR_XL.W_PARAM_ADATE_TYPE_NAME % TYPE DEFAULT NULL,
                                                        p_COLUMN_NO               IN TR_XL.COLUMN_NO % TYPE               DEFAULT NULL,
                                                        p_LIST_TYPE_ID            IN TR_XL.LIST_TYPE_ID % TYPE            DEFAULT NULL)
  IS
  BEGIN
    INSERT INTO TR_XL (
      CRU, SUBJ_ID, TR_XL_ID, STATUS_ID, MDU, PARAM_VALUE_CHR, PARAM_FDATE, PARAM_DATE, PARAM_UNIT, PARAM_TDATE, MDD, ROW_DM_XL_ID, PARAM_TYPE_ID, COL_DM_XL_ID, PARAM_DATE_TYPE_ID, DATA_INCO_ID, DESCRIPTION, ORDER_NO, PARAM_ADATE_TYPE_ID, W_PARAM_DATE_TYPE_NAME, CONTROL_COL_VALUE, CRD, CONTROL_VALUE, PARAM_VALUE, COLUMN_DATA_TYPE_ID, W_PARAM_ADATE_TYPE_NAME, COLUMN_NO, LIST_TYPE_ID
    )
    VALUES (p_CRU, p_SUBJ_ID, p_TR_XL_ID, p_STATUS_ID, p_MDU, p_PARAM_VALUE_CHR, p_PARAM_FDATE, p_PARAM_DATE, p_PARAM_UNIT, p_PARAM_TDATE, p_MDD, p_ROW_DM_XL_ID, p_PARAM_TYPE_ID, p_COL_DM_XL_ID, p_PARAM_DATE_TYPE_ID, p_DATA_INCO_ID, p_DESCRIPTION, p_ORDER_NO, p_PARAM_ADATE_TYPE_ID, p_W_PARAM_DATE_TYPE_NAME, p_CONTROL_COL_VALUE, p_CRD, p_CONTROL_VALUE, p_PARAM_VALUE, p_COLUMN_DATA_TYPE_ID, p_W_PARAM_ADATE_TYPE_NAME, p_COLUMN_NO, p_LIST_TYPE_ID);
  END;

/
