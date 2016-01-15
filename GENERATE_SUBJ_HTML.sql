--------------------------------------------------------
--  DDL for Package GENERATE_SUBJ_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GENERATE_SUBJ_HTML" AS

CURSOR params(p_group_id number)
  IS
    SELECT *
    FROM dm_subject
      WHERE group_id = p_group_id
    ORDER BY order_no;

PROCEDURE GENERATE_SUBJ_LIST(p_subj_type_id number);

PROCEDURE GENERATE_SUBJ_HEAD_EDITOR(
    p_subj_id NUMBER DEFAULT NULL,
    p_disp_type NUMBER);

PROCEDURE GENERATE_SUBJ_PARAM_EDITOR( p_subj_id NUMBER,  p_subj_type_id NUMBER default 1010);

PROCEDURE GENERATE_SUBJ_EDITOR(
    p_subj_type_id NUMBER,
    p_subj_id      NUMBER DEFAULT NULL,
    p_disp_type    number default 0);

PROCEDURE GENERATE_SUBJ_LIST_AJAX(p_json varchar2);

procedure GENERATE_DM_SUBJ_LIST(p_subj_type_id number);

PROCEDURE  GENERATE_GROUP_ROWS(p_par dm_subject%rowtype,p_subj_id number);

PROCEDURE GENERATE_EMPTY_GROUP_ROW(p_dm_subj_id number,p_subj_par_id NUMBER);

PROCEDURE INSERT_NEW_LIST_ELEMENT(p_dm_subject_id number, p_text varchar2);

PROCEDURE AJAX_GET_STREET_CONTROL(p_city_name varchar2, p_par_id number);

PROCEDURE GET_STREET_TYPE_ID (p_street_id number);

FUNCTION GET_ZIP(p_city_id number, street_id number default null ) RETURN varchar2;

FUNCTION SUBJ_IN_TYPE(p_subj_id NUMBER, p_subj_type_id NUMBER)  RETURN BOOLEAN;

END GENERATE_SUBJ_HTML;

/
