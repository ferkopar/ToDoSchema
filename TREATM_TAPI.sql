--------------------------------------------------------
--  DDL for Package TREATM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "TREATM_TAPI" 
IS
type TREATM_tapi_rec
IS
  record
  (
    CRU TREATM.CRU%type ,
    TIME_START TREATM.TIME_START%type ,
    SUBJ2_ID TREATM.SUBJ2_ID%type ,
    TO_DATE TREATM.TO_DATE%type ,
    STATUS_ID TREATM.STATUS_ID%type ,
    DESCRIPTION TREATM.DESCRIPTION%type ,
    MDU TREATM.MDU%type ,
    TYPE2_ID TREATM.TYPE2_ID%type ,
    TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%type ,
    MM_ID TREATM.MM_ID%type ,
    FROM_DATE TREATM.FROM_DATE%type ,
    TREATM_GROUP_ID TREATM.TREATM_GROUP_ID%type ,
    TYPE1_ID TREATM.TYPE1_ID%type ,
    CRD TREATM.CRD%type ,
    MDD TREATM.MDD%type ,
    TREATM_NAME TREATM.TREATM_NAME%type ,
    SUBJ1_ID TREATM.SUBJ1_ID%type ,
    TREATM_ID TREATM.TREATM_ID%type ,
    TIME_END TREATM.TIME_END%type ,
    TREATM_NAME_ID TREATM.TREATM_NAME_ID%type ,
    TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%type );
type TREATM_tapi_tab
IS
  TABLE OF TREATM_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
      p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
      p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
      p_TO_DATE            IN TREATM.TO_DATE%type ,
      p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
      p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
      p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
      p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE          IN TREATM.FROM_DATE%type ,
      p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
      p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
      p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
      p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
      p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
      p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
      p_TREATM_ID          IN TREATM.TREATM_ID%type ,
      p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
      p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
      p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL );
  -- update
  PROCEDURE upd(
      p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
      p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
      p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
      p_TO_DATE            IN TREATM.TO_DATE%type ,
      p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
      p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
      p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
      p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
      p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
      p_FROM_DATE          IN TREATM.FROM_DATE%type ,
      p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
      p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
      p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
      p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
      p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
      p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
      p_TREATM_ID          IN TREATM.TREATM_ID%type ,
      p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
      p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
      p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL );
  -- delete
  PROCEDURE del(
      p_TREATM_ID IN TREATM.TREATM_ID%type );

  PROCEDURE invalidate(p_treatm_id_to_invalidate IN TREATM.TREATM_ID%TYPE);

FUNCTION copy(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
              p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%TYPE,
              p_copy_type VARCHAR2 DEFAULT 'P304_LEVEL') RETURN NUMBER;

 FUNCTION copy_n(p_TREATM_ROW IN TREATM%ROWTYPE,
                  p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER;

 
  FUNCTION   copy_tree(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
                p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER;

  PROCEDURE activate(p_TREATM_ID IN TREATM.TREATM_ID%TYPE);
                
 FUNCTION apex_condtion_norma(  
                           p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2;

FUNCTION apex_condtion(  
                           p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2;
FUNCTION apex_condtion_other(  
                           p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2;

FUNCTION GET_NAME(p_treatm_id TREATM.TREATM_ID%TYPE) RETURN VARCHAR2;

END TREATM_tapi;

/
