--------------------------------------------------------
--  DDL for Function GET_ELOIR_HTML
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_ELOIR_HTML" (
    p_beerkezes_id NUMBER
  , p_lista_id NUMBER
  , p_editable NUMBER DEFAULT NULL
  )
  RETURN VARCHAR2
AS

v_line_no number(3,0) := 0;
v_cnt number (3,0);
v_first_line boolean := true;
v_first_column boolean := true;
v_exists_status number(3,0) := 0;
v_tr_xl_id number(12,0);
v_cell_value varchar2(255);

V_COUNTER number(3,0) := 0;
v_status_counter number(3,0) := 0;

v_column_no number(3,0) := 1;
v_column_max number(3,0) := 0;
v_comment_no NUMBER(3);

v_old_param_type_id number(12,0) := -1;
v_COLSPAN number(3,0) := 0;

v_retval VARCHAR2 (32000) := ' ';

cursor oszlopok is
select cols.*
 -- ,break_string(cols.description,10) ||'<br>['||cols.param_unit||']' as column_head_string 
  ,GET_COLUMN_HEAD_STRING(cols.dm_xl_id,p_beerkezes_id)  as column_head_string 
  from TABLE(FN_GET_DM_XL_COLS(p_beerkezes_id,p_lista_id)) cols
order by order_no;

CURSOR sorok IS
SELECT *
  FROM TABLE(FN_GET_DM_XL_ROWS(p_beerkezes_id,p_lista_id)) r
  ORDER BY order_no;  


begin

v_retval := v_retval || '<div id="tableContainer" class="tableContainer">';
v_retval := v_retval || '<table id="EloiranyzatTable" style="width:2000px">'; 
v_retval := v_retval || '<thead class="fixedHeader">';
v_retval := v_retval || '<tr><th style="overflow:hidden; width:40px;">Sor-<br>szám</th>'; 
if p_lista_id = 53 then
           v_retval := v_retval || '<th style="text-align:center; overflow:hidden; width:160px;"> Elõirányzat neve</td>';
       else 
           v_retval := v_retval || '<th style="text-align:center;overflow:hidden; width:250px;"> Elõirányzat neve</td>';
       end if;

for oszlop in oszlopok
loop
     v_retval := v_retval || '<th style="overflow:hidden; width:125px;">' || oszlop.column_head_string|| '</th>';
     v_column_max := v_column_max + 1;
end loop;
v_retval := v_retval || '</tr>';
v_retval := v_retval || '</thead>';
v_retval := v_retval || '<tbody  class="scrollContent" style="vertical-align:top;">';
FOR sor IN sorok
  LOOP
   if sor.print_type is null then
          v_retval := v_retval || '<tr>';
       elsif sor.print_type = 'grey/black/bold' then
           v_retval := v_retval || '<tr class = "gbb">';
       elsif sor.print_type = 'yellow/red/bold' then
           v_retval := v_retval || '<tr class = "yrb">';
       elsif sor.print_type = 'yellow/black/bold' then
           v_retval := v_retval || '<tr class = "ybb">';
        elsif sor.print_type = 'yellow/black/normal' then
           v_retval := v_retval || '<tr class = "ybn">';
       elsif sor.print_type = 'white/black/italic' then
           v_retval := v_retval || '<tr class = "wbi">';
       end if;
   v_retval := v_retval || '<td style="width:40px;">';
   v_retval := v_retval || sor.order_no;
   v_retval := v_retval || '</td>';
   v_retval := v_retval || '<td style="text-align:left; width:250px;">';
   v_retval := v_retval || lookup_super_type_name(sor.param_type_id);
   v_retval := v_retval || '</td>';
      for oszlop in oszlopok

      loop     
        -- vigyázz az utolsó paraméter OUT!!!!!!!!!   
        v_cell_value := LOOKUP_TR_XL_VALUE(p_beerkezes_id,p_lista_id,sor.param_type_id,oszlop.order_no,v_tr_xl_id);
        select count(1) into v_comment_no FROM cell_Comments WHERE row_id = v_tr_xl_id;
        v_retval := v_retval || '<td style="overflow:hidden; width:125px;">';
        if FN_CELL_IS_MUTABLE(p_beerkezes_id,p_lista_id,oszlop.order_sign,sor.param_type_id ) = 1 AND p_editable IS null then
           v_retval := v_retval || '<input type="text" onchange="get_AJAX_SELECT_XML(this,'||v_tr_xl_id||')"  onkeydown="showKeyCode(event);"
                   size = "10" style = "text-align:right;"  class = "field" value="'||v_cell_value ||'">'; 
        else 
          v_retval := v_retval || v_cell_value;
        end if;
        v_retval := v_retval || '<a href="f?p='||v('APP_ID')||':1990:'||v('SESSION')||'::NO::P1990_row_ID:'||v_tr_xl_id||'">';
        IF v_comment_no = 0 then
           v_retval := v_retval || '<img src = "'||v('WORKSPACE_IMAGES')||'020h.png">';
        ELSE
           v_retval := v_retval || '<img src = "'||v('WORKSPACE_IMAGES')||'020.png">';
        END IF;
        v_retval := v_retval || '</a>';
        v_retval := v_retval || '</td>';
      end LOOP;
   v_retval := v_retval || '</tr>';
  END LOOP;

  
v_retval := v_retval || '</tbody>';
v_retval := v_retval || '</table>'; 
v_retval := v_retval || '</div>';
RETURN v_retval;
end;

/
