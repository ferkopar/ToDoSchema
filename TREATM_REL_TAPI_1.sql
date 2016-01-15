--------------------------------------------------------
--  DDL for Package Body TREATM_REL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_REL_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_TREATM_ID2      IN TREATM_REL.TREATM_ID2%type ,
      p_TIME_START      IN TREATM_REL.TIME_START%type DEFAULT NULL ,
      p_CRU             IN TREATM_REL.CRU%type DEFAULT NULL ,
      p_TREATM_ID1      IN TREATM_REL.TREATM_ID1%type ,
      p_EXTRA_NEXT_STEP IN TREATM_REL.EXTRA_NEXT_STEP%type DEFAULT NULL ,
      p_TO_DATE         IN TREATM_REL.TO_DATE%type DEFAULT NULL ,
      p_STATUS_ID       IN TREATM_REL.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION     IN TREATM_REL.DESCRIPTION%type DEFAULT NULL ,
      p_MDU             IN TREATM_REL.MDU%type DEFAULT NULL ,
      p_ORDER_NO        IN TREATM_REL.ORDER_NO%type DEFAULT NULL ,
      p_MM_ID           IN TREATM_REL.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE       IN TREATM_REL.FROM_DATE%type DEFAULT NULL ,
      p_TREATM_REL_ID   IN TREATM_REL.TREATM_REL_ID%type ,
      p_REL_TYPE_ID     IN TREATM_REL.REL_TYPE_ID%type ,
      p_CRD             IN TREATM_REL.CRD%type DEFAULT NULL ,
      p_MDD             IN TREATM_REL.MDD%type DEFAULT NULL ,
      p_EPI_ID          IN TREATM_REL.EPI_ID%type DEFAULT NULL ,
      p_TIME_END        IN TREATM_REL.TIME_END%type DEFAULT NULL ,
      p_GO_ORDER_NO     IN TREATM_REL.GO_ORDER_NO%type DEFAULT NULL ,
      p_KOD1            IN TREATM_REL.KOD1%type DEFAULT NULL ,
      p_KOD2            IN TREATM_REL.KOD2%type DEFAULT NULL )
  IS
  BEGIN
    INSERT
    INTO TREATM_REL
      (
        TREATM_ID2 ,
        TIME_START ,
        CRU ,
        TREATM_ID1 ,
        EXTRA_NEXT_STEP ,
        TO_DATE ,
        STATUS_ID ,
        DESCRIPTION ,
        MDU ,
        ORDER_NO ,
        MM_ID ,
        FROM_DATE ,
        TREATM_REL_ID ,
        REL_TYPE_ID ,
        CRD ,
        MDD ,
        EPI_ID ,
        TIME_END ,
        GO_ORDER_NO ,
        KOD1 ,
        KOD2
      )
      VALUES
      (
        p_TREATM_ID2 ,
        p_TIME_START ,
        p_CRU ,
        p_TREATM_ID1 ,
        p_EXTRA_NEXT_STEP ,
        p_TO_DATE ,
        p_STATUS_ID ,
        p_DESCRIPTION ,
        p_MDU ,
        p_ORDER_NO ,
        p_MM_ID ,
        p_FROM_DATE ,
        p_TREATM_REL_ID ,
        p_REL_TYPE_ID ,
        p_CRD ,
        p_MDD ,
        p_EPI_ID ,
        p_TIME_END ,
        p_GO_ORDER_NO ,
        p_KOD1 ,
        p_KOD2
      );
  END;
-- update
  PROCEDURE upd
    (
      p_TREATM_ID2      IN TREATM_REL.TREATM_ID2%type ,
      p_TIME_START      IN TREATM_REL.TIME_START%type DEFAULT NULL ,
      p_CRU             IN TREATM_REL.CRU%type DEFAULT NULL ,
      p_TREATM_ID1      IN TREATM_REL.TREATM_ID1%type ,
      p_EXTRA_NEXT_STEP IN TREATM_REL.EXTRA_NEXT_STEP%type DEFAULT NULL ,
      p_TO_DATE         IN TREATM_REL.TO_DATE%type DEFAULT NULL ,
      p_STATUS_ID       IN TREATM_REL.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION     IN TREATM_REL.DESCRIPTION%type DEFAULT NULL ,
      p_MDU             IN TREATM_REL.MDU%type DEFAULT NULL ,
      p_ORDER_NO        IN TREATM_REL.ORDER_NO%type DEFAULT NULL ,
      p_MM_ID           IN TREATM_REL.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE       IN TREATM_REL.FROM_DATE%type DEFAULT NULL ,
      p_TREATM_REL_ID   IN TREATM_REL.TREATM_REL_ID%type ,
      p_REL_TYPE_ID     IN TREATM_REL.REL_TYPE_ID%type ,
      p_CRD             IN TREATM_REL.CRD%type DEFAULT NULL ,
      p_MDD             IN TREATM_REL.MDD%type DEFAULT NULL ,
      p_EPI_ID          IN TREATM_REL.EPI_ID%type DEFAULT NULL ,
      p_TIME_END        IN TREATM_REL.TIME_END%type DEFAULT NULL ,
      p_GO_ORDER_NO     IN TREATM_REL.GO_ORDER_NO%type DEFAULT NULL ,
      p_KOD1            IN TREATM_REL.KOD1%type DEFAULT NULL ,
      p_KOD2            IN TREATM_REL.KOD2%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE TREATM_REL
    SET TREATM_ID2      = p_TREATM_ID2 ,
      TIME_START        = p_TIME_START ,
      CRU               = p_CRU ,
      TREATM_ID1        = p_TREATM_ID1 ,
      EXTRA_NEXT_STEP   = p_EXTRA_NEXT_STEP ,
      TO_DATE           = p_TO_DATE ,
      STATUS_ID         = p_STATUS_ID ,
      DESCRIPTION       = p_DESCRIPTION ,
      MDU               = p_MDU ,
      ORDER_NO          = p_ORDER_NO ,
      MM_ID             = p_MM_ID ,
      FROM_DATE         = p_FROM_DATE ,
      REL_TYPE_ID       = p_REL_TYPE_ID ,
      CRD               = p_CRD ,
      MDD               = p_MDD ,
      EPI_ID            = p_EPI_ID ,
      TIME_END          = p_TIME_END ,
      GO_ORDER_NO       = p_GO_ORDER_NO ,
      KOD1              = p_KOD1 ,
      KOD2              = p_KOD2
    WHERE TREATM_REL_ID = p_TREATM_REL_ID;
  END;
-- del
  PROCEDURE del(
      p_TREATM_REL_ID IN TREATM_REL.TREATM_REL_ID%type )
  IS
  BEGIN
    DELETE FROM TREATM_REL WHERE TREATM_REL_ID = p_TREATM_REL_ID;
  END;
END TREATM_REL_tapi;

/
