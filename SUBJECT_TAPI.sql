--------------------------------------------------------
--  DDL for Package SUBJECT_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SUBJECT_TAPI" 
IS
type SUBJECT_tapi_rec
IS
  record
  (
    CRU SUBJECT.CRU%type ,
    CRD SUBJECT.CRD%type ,
    TO_DATE SUBJECT.TO_DATE%type ,
    SUBJ_ID SUBJECT.SUBJ_ID%type ,
    MDD SUBJECT.MDD%type ,
    DESCRIPTION SUBJECT.DESCRIPTION%type ,
    MDU SUBJECT.MDU%type ,
    SUBJ_CATEGORY_ID SUBJECT.SUBJ_CATEGORY_ID%type ,
    ROLL_TYPE SUBJECT.ROLL_TYPE%type ,
    FROM_DATE SUBJECT.FROM_DATE%type );
type SUBJECT_tapi_tab
IS
  TABLE OF SUBJECT_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CRU              IN SUBJECT.CRU%type DEFAULT NULL ,
      p_CRD              IN SUBJECT.CRD%type DEFAULT NULL ,
      p_TO_DATE          IN SUBJECT.TO_DATE%type DEFAULT NULL ,
      p_SUBJ_ID          IN SUBJECT.SUBJ_ID%type ,
      p_MDD              IN SUBJECT.MDD%type DEFAULT NULL ,
      p_DESCRIPTION      IN SUBJECT.DESCRIPTION%type DEFAULT NULL ,
      p_MDU              IN SUBJECT.MDU%type DEFAULT NULL ,
      p_SUBJ_CATEGORY_ID IN SUBJECT.SUBJ_CATEGORY_ID%type DEFAULT NULL ,
      p_ROLL_TYPE        IN SUBJECT.ROLL_TYPE%type DEFAULT NULL ,
      p_FROM_DATE        IN SUBJECT.FROM_DATE%type DEFAULT NULL );
  -- update
  PROCEDURE upd(
      p_CRU              IN SUBJECT.CRU%type DEFAULT NULL ,
      p_CRD              IN SUBJECT.CRD%type DEFAULT NULL ,
      p_TO_DATE          IN SUBJECT.TO_DATE%type DEFAULT NULL ,
      p_SUBJ_ID          IN SUBJECT.SUBJ_ID%type ,
      p_MDD              IN SUBJECT.MDD%type DEFAULT NULL ,
      p_DESCRIPTION      IN SUBJECT.DESCRIPTION%type DEFAULT NULL ,
      p_MDU              IN SUBJECT.MDU%type DEFAULT NULL ,
      p_SUBJ_CATEGORY_ID IN SUBJECT.SUBJ_CATEGORY_ID%type DEFAULT NULL ,
      p_ROLL_TYPE        IN SUBJECT.ROLL_TYPE%type DEFAULT NULL ,
      p_FROM_DATE        IN SUBJECT.FROM_DATE%type DEFAULT NULL );
  -- delete
  PROCEDURE del(
      p_SUBJ_ID IN SUBJECT.SUBJ_ID%type );

  FUNCTION GET_SUBJECT_NAME(p_subj_id NUMBER)
  RETURN VARCHAR2;

  FUNCTION GET_USER_NAME(p_user_name VARCHAR2)
  RETURN VARCHAR2;

  FUNCTION IS_ENDUSER(p_user_name VARCHAR2)
    return boolean;
  
  FUNCTION IS_ENDUSER(p_subj_id number)
    return boolean;

 function is_subj_in_type(p_subj_id number, p_type VARCHAR2) 
  return boolean;

  FUNCTION IS_ADMINISTRATOR(p_user_name VARCHAR2)
    return boolean;

  FUNCTION IS_QUERY_BUILDER(p_user_name VARCHAR2)
    return boolean;

  FUNCTION GET_USER_SUBJ_ID(p_user_name VARCHAR2)
  RETURN number;

  PROCEDURE COMPUTE_JSON(p_json varchar2);

 PROCEDURE DELETE_PARAM_ROW(p_group_id number);
END SUBJECT_tapi;

/
