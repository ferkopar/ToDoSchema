--------------------------------------------------------
--  DDL for Package TREATM_PRU_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "TREATM_PRU_TAPI" 
IS
type TREATM_PRU_tapi_rec
IS
  record
  (
    CRU TREATM_PRU.CRU%type ,
    SUBJ_ID TREATM_PRU.SUBJ_ID%type ,
    UNIT_TYPE_ID TREATM_PRU.UNIT_TYPE_ID%type ,
    TO_DATE TREATM_PRU.TO_DATE%type ,
    STATUS_ID TREATM_PRU.STATUS_ID%type ,
    DESCRIPTION TREATM_PRU.DESCRIPTION%type ,
    MDU TREATM_PRU.MDU%type ,
    MM_ID TREATM_PRU.MM_ID%type ,
    FROM_DATE TREATM_PRU.FROM_DATE%type ,
    CRD TREATM_PRU.CRD%type ,
    MDD TREATM_PRU.MDD%type ,
    VALUE TREATM_PRU.VALUE%type ,
    TYPE_ID TREATM_PRU.TYPE_ID%type ,
    PARAM_TYPE_ID TREATM_PRU.PARAM_TYPE_ID%type ,
    TREATM_PRU_ID TREATM_PRU.TREATM_PRU_ID%type ,
    EPI_ID TREATM_PRU.EPI_ID%type );
type TREATM_PRU_tapi_tab
IS
  TABLE OF TREATM_PRU_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
      p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
      p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
      p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
      p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
      p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
      p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
      p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
      p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
      p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
      p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
      p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
      p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type DEFAULT NULL ,
      p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL );
  -- update
  PROCEDURE UPDATE_DATA
    (
    p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
    p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
    p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
    p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
    p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
    p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type ,
    p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL
  );
  PROCEDURE upd(
      p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
      p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
      p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
      p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
      p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
      p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
      p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
      p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
      p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
      p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
      p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
      p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
      p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type ,
      p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL );
  -- delete
  PROCEDURE del(
      p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type );

  PROCEDURE invalidate(
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type );

  FUNCTION clone(
    p_treatm_pru_id in treatm_pru.treatm_pru_id%TYPE) RETURN NUMBER;

  FUNCTION apex_condtion(p_treatm_pru_id treatm_pru.treatm_pru_id%TYPE DEFAULT NULL,
                         p_subj_id treatm_pru.subj_id%TYPE,
                         p_type_id treatm_pru.type_id%TYPE,
                         p_param_type_id treatm_pru.param_type_id%TYPE,
                         p_unit_type_id treatm_pru.unit_type_id%TYPE,
                         p_from_date treatm_pru.from_date%TYPE,
                         p_to_date treatm_pru.to_date%TYPE
                       ) RETURN VARCHAR2;
END TREATM_PRU_tapi;

/
