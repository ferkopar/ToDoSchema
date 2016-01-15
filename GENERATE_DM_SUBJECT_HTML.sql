--------------------------------------------------------
--  DDL for Package GENERATE_DM_SUBJECT_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GENERATE_DM_SUBJECT_HTML" AS

TYPE DmSubTabTyp IS VARRAY(1000) OF DM_SUBJECT%ROWTYPE;

PROCEDURE SAVE_CHANGES(p_json varchar2);

PROCEDURE GET_DM_SUBJECT_ROW_INSERT(p_subj_type number,p_group_id number);
PROCEDURE GET_DM_SUBJECT_ROW_EDIT(p_dm_subject_id number);

FUNCTION GET_DM_SUBJECT_ROWS(p_subj_type_id number, p_group_id number)  RETURN DmSubTabTyp;

procedure GENERATE_DM_SUBJ_TYPE_LIST;
PROCEDURE GET_DM_SUBJ_EDITOR(p_subj_type_id number);
PROCEDURE GET_DM_SUBJ_EDITOR_TABLE(p_subj_type_id number, p_group_id number default 0);

END GENERATE_DM_SUBJECT_HTML;

/
