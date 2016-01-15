--------------------------------------------------------
--  DDL for Package Body TREATM_PARAM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_PARAM_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU              IN TREATM_PARAM.CRU%type DEFAULT NULL ,
      p_TREATM_PARAM_ID  IN TREATM_PARAM.TREATM_PARAM_ID%type ,
      p_UNIT             IN TREATM_PARAM.UNIT%type DEFAULT NULL ,
      p_TO_DATE          IN TREATM_PARAM.TO_DATE%type ,
      p_SUBJ_ID          IN TREATM_PARAM.SUBJ_ID%type DEFAULT NULL ,
      p_UNIT_TYPE_ID     IN TREATM_PARAM.UNIT_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION      IN TREATM_PARAM.DESCRIPTION%type DEFAULT NULL ,
      p_SUBJ_TYPE_ID     IN TREATM_PARAM.SUBJ_TYPE_ID%type DEFAULT NULL ,
      p_MDU              IN TREATM_PARAM.MDU%type DEFAULT NULL ,
      p_ORDER_NO         IN TREATM_PARAM.ORDER_NO%type DEFAULT NULL ,
      p_MM_ID            IN TREATM_PARAM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE        IN TREATM_PARAM.FROM_DATE%type ,
      p_TREATM_PARAM1_ID IN TREATM_PARAM.TREATM_PARAM1_ID%type DEFAULT NULL ,
      p_FIELD_TYPE_ID    IN TREATM_PARAM.FIELD_TYPE_ID%type DEFAULT NULL ,
      p_CRD              IN TREATM_PARAM.CRD%type DEFAULT NULL ,
      p_VALUE_TYPE_ID    IN TREATM_PARAM.VALUE_TYPE_ID%type DEFAULT NULL ,
      p_MDD              IN TREATM_PARAM.MDD%type DEFAULT NULL ,
      p_TREATM_ID        IN TREATM_PARAM.TREATM_ID%type ,
      p_VALUE            IN TREATM_PARAM.VALUE%type DEFAULT NULL ,
      p_ROLL_TYPE        IN TREATM_PARAM.ROLL_TYPE%type DEFAULT NULL ,
      p_PARAM_TYPE_ID    IN TREATM_PARAM.PARAM_TYPE_ID%type ,
      p_EPI_ID           IN TREATM_PARAM.EPI_ID%type )
  IS
  BEGIN
    INSERT
    INTO TREATM_PARAM
      (
        CRU ,
        TREATM_PARAM_ID ,
        UNIT ,
        TO_DATE ,
        SUBJ_ID ,
        UNIT_TYPE_ID ,
        DESCRIPTION ,
        SUBJ_TYPE_ID ,
        MDU ,
        ORDER_NO ,
        MM_ID ,
        FROM_DATE ,
        TREATM_PARAM1_ID ,
        FIELD_TYPE_ID ,
        CRD ,
        VALUE_TYPE_ID ,
        MDD ,
        TREATM_ID ,
        VALUE ,
        ROLL_TYPE ,
        PARAM_TYPE_ID ,
        EPI_ID
      )
      VALUES
      (
        p_CRU ,
        p_TREATM_PARAM_ID ,
        p_UNIT ,
        p_TO_DATE ,
        p_SUBJ_ID ,
        p_UNIT_TYPE_ID ,
        p_DESCRIPTION ,
        p_SUBJ_TYPE_ID ,
        p_MDU ,
        p_ORDER_NO ,
        p_MM_ID ,
        p_FROM_DATE ,
        p_TREATM_PARAM1_ID ,
        p_FIELD_TYPE_ID ,
        p_CRD ,
        p_VALUE_TYPE_ID ,
        p_MDD ,
        p_TREATM_ID ,
        p_VALUE ,
        p_ROLL_TYPE ,
        p_PARAM_TYPE_ID ,
        p_EPI_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU              IN TREATM_PARAM.CRU%type DEFAULT NULL ,
      p_TREATM_PARAM_ID  IN TREATM_PARAM.TREATM_PARAM_ID%type ,
      p_UNIT             IN TREATM_PARAM.UNIT%type DEFAULT NULL ,
      p_TO_DATE          IN TREATM_PARAM.TO_DATE%type ,
      p_SUBJ_ID          IN TREATM_PARAM.SUBJ_ID%type DEFAULT NULL ,
      p_UNIT_TYPE_ID     IN TREATM_PARAM.UNIT_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION      IN TREATM_PARAM.DESCRIPTION%type DEFAULT NULL ,
      p_SUBJ_TYPE_ID     IN TREATM_PARAM.SUBJ_TYPE_ID%type DEFAULT NULL ,
      p_MDU              IN TREATM_PARAM.MDU%type DEFAULT NULL ,
      p_ORDER_NO         IN TREATM_PARAM.ORDER_NO%type DEFAULT NULL ,
      p_MM_ID            IN TREATM_PARAM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE        IN TREATM_PARAM.FROM_DATE%type ,
      p_TREATM_PARAM1_ID IN TREATM_PARAM.TREATM_PARAM1_ID%type DEFAULT NULL ,
      p_FIELD_TYPE_ID    IN TREATM_PARAM.FIELD_TYPE_ID%type DEFAULT NULL ,
      p_CRD              IN TREATM_PARAM.CRD%type DEFAULT NULL ,
      p_VALUE_TYPE_ID    IN TREATM_PARAM.VALUE_TYPE_ID%type DEFAULT NULL ,
      p_MDD              IN TREATM_PARAM.MDD%type DEFAULT NULL ,
      p_TREATM_ID        IN TREATM_PARAM.TREATM_ID%type ,
      p_VALUE            IN TREATM_PARAM.VALUE%type DEFAULT NULL ,
      p_ROLL_TYPE        IN TREATM_PARAM.ROLL_TYPE%type DEFAULT NULL ,
      p_PARAM_TYPE_ID    IN TREATM_PARAM.PARAM_TYPE_ID%type ,
      p_EPI_ID           IN TREATM_PARAM.EPI_ID%type
    )
  IS
  BEGIN
    UPDATE TREATM_PARAM
    SET CRU               = p_CRU ,
      UNIT                = p_UNIT ,
      TO_DATE             = p_TO_DATE ,
      SUBJ_ID             = p_SUBJ_ID ,
      UNIT_TYPE_ID        = p_UNIT_TYPE_ID ,
      DESCRIPTION         = p_DESCRIPTION ,
      SUBJ_TYPE_ID        = p_SUBJ_TYPE_ID ,
      MDU                 = p_MDU ,
      ORDER_NO            = p_ORDER_NO ,
      MM_ID               = p_MM_ID ,
      FROM_DATE           = p_FROM_DATE ,
      TREATM_PARAM1_ID    = p_TREATM_PARAM1_ID ,
      FIELD_TYPE_ID       = p_FIELD_TYPE_ID ,
      CRD                 = p_CRD ,
      VALUE_TYPE_ID       = p_VALUE_TYPE_ID ,
      MDD                 = p_MDD ,
      TREATM_ID           = p_TREATM_ID ,
      VALUE               = p_VALUE ,
      ROLL_TYPE           = p_ROLL_TYPE ,
      PARAM_TYPE_ID       = p_PARAM_TYPE_ID ,
      EPI_ID              = p_EPI_ID
    WHERE TREATM_PARAM_ID = p_TREATM_PARAM_ID;
  END;
-- del
  PROCEDURE del(
      p_TREATM_PARAM_ID IN TREATM_PARAM.TREATM_PARAM_ID%type )
  IS
  BEGIN
    DELETE FROM TREATM_PARAM WHERE TREATM_PARAM_ID = p_TREATM_PARAM_ID;
  END;

  
END TREATM_PARAM_tapi;

/
