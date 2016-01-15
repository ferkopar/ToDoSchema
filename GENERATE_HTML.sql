--------------------------------------------------------
--  DDL for Package GENERATE_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GENERATE_HTML" AS

  TYPE ColTyp IS RECORD (
      column_type_id NUMBER(12,0), 
      column_value NUMBER(15,2)); 
   TYPE ColTyps IS VARRAY(10) OF ColTyp;

  TYPE SumRowType is RECORD(
       dm_xl_col_type_id NUMBER(12,0), 
       tr_xl_value NUMBER(15,2)
    );

  TYPE SumRowTypeTable IS TABLE OF SumRowType;

  


  PROCEDURE GET_DOC_EDIT_HTML (
    p_treatm_id NUMBER
  , p_lista_id NUMBER DEFAULT NULL
  , p_doc_id    NUMBER
  , p_editable NUMBER DEFAULT NULL 
  );
 
  FUNCTION GET_ROW_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_order_no DM_XL.ORDER_NO%TYPE 
  , p_editable NUMBER DEFAULT NULL
  ) RETURN VARCHAR2; 

  PROCEDURE GET_DETAIL_ROWS_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_editable NUMBER DEFAULT NULL
 );
 
  PROCEDURE INSERT_EMPTY_LINE(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_doc_id NUMBER)
    ;

  FUNCTION GET_TR_XL_VALUE 
  (p_beerkezes_id NUMBER
  ,p_list_type_id NUMBER
  ,p_param_type_id NUMBER
  ,p_column_param_type_id NUMBER 
  ,p_order_no number
  ,p_tr_xl_id OUT NUMBER
  )
  RETURN VARCHAR2;

  FUNCTION GET_TR_XL_CELL_SUM(
      p_column_type_id NUMBER
    ,p_param_type_id  NUMBER
    ,p_col            NUMBER
    ,p_treatm_id      NUMBER
    ,p_lista_id       NUMBER
    ) 
    RETURN NUMBER;
 
  FUNCTION get_tr_xl_cell_sum(
     p_column_type_id NUMBER
    ,p_param_type_id  NUMBER
    ,p_cols           ColTyps
    ,p_treatm_id      NUMBER
    ,p_lista_id       NUMBER) 
  RETURN NUMBER;

  FUNCTION is_sum_column(
     p_column_dm_xl_id NUMBER
    ,p_param_type_id   NUMBER
    ,p_treatm_id       NUMBER
    ,p_lista_id        NUMBER
    ) return BOOLEAN;
  
  FUNCTION has_sum_column(
     p_lista_id        NUMBER
    ) return BOOLEAN;
 
  PROCEDURE GET_SUBJ_PARAM_EDITOR( p_subj_id NUMBER, 
                                 p_subj_type_id NUMBER);
 
  PROCEDURE GET_TREATM_PARAM_EDITOR( p_treatm_id NUMBER, 
                                     p_treatm_group_id NUMBER,
                                     p_treatm_category_id NUMBER,
                                     p_treatm_type_id NUMBER);

--  PROCEDURE GET_PARAM_EDITOR_ROW(p_treatm_param_row TREATM_PARAM%ROWTYPE,p_dm_treatm_row DM_TREATM%ROWTYPE);
  PROCEDURE GET_PARAM_EDITOR_ROW(p_treatm_param_row TREATM_PARAM%ROWTYPE,p_dm_treatm_row DM_TREATM_tapi.DM_TREATM_rec);

  PROCEDURE GET_SUBJ_LIST (p_subj_type_id NUMBER);

  PROCEDURE GET_TREATM_VIEWER (p_treatm_id NUMBER);
 
  PROCEDURE GET_DM_XL_EDITOR  (p_doc_id NUMBER,p_list_id NUMBER,p_rel_id NUMBER);

  PROCEDURE GET_DM_XL_PREVIEW  (p_doc_id NUMBER,p_list_id NUMBER);

  PROCEDURE GET_DM_TREATM_EDITOR(p_treatm_id number);

  PROCEDURE GET_EMPTY_DM_TREATM_ROW;

  PROCEDURE GET_TREATM_ROW_FORM (p_treatm_id TREATM.TREATM_ID%TYPE,
                                 p_treatm_group_id TREATM.TREATM_ID%TYPE default null);

  PROCEDURE SEND_SELECT_LIST(p_id number,p_group_id number, p_read_only boolean default false);

  PROCEDURE SEND_SELECT_LIST(p_id number, p_treatm_group_id number, p_table_name varchar2, p_column_name varchar2, p_read_only boolean default false);

  PROCEDURE GET_SELECT(P_GROUP_ID NUMBER, p_id NUMBER);

  PROCEDURE GET_TREATM_CHILDS(p_treatm_id number);

  PROCEDURE GET_DM_DOMAIN_RULE_EDITOR(p_domain number);

  procedure GET_MAIN_PAGE;

  PROCEDURE GENERATE_HACK;
END GENERATE_HTML;

/
