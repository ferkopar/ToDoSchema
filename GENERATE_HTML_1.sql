--------------------------------------------------------
--  DDL for Package Body GENERATE_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_HTML" AS 
 
  PROCEDURE GET_DOC_EDIT_HTML (
    p_treatm_id NUMBER 
  , p_lista_id  NUMBER DEFAULT NULL
  , p_doc_id    NUMBER 
  , p_editable  NUMBER DEFAULT NULL
  )
  AS
    cursor oszlopok(p_doc_id number) is
SELECT *
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = NVL(p_lista_id, GET_DOC_DEFAULT_LIST(p_doc_id))
    AND DM_XL.REL_TYPE_ID = 42
  ORDER BY order_no;

CURSOR sorok(p_doc_id NUMBER) IS SELECT *
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = NVL(p_lista_id, GET_DOC_DEFAULT_LIST(p_doc_id))
    AND DM_XL.REL_TYPE_ID IN (43, 49)
  ORDER BY order_no;
 
CURSOR listak(p_doc_id NUMBER) IS SELECT SUPER_TYP_id,
                                         SUPER_TYPE_NAME
  FROM dm_super_typ
  WHERE group_id = p_doc_id;
--       (select GROUP_ID FROM DM_SUPER_TYP where SUPER_TYP_ID =GET_DOC_DEFAULT_LIST(p_lista_id)) ;

v_column_max NUMBER(3, 0) := 0;
v_row_cnt NUMBER(3, 0) := 0;
v_table_width NUMBER(5, 0) := 1934;
v_cell_value VARCHAR2(2000);
v_ize NUMBER;
v_treatm_id NUMBER;
v_doc_id NUMBER;
BEGIN
    
    if p_treatm_id is null or p_treatm_id = 0 then
--      htp.p('---- null ---');
SELECT NVL(MAX(data_inco_id) + 1, 100)
  INTO v_treatm_id
  FROM tr_xl;
      APEX_UTIL.SET_SESSION_STATE('P6000_DATA_INCO_ID',v_treatm_id);
      v_doc_id := p_doc_id;
    ELSE 
      htp.p('---- not null:'|| p_treatm_id ||' ---');
      v_treatm_id := p_treatm_id;
      v_doc_id := get_doc_id(v_treatm_id);
    end if;
    open sorok(v_doc_id);
--    htp.p('-rc-'||sorok%ROWCOUNT  || '---');
    close sorok;
--    htp.p('----'|| p_doc_id || '---');
--    htp.p('----'|| p_lista_id || '---');
--    htp.p( '<div id="tableContainer" class="tableContainer" style="height: 300px;">' );
    htp.p( '<div id="tableContainer" class="tableContainer">' );
    HTP.P('<div id="tabsF"><ul>');
 
    for lista in listak(v_doc_id)
    loop   
      if lista.SUPER_TYP_ID in (100131,100132,100142,100051,100052,100053,100101,100104,100121,100122) then
         HTP.P('<li><a href="f?p='||V('APP_ID')||':6000:'||V('APP_SESSION')||'::::P6000_LISTA_ID:'||lista.SUPER_TYP_ID ||'"><span>'||lista.SUPER_TYPE_NAME ||'</span></a></li>');
 
      end if;
    end loop;
    HTP.P('</ul></div>');
 
    if p_lista_id = 100131 then
       v_table_width := 500;
    end if;
    htp.p( '<table id="EloiranyzatTable" style="width:'||v_table_width ||'px">' );
 
    htp.p( '<thead class="fixedHeader">' );
    if nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)) != 100131 then
      htp.p( '<tr><th style="overflow:hidden; width:40px;" onclick="insert_line(this)">Sor-<br>szám</th>' );
 
      for oszlop in oszlopok(v_doc_id)
      loop
        htp.p(  '<th style="overflow:hidden; width:125px;">' || nvl(oszlop.description,lookup_super_type_name(oszlop.PARAM_TYPE_ID)) || '</th>' );
        v_column_max := v_column_max + 1;
      end loop;
      htp.p( '</tr>');
    end if;
    htp.p(  '</thead>');
    htp.p(  '<tbody  class="scrollContent" style="vertical-align:top;">');
    
    FOR sor IN sorok(v_doc_id)
    LOOP
--      htp.p('----'|| sor.rel_type_id || '---');
    if sor.rel_type_id = 49 then
--      htp.p('----'|| sor.order_no || '---');
      if sor.order_no = '1..x' then    
--          htp.p('----'|| sor.order_no || '---');    
         get_detail_rows_html(v_treatm_id,nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)));
      elsif sor.order_no = 'x+1' then null;
      else 
        raise_application_error(-20000, 'Érvénytelen order_no:' || sor.order_no );
      end if;
    else 
        if p_lista_id = 100131 then
           v_row_cnt := v_row_cnt + 1;
           htp.p('<tr>');
           htp.p( '<td style="overflow:hidden; width:40px;">'||v_row_cnt||'</td>' );
 
           htp.p('<td>'|| sor.w_param_type_name || '</td>');
           htp.p('<td>');
 
           begin
SELECT ORDER_NO1
  INTO v_ize
  FROM v_dm_xl_rel
  WHERE REL_TYPE_ID = 96
    AND DM_XL_ID2 = sor.dm_xl_id;
EXCEPTION
WHEN OTHERS THEN            v_ize := 0;
            v_cell_value := null;
           end;
  
           if v_ize is not null then        
              v_cell_value := SUM_COL_VALUE(v_treatm_id,v_ize,nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)),sor.order_no);
           end if;
           if sor.mutable = 1 then
           htp.p(  '<input type="text" onchange="insert_tr_xl(this,'||0||','||to_char(sor.param_type_id)||','||to_char(v_treatm_id));
                    htp.p(  ')"  onkeydown="showKeyCode(event);" size = "10" style = "text-align:right;"  class = "field" value="');
 
                    htp.p( to_char(v_cell_value) ||'">');
                    --htp.p( '&nbsp;">');
            else
            htp.p('<div id="cell_id_'|| 0 ||'" style="width=100px;">'|| v_cell_value || '</div>');
            end if;
           htp.p('</td>');
           htp.p('<tr>');
          else
            null;
        end if;
        --get_row_html( p_treatm_id,p_lista_id,sor.order_no) ;
    end if;
  
    end loop;
    htp.p(  '</tbody>' );
    htp.p(  '</table>' );
 
    htp.p(  '</div>' );
    
   END GET_DOC_EDIT_HTML;

  FUNCTION GET_ROW_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_order_no DM_XL.ORDER_NO%TYPE
  , p_editable NUMBER DEFAULT NULL
  ) RETURN VARCHAR2 
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

  sor DM_XL%ROWTYPE;

cursor oszlopok is
SELECT *
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = p_lista_id
    AND DM_XL.REL_TYPE_ID = 42
  ORDER BY order_no;

BEGIN

SELECT *
  INTO sor
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = p_lista_id
    AND DM_XL.REL_TYPE_ID = 43
    AND DM_XL.ORDER_NO = p_order_no
  ORDER BY order_no;
  
      
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
        v_cell_value := LOOKUP_TR_XL_VALUE(p_treatm_id,p_lista_id,sor.param_type_id,oszlop.order_no,v_tr_xl_id,p_order_no);
SELECT COUNT(1)
  INTO v_comment_no
  FROM cell_Comments
  WHERE row_id = v_tr_xl_id;
        v_retval := v_retval || '<td style="overflow:hidden; width:125px;">';
        if (oszlop.mutable != 0 OR sor.mutable !=0 ) AND p_editable IS null then
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
  RETURN v_retval;
end;

  PROCEDURE GET_DETAIL_ROWS_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_editable NUMBER DEFAULT NULL
  )
  AS
    
    cursor oszlopok is
SELECT *
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = p_lista_id
    AND DM_XL.REL_TYPE_ID = 42
  ORDER BY order_no;

CURSOR rs IS SELECT DISTINCT order_no,
                             PARAM_TYPE_ID
  FROM TR_XL
  WHERE LIST_TYPE_ID = p_lista_id
    AND DATA_INCO_ID = p_treatm_id
  ORDER BY order_no;

v_tr_xl_id NUMBER(12, 0);
v_cell_value VARCHAR2(255);
v_comment_no NUMBER(3);
v_cell_sum NUMBER(15, 2);

v_ColTyps ColTyps;
v_ColTyp_ev ColTyp;
v_ColTyp_ho ColTyp;

v_dm_xl_row DM_XL % ROWTYPE;
v_dm_xl_rel_row_no NUMBER(3);
v_dm_xl_col_id NUMBER(12, 0);
v_kell_calc NUMBER;
v_dm_xl_rel1 NUMBER(12, 0);
v_dm_xl_rel2 NUMBER(12, 0);

v_cnt NUMBER := 0;

BEGIN
    if p_lista_id in (100053,100132,100104,100122) then
--      htp.p(  '<tbody  class="scrollContent" style="vertical-align:top;">');
--      htp.p('***' ||p_lista_id || '***;***' || p_treatm_id|| '***' );
    FOR r in rs 
      loop
--            htp.p('loop');
            htp.p( '<TR><TD style="width:40px;">'|| to_char(r.order_no) ||'</TD>');
            --htp.p(  '<td style="text-align:left; width:160px;">&nbsp;</TD>');
            for oszlop in oszlopok
              loop
--htp.p('DM_XL_ID2 = '||oszlop.dm_xl_id);
SELECT COUNT(1)
  INTO v_kell_calc
  FROM V_DM_XL_REL
  WHERE DM_XL_ID2 = oszlop.dm_xl_id
    AND REL_TYPE_ID = 46;
                if v_kell_calc > 0 then
--                   htp.p( 'v_kell_calc' );
                   v_cell_value := CALCULATE_COL_VALUE(p_treatm_id,oszlop.order_no,r.param_type_id,p_lista_id,r.order_no);
                   v_tr_xl_id := 0;
                else
                   -- az utolsó paraméter out !!
                   v_cell_value := GET_TR_XL_VALUE(p_treatm_id,p_lista_id,r.param_type_id,oszlop.param_type_id,r.order_no,v_tr_xl_id);
                end if;

SELECT COUNT(1)
  INTO v_comment_no
  FROM cell_Comments
  WHERE row_id = v_tr_xl_id;
                htp.p(  '<td style="overflow:hidden; width:125px;" >' );
                if oszlop.mutable != 0 AND p_editable IS null then  
----                  if v_tr_xl_id = 0 then
----                    htp.p(  '<input type="text" onchange="insert_tr_xl(this,'||to_char(oszlop.dm_xl_id)||','||to_char(r.param_type_id)||','||to_char(p_treatm_id));
----                    htp.p(  ')"  onkeydown="showKeyCode(event);" size = "10" style = "text-align:right;"  class = "field" value="'); 
----                    htp.p( to_char(v_cell_value) ||'">');
----                  else
                    htp.p(  '<input type="text" onchange="set_tr_xl(this,'||to_char(v_tr_xl_id)||')"  onkeydown="showKeyCode(event);"
                   size = "9" style = "text-align:right;"  class = "field" value="'||to_char(v_cell_value) ||'">');
 
----                  end if;
                 
                else 
                   htp.p('<div id="cell_id_'|| trim(v_tr_xl_id) ||'" style="width=100px;">'|| to_char( v_cell_value ) || '</div>');
                end if;

/*
                htp.p(  '<a href="f?p='||v('APP_ID')||':1990:'||v('SESSION')||'::NO::P1990_ROW_ID:'||to_char(v_tr_xl_id)||'">');
                IF v_comment_no = 0 then
                   htp.p(  '<img src = "'||v('WORKSPACE_IMAGES')||'020h.png">');
                ELSE
                   htp.p(  '<img src = "'||v('WORKSPACE_IMAGES')||'020.png">');
                END IF;
                htp.p(  '</a>');
*/
                htp.p(  '</td>');
              end loop;
              htp.p( '</TR>'||CHR(10));
--              htp.p(  '</tbody>');
      end loop;
   if has_sum_column(p_lista_id)  = true then
       -- htp.p('*******'||p_lista_id||'*');
       -- htp.p('<tfoot class="scrollContent" style="vertical-align:top;">');
        htp.p('<tr style="font-weight: bold;">');
        htp.p('<TR id = "sum" ><TD style="width:40px;font-weight: bold;">&#x2211;</TD>');
        if p_lista_id in (100053,100132,100104,100122) then
          for oszlop in oszlopok
            loop
                   
                   htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
    
                   if is_sum_column(oszlop.dm_xl_id,oszlop.param_type_id,p_treatm_id,p_lista_id) = true then             
                  --if oszlop.param_type_id in (101616,101640,101669,101623)then                 
                    htp.p(  '<div>' );
SELECT SUM(NVL(TR_XL.PARAM_VALUE, 0))
  INTO v_cell_sum
  FROM TR_XL
  WHERE LIST_TYPE_ID = p_lista_id
    AND DATA_INCO_ID = p_treatm_id
    AND COLUMN_DATA_TYPE_ID = oszlop.param_type_id
    AND STATUS_ID != 919;
                      htp.p( to_char(v_cell_sum) );
                    htp.p(  '</div>' );
                  else
                    htp.p(  '&nbsp;');
                  end if;
                    htp.p(  '</td>');
            end loop;
  
         elsif p_lista_id = 100052 then
            for oszlop in oszlopok
            loop
                   htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
                 
                   htp.p(  '&nbsp;');
                   htp.p(  '</td>');
            end loop;
         end if;
        htp.p( '</TR>'||CHR(10));
--        htp.p( '</tfoot>');
        end if;
    elsif p_lista_id = 100052 then
     for r in 1..12 loop        
        htp.p( '<TR><TD style="width:40px;">&nbsp;</TD>');
        for oszlop in oszlopok loop

          htp.p('<td style="overflow:hidden; width:125px;font-weight: bold;">');
-- ha az oszlop benne van 
SELECT COUNT(1)
  INTO v_dm_xl_rel_row_no
  FROM DM_XL_REL
  WHERE DM_XL_ID1 = oszlop.dm_xl_id
    AND REL_TYPE_ID = 95;
            if v_dm_xl_rel_row_no > 0 then
               null;
            else
SELECT *
  INTO v_dm_xl_row
  FROM dm_xl
  WHERE DM_XL_ID = (SELECT DM_XL_ID1
        FROM DM_XL_REL
        WHERE DM_XL_ID2 = (SELECT DM_XL_ID
              FROM DM_XL
              WHERE LIST_TYPE_ID = 100052
                AND REL_TYPE_ID = 49 /* Ez a DM_XL-ben a rel_type_id */
                AND ORDER_NO = '1..x')
          AND DM_XL_REL.REL_TYPE_ID = 94 /* Ez a DM_XL_REL-ben a rel_type_id */
    );


              v_ColTyps := ColTyps();
              v_ColTyp_ev.column_value := 2014;
              v_ColTyp_ev.column_type_id := 101101;
              v_ColTyp_ho.column_value := r;
              v_ColTyp_ho.column_type_id := 101102;
              v_ColTyps.extend();
              v_ColTyps(1) := v_ColTyp_ev;
              v_ColTyps.extend();
              v_ColTyps(2) := v_ColTyp_ho;
              htp.p(get_tr_xl_cell_sum(oszlop.param_type_id,null,v_ColTyps,p_treatm_id, v_dm_xl_row.list_type_id));
              --htp.p(get_tr_xl_cell_sum(oszlop.param_type_id,null,v_ColTyps,p_treatm_id, 100053));
            end if;
          htp.p('</td>');
        end loop;
         htp.p('/<tr>');
     end loop;
    elsif p_lista_id = 100142 then
SELECT DM_XL_ID
  INTO v_dm_xl_col_id
  FROM dm_xl
  WHERE DM_XL_ID IN (SELECT DM_XL_ID1
        FROM DM_XL_REL
        WHERE DM_XL_ID2 IN (SELECT DM_XL_ID
              FROM dm_xl
              WHERE LIST_TYPE_ID = p_lista_id)
          AND REL_TYPE_ID = 95);
       for row in (
SELECT DISTINCT PARAM_VALUE,
                list_type_id
  FROM TR_XL
  WHERE DATA_INCO_ID = p_treatm_id
    AND STATUS_ID != 919
    AND col_dm_xl_id = v_dm_xl_col_id
  ORDER BY PARAM_VALUE)
        loop
        v_cnt := v_cnt + 1;
        htp.p('<tr><TD style="width:40px;font-weight: bold;">'|| v_cnt ||'</TD>');

       for oszlop in oszlopok
          loop
                 htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
SELECT COUNT(DM_XL_ID1)
  INTO v_dm_xl_rel1
  FROM dm_xl_rel
  WHERE DM_XL_ID2 = oszlop.dm_xl_id
    AND REL_TYPE_ID = 95;
                 if v_dm_xl_rel1 > 0 then
                   htp.p(  row.param_value ); 
                  else  
                   htp.p(get_tr_xl_cell_sum(oszlop.param_type_id, row.param_value, v_dm_xl_col_id, p_treatm_id, row.list_type_id));         
                -- htp.p( ' &nbsp;' );
                end if;
                 htp.p(  '</td>');
          end loop;
       htp.p('</tr>');
    end loop;

    if has_sum_column(p_lista_id)  = true then
        htp.p('<tr style="font-weight: bold;">');
        htp.p('<TR id = "sum" ><TD style="width:40px;font-weight: bold;">&#x2211;</TD>');
       
        for oszlop in oszlopok
         loop
           htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
                 if is_sum_column(oszlop.dm_xl_id,oszlop.param_type_id,p_treatm_id,p_lista_id) = true then  
                    htp.p( 'true');
                  else
                    htp.p( '&nbsp;' );
                  end if ;  
           htp.p(  '</td>' );
         end loop;         
        htp.p('</tr>');
    end if;
    end 
    if; 
  END; 

  FUNCTION GET_TR_XL_VALUE 
  (p_beerkezes_id NUMBER
  ,p_list_type_id NUMBER
  ,p_param_type_id NUMBER
  ,p_column_param_type_id NUMBER 
  ,p_order_no number
  ,p_tr_xl_id OUT NUMBER
  )
  RETURN VARCHAR2
AS
v_rec_no INTEGER;
v_tr_xl_row tr_xl%rowtype;
v_col_dm_xl_row dm_xl%rowtype;
BEGIN
--  htp.p('p_beerkezes_id'||p_beerkezes_id);
--  htp.p(':p_list_type_id'||p_list_type_id);
--  htp.p(':p_param_type_id'||p_param_type_id);
--  htp.p(':p_column_param_type_id'||p_column_param_type_id);
--  htp.p(':p_order_no'||p_order_no);

  if p_list_type_id = 100130 then --ha fej típusú a tábla
    return 'p_param_type_id:'||p_param_type_id||'<br> p_column_param_type_id:'||p_column_param_type_id||'<br> p_order_no:' || p_order_no;
  else
SELECT COUNT(1)
  INTO v_rec_no
  FROM tr_xl
  WHERE data_inco_id = p_beerkezes_id
    AND list_type_id = p_list_type_id
    AND param_type_id = p_param_type_id
    AND COLUMN_DATA_TYPE_ID = p_column_param_type_id
    AND ORDER_NO = p_order_no
    AND status_id != 919;
--    htp.p(':v_rec_no'||v_rec_no||'<br>');

    IF v_rec_no = 0 THEN     
    p_tr_xl_id := 0;
    RETURN '';
  ELSIF v_rec_no = 1 THEN
SELECT *
  INTO v_tr_xl_row
  FROM tr_xl
  WHERE data_inco_id = p_beerkezes_id
    AND list_type_id = p_list_type_id
    AND param_type_id = p_param_type_id
    AND COLUMN_DATA_TYPE_ID = p_column_param_type_id
    AND ORDER_NO = p_order_no
    AND status_id != 919;
SELECT *
  INTO v_col_dm_xl_row
  FROM dm_xl
  WHERE DM_XL_ID = v_tr_xl_row.COL_DM_XL_ID;
    --if v_tr_xl_row.param_value is not null then
    if v_col_dm_xl_row.param_data_type = 'N' then
      p_tr_xl_id := v_tr_xl_row.tr_xl_id;
      begin
      
         RETURN to_char(to_number(replace(v_tr_xl_row.param_value,',','.')),'999G999G990', 'nls_numeric_characters='', ''');
      EXCEPTION WHEN OTHERS THEN
       RETURN 'N/A';
      END;
    else
      p_tr_xl_id := v_tr_xl_row.tr_xl_id;
      RETURN v_tr_xl_row.param_value_chr;
    end if;
  ELSE
    RETURN  'HIBA';
 END IF;
  end if;
END;



FUNCTION GET_TR_XL_CELL_SUM(
      p_column_type_id NUMBER
     ,p_param_type_id  NUMBER
     ,p_col            NUMBER
     ,p_treatm_id      NUMBER
     ,p_lista_id       NUMBER
    )  RETURN NUMBER
AS 
    v_retval number := 0;
    v_sum number := 0;
    v_order_no number := 0;
    v_val number;
    v_must_add boolean;
    
    CURSOR tr_xl_rows is
SELECT *
  FROM TR_XL
  WHERE DATA_INCO_ID = p_treatm_id
    AND LIST_TYPE_ID = p_lista_id
    AND COLUMN_DATA_TYPE_ID = p_column_type_id
    AND STATUS_ID != 919;
      
    BEGIN
       FOR tr_xl_row in tr_xl_rows
        loop
          v_must_add := true;
          begin
SELECT TR_XL.PARAM_VALUE
  INTO v_val
  FROM TR_XL
  WHERE DATA_INCO_ID = p_treatm_id
    AND LIST_TYPE_ID = p_lista_id
    AND ORDER_NO = tr_xl_row.ORDER_NO
    AND COLUMN_DATA_TYPE_ID = (SELECT param_type_id
        FROM DM_XL
        WHERE DM_XL_ID = p_col)
    AND STATUS_ID != 919;
    
            if v_val != p_param_type_id then
              v_must_add := false;
            end if;
          
            if v_must_add  then 
              v_retval := v_retval + nvl(tr_xl_row.param_value,0);
           end if;
 
            exception when others then
              null;
           end;
      
        end loop;
      return v_retval;
 
  end;



   FUNCTION get_tr_xl_cell_sum(
     p_column_type_id NUMBER
    ,p_param_type_id NUMBER
    ,p_cols          ColTyps
    ,p_treatm_id     NUMBER
    ,p_lista_id      NUMBER) 
    RETURN NUMBER
    AS
    v_retval number := 0;
    v_sum number := 0;
    v_order_no number := 0;
    v_val number;
    v_must_add boolean;
    
    CURSOR tr_xl_rows is
SELECT *
  FROM TR_XL
  WHERE DATA_INCO_ID = p_treatm_id
    AND LIST_TYPE_ID = p_lista_id
    AND COLUMN_DATA_TYPE_ID = p_column_type_id
    AND STATUS_ID != 919;
      
    BEGIN
       FOR tr_xl_row in tr_xl_rows
        loop
          v_must_add := true;
          FOR i IN 1 .. p_cols.COUNT
          LOOP
SELECT TR_XL.PARAM_VALUE
  INTO v_val
  FROM TR_XL
  WHERE DATA_INCO_ID = p_treatm_id
    AND LIST_TYPE_ID = p_lista_id
    AND ORDER_NO = tr_xl_row.ORDER_NO
    AND COLUMN_DATA_TYPE_ID = p_cols(i).column_type_id;
 
            if v_val != p_cols(i).column_value then
              v_must_add := false;
            end if;
          END LOOP;
           
            if v_must_add  then 
              v_retval := v_retval + nvl(tr_xl_row.param_value,0);
           end if;
        
        end loop;
      return v_retval;
  end;

   PROCEDURE INSERT_EMPTY_LINE(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_doc_id NUMBER) 
  AS
    cursor oszlopok is
SELECT *
  FROM dm_xl
  WHERE DM_XL.LIST_TYPE_ID = NVL(p_lista_id, GET_DOC_DEFAULT_LIST(p_doc_id))
    AND DM_XL.REL_TYPE_ID = 42
  ORDER BY order_no;

    v_sorok NUMBER;
    v_new_tr_xl_id NUMBER;
    v_sor_dm_xl_id NUMBER;
  BEGIN
--      htp.p('****'||p_lista_id||'****'||p_treatm_id);
SELECT NVL(MAX(ORDER_NO), 0) + 1
  INTO v_sorok
  FROM tr_xl
  WHERE LIST_TYPE_ID = GET_DOC_DEFAULT_LIST(p_doc_id)
    AND DATA_INCO_ID = p_treatm_id;
      
   BEGIN
SELECT dm_xl_id
  INTO v_sor_dm_xl_id
  FROM dm_xl
  WHERE LIST_TYPE_ID = NVL(p_lista_id, GET_DOC_DEFAULT_LIST(p_doc_id))
    AND REL_TYPE_ID = 49
    AND ORDER_NO = '1..x';
EXCEPTION
WHEN TOO_MANY_ROWS THEN       RAISE_APPLICATION_ERROR (-20001,'A DM_XL-ben túl sok tételsor van megadva');
      WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR (-20001,'A DM_XL-ben nincs tételsor megadva');
    END;
    htp.p('<tr>');
 
    htp.p('<td style="width:40px;">'|| v_sorok || '</td>');
    for oszlop in oszlopok
    loop     
       if oszlop.order_reg is null then
INSERT INTO TR_XL (
  COLUMN_DATA_TYPE_ID, data_inco_id, order_no, param_type_id, LIST_TYPE_ID, COLUMN_NO, COL_DM_XL_ID, ROW_DM_XL_ID
)
VALUES (oszlop.param_type_id, p_treatm_id, v_sorok, 60505, NVL(p_lista_id, GET_DOC_DEFAULT_LIST(p_doc_id)), oszlop.order_no, oszlop.DM_XL_ID, v_sor_dm_xl_id) RETURNING tr_xl_id INTO v_new_tr_xl_id;
          htp.p(  '<td><input type="text" onchange="set_tr_xl(this,'||to_char(v_new_tr_xl_id)||')"  onkeydown="showKeyCode(event);"
                   size = "9" style = "text-align:right;"  class = "field" value=""></td>');
 
      else
         htp.p('<td>brutty</td>');
      end if;
 
    end loop;
    htp.p('</tr>');
  END;
    

    FUNCTION is_sum_column(
     p_column_dm_xl_id NUMBER
    ,p_param_type_id  NUMBER
    ,p_treatm_id      NUMBER
    ,p_lista_id       NUMBER
    ) return BOOLEAN
    as
    v_retval boolean := false;
    v_cnt number;
    begin

SELECT COUNT(1)
  INTO v_cnt
  FROM v_dm_xl_rel
  --where  dm_xl_id2 = 60505
  WHERE dm_xl_id1 = p_column_dm_xl_id
    AND list_type_id1 = p_lista_id
    AND rel_type_id = 96;
      
      if v_cnt > 0 then
        return true;
      else
        return false;
      end if;
   end;

FUNCTION has_sum_column(
     p_lista_id      NUMBER
    ) return BOOLEAN
      as
v_retval boolean := false;
    v_cnt number;
    begin
SELECT COUNT(1)
  INTO v_cnt
  FROM v_dm_xl_rel
  WHERE list_type_id1 = p_lista_id
    AND rel_type_id = 96
    AND ORDER_NO2 = '1..x';
      if v_cnt > 0 then
        return true;
      else
        return false;
      end if;
   end;
 
PROCEDURE GET_SUBJ_PARAM_EDITOR( p_subj_id NUMBER, 
                                 p_subj_type_id NUMBER) AS
      CURSOR params is
SELECT DISTINCT *
  FROM (SELECT DIMENSION_ALLOWED,
               VALUE_GROUP_ID,
               DIMENSION_GROUP_ID,
               MANDATORY,
               ORDER_NO,
               SUBJ_PARAM_TYPE_ID,
               SUBJ_TYPE_ID,
               LOOKUP_SUPER_TYPE_NAME(SUBJ_PARAM_TYPE_ID) SUBJ_PARAM,
               (SELECT GROUP_ID
                   FROM DM_SUPER_TYP
                   WHERE SUPER_TYP_ID = SUBJ_TYPE_ID) GROUP_ID
      FROM dm_subject) START WITH subj_type_id = p_subj_type_id
CONNECT BY PRIOR GROUP_ID = subj_type_id
  ORDER BY ORDER_NO;
      cursor options(p_group_id number) is
SELECT SUPER_TYP_ID,
       SUPER_TYPE_NAME
  FROM DM_SUPER_TYP
  WHERE GROUP_ID = p_group_id;

      v_value VARCHAR(255);
      v_value_type_id NUMBER (12,0);
      v_subj_param_id NUMBER (12,0);
      v_unit_type_id NUMBER (12,0);

      BEGIN
        htp.p('<div id="tableContainer" class="tableContainer">');
        IF V('APP_USER') = 'FPARDI' then
           htp.p( 'subj_id ='||p_subj_id|| ' subj_type_id ='||p_subj_type_id );
        END IF;
        htp.p( '<table id="ParameterTable" class="responstable" > ' );
 
        htp.p( '<thead class="fixedHeader">' );
        htp.p('<tr>');
        htp.p('<th>');
        htp.p('&nbsp;');
htp.p('</th>');
        htp.p('<th>');
htp.p('Érték');
htp.p('</th>');
        htp.p('<th>');
htp.p('Mértékegység');
htp.p('</th>');
        htp.p('<tr>');
        htp.p('</thead>');
        htp.p('<tbody>');
        for param in params 
          loop
            if param.ORDER_NO IS NOT NULL AND param.ORDER_NO > 0 then
                BEGIN
SELECT value,
       VALUE_TYPE_ID,
       SUBJ_PARAM_ID,
       UNIT_TYPE_ID
  INTO v_value,
       v_value_type_id,
       v_subj_param_id,
       v_unit_type_id
  FROM SUBJ_PARAM
  WHERE SUBJ_ID = p_subj_id
    AND PARAM_TYPE_ID = param.SUBJ_PARAM_TYPE_ID;
EXCEPTION
WHEN OTHERS THEN                  v_value := '';
                  v_value_type_id := null;
                  v_subj_param_id := null;

                END;
 
                htp.p('<td class="rowHead">');
                htp.p('<input class="mandantory" type="hidden" value="'|| param.MANDATORY ||'">');              
                htp.p('<input class="paramType" type="hidden" value="'|| param.SUBJ_PARAM_TYPE_ID ||'">');
                htp.p('<input class="paramId" type="hidden" value="'|| v_subj_param_id ||'">');
 
                if  param.MANDATORY > 0 then
                   htp.p('<strong>');
                   htp.p(param.SUBJ_PARAM);
                   htp.p('</strong>');
                else
                   htp.p(param.SUBJ_PARAM);
                end if;
             
                htp.p('</td>');
                htp.p('<td  class = "value">');
                   if param.VALUE_GROUP_ID is not null then
                      htp.p('<select onchange="dirty(this)">');
                      for o in options(param.SUBJ_PARAM_TYPE_ID) 
                        loop
                          if o.super_typ_id = v_value_type_id then
                             htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                          else
                             htp.p('<option value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                             
                          end if;
                        end loop;
 
                      htp.p('</select>');
 
                   else
                      htp.p('<input  onchange="dirty(this)" type="text" value="'|| v_value ||'">');
 
                   end if;
        
                htp.p('</td>');
                htp.p('<td class="dimension">');
                   if param.DIMENSION_ALLOWED is not null and param.DIMENSION_ALLOWED>0 then
                     if param.DIMENSION_GROUP_ID is not null then
                         htp.p('<select onchange="dirty(this)">');
                      for o in options(param.DIMENSION_GROUP_ID) 
                        loop
                          if o.super_typ_id = v_unit_type_id then
                             htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                          else
                             htp.p('<option value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                             
                          end if;
                        end loop;
 
                      htp.p('</select>');
                        
                      else
                        htp.p('<input type="text">');
                      end if;
                   end if;
                htp.p('</td>');
                htp.p('</tr>');
            end if;
          end loop;
        htp.p('</tbody>');
        htp.p('</table>');
        htp.p('</div>');
      END;

PROCEDURE GET_TREATM_PARAM_EDITOR(   p_treatm_id          NUMBER, 
                                     p_treatm_group_id    NUMBER,
                                     p_treatm_category_id NUMBER,
                                     p_treatm_type_id     NUMBER ) 
AS
CURSOR params is
SELECT       
  *
FROM table(DM_TREATM_tapi.get_all(p_treatm_id))
ORDER  BY ORDER_NO;


   v_value varchar(255);
   v_unit_type_id NUMBER (12,0);
   v_treatm_param_row TREATM_PARAM%ROWTYPE;
   v_megn varchar(255);
   v_cnt number;

cursor eparams(c_param_type_id number, c_treatm_id number) is
     select *  FROM TREATM_PARAM WHERE PARAM_TYPE_ID = c_param_type_id AND TREATM_ID = c_treatm_id;

--cursor eparams(c_param_type_id number, c_treatm_id number) is
--     select *  FROM table(DM_TREATM_tapi.get_all(c_treatm_id)) WHERE PARAM_TYPE_ID = c_param_type_id;

   
BEGIN
   htp.p('<div id="tableContainer" class="tableContainer">');
        IF V('APP_USER') = 'FPARDI' then
           htp.p( 'treatm_id ='||p_treatm_id);
           htp.p( 'treatm_group_id ='||p_treatm_group_id);
           htp.p( 'treatm_category_id ='||p_treatm_category_id);
           htp.p( 'treatm_type_id ='||p_treatm_type_id);
           
        END IF;
        htp.p( '<table id="ParameterTable" class="responstable"> ' );
 
        htp.p( '<thead class="fixedHeader">' );
        htp.p('<tr>');
        htp.p('<th>');
        htp.p('&nbsp;');
        htp.p('</th>');
        htp.p('<th>');
        htp.p('&nbsp;');
        htp.p('</th>');
        htp.p('<th>');
        htp.p('Érték');
        htp.p('</th>');
        htp.p('<th>');
        htp.p('Mértékegység');
        htp.p('</th>');
        htp.p('<th>');
        htp.p('Alany típus');
        htp.p('</th>');
        if p_treatm_group_id != 1601 then
           htp.p('<th>');
           htp.p('Alany');
           htp.p('</th>');
        end if;
        htp.p('</tr>');
        htp.p('</thead>');
        htp.p('<tbody>');
        for param in params loop
           begin 
            IF param.PARAM_VISIBLE = 0 THEN
              CONTINUE;
            END IF;
            select * INTO v_treatm_param_row FROM TREATM_PARAM WHERE PARAM_TYPE_ID = param.TREATM_PARAM_TYPE_ID AND TREATM_ID = p_treatm_id;
            GET_PARAM_EDITOR_ROW(v_treatm_param_row,param);
           EXCEPTION WHEN  TOO_MANY_ROWS THEN
            FOR eparam IN eparams(param.TREATM_PARAM_TYPE_ID,p_treatm_id) LOOP
                    GET_PARAM_EDITOR_ROW(eparam,param);
            END LOOP;
           WHEN NO_DATA_FOUND then
               GET_PARAM_EDITOR_ROW(null,param);
           end;
           
        end loop;        
        htp.p('</tbody>');
        htp.p('</table>');
END;

--PROCEDURE GET_PARAM_EDITOR_ROW(p_treatm_param_row TREATM_PARAM%ROWTYPE,p_dm_treatm_row DM_TREATM%ROWTYPE)
PROCEDURE GET_PARAM_EDITOR_ROW(p_treatm_param_row TREATM_PARAM%ROWTYPE,p_dm_treatm_row DM_TREATM_tapi.DM_TREATM_rec)

  as

  cursor options(p_group_id number) is
SELECT SUPER_TYP_ID,
       SUPER_TYPE_NAME
  FROM DM_SUPER_TYP
  WHERE GROUP_ID = p_group_id;

cursor normak(c_treatm_group_id number) is
 select treatm_id, 
        treatm_name
 from TREATM
  where TREATM_GROUP_ID = c_treatm_group_id;

cursor alanyok(p_type_id number) is
 SELECT * FROM V_SUBJ_SUBJ_TYPE where SUBJ_TYPE_ID = p_type_id;

 

  v_megn varchar (255);
  v_treatm_param varchar (255);
  v_value varchar(255);
  v_unit_type_id NUMBER (12,0);
  v_treatm_group_id NUMBER (12,0);



BEGIN
  v_treatm_param := LOOKUP_SUPER_TYPE_NAME(p_dm_treatm_row.TREATM_PARAM_TYPE_ID);
  select treatm_group_id into v_treatm_group_id from treatm where treatm_id = p_dm_treatm_row.treatm_id;
  htp.p('<tr>');          
               htp.p('<td>'); 
               IF p_dm_treatm_row.MULTIPLY = 1 THEN
                  htp.p('<a href="javascript:apex.submit(''CREATE'');" class="uIconButton" id="B2196623091516767" title="Create" role="button">+</a>');
               ELSE
                  htp.p('&nbsp;');
               END IF;
              htp.p('</td>');
             htp.p('<td class="rowHead">');
                htp.p('<input class="mandantory" type="hidden" value="'|| p_dm_treatm_row.MANDATORY ||'">');                
                htp.p('<input class="paramType" type="hidden" value="'|| p_dm_treatm_row.TREATM_PARAM_TYPE_ID ||'">');
                htp.p('<input class="paramId" type="hidden" value="'|| p_treatm_param_row.treatm_param_id ||'">');
                IF V('APP_USER') = 'FPARDI' then
                    v_megn := v_treatm_param||'('||p_treatm_param_row.treatm_param_id|| ' - '|| p_dm_treatm_row.TREATM_PARAM_TYPE_ID ||')';
                ELSE
                    v_megn := v_treatm_param;
                END IF;

                if  p_dm_treatm_row.MANDATORY > 0 then
                   htp.p('<strong>');
                   htp.p(v_megn);
                   htp.p('</strong>');
                else
                   htp.p(v_megn);
                end if;          
                htp.p('</td>');
          
                htp.p('<td  class = "value">');
                  if p_dm_treatm_row.VALUE_ALLOWED != 0 then
                     if p_dm_treatm_row.VALUE_TYPE = 'SELECT' then
                        htp.p('<select onchange="dirty(this)">');
                        htp.p('<option value="">- Válasszon -</option>'); 
                        if p_dm_treatm_row.VALUE_GROUP_TABLE = 'DM_SUPER_TYP' then
                          for o in options(p_dm_treatm_row.TREATM_PARAM_TYPE_ID) 
                            loop
                              if  o.super_typ_id = p_treatm_param_row.value_type_id then
                                 htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                              else
                                 htp.p('<option value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');                            
                              end if;
                            end loop;
                        elsif p_dm_treatm_row.VALUE_GROUP_TABLE = 'TREATM' then
                            for o in normak(1601)                               
                            loop
                               if o.treatm_id = p_treatm_param_row.value_type_id then
                                  htp.p('<option  selected="selected"  value="'|| o.treatm_id || '">'|| o.treatm_name ||'</option>'); 
                               else
                                  htp.p('<option  value="'|| o.treatm_id || '">'|| o.treatm_name ||'</option>'); 
                               end if;  
                            end loop;
                       elsif p_dm_treatm_row.VALUE_GROUP_TABLE = 'DOC' then
                            for o in normak(1606)                               
                            loop
                               if o.treatm_id = p_treatm_param_row.value_type_id then
                                  htp.p('<option  selected="selected"  value="'|| o.treatm_id || '">'|| o.treatm_name ||'</option>'); 
                               else
                                  htp.p('<option  value="'|| o.treatm_id || '">'|| o.treatm_name ||'</option>'); 
                               end if;  
                            end loop;

                        end if;
                        htp.p('</select>');
                     elsif p_dm_treatm_row.VALUE_TYPE = 'TEXT' then
                        htp.p('<input  onchange="dirty(this)" type="text" value="'|| p_treatm_param_row.value ||'">');
                     elsif p_dm_treatm_row.VALUE_TYPE = 'DATE' then
                        --htp.p('<input  onchange="dirty(this)" type="text" value="'|| v_value ||'">');
                        htp.p('<input type="text" class="datetimePicker" onchange="dirty(this)"  maxlength="4000" size="30" value="'||p_treatm_param_row.value||'" autocomplete="off">');
                        htp.p('<img class="ui-datepicker-trigger" src="/i/asfdcldr.gif" alt="Popup Calendar: From Date" title="Popup Calendar: From Date">');
                       
                     else
                        htp.p('<input  onchange="dirty(this)" type="text" value="'|| v_value ||'">');
                     end if; 
                end if;         
                htp.p('</td>');
                htp.p('<td class="dimension">');
                   if p_dm_treatm_row.DIMENSION_ALLOWED is not null and p_dm_treatm_row.DIMENSION_ALLOWED>0 then
                     if p_dm_treatm_row.DIMENSION_GROUP_ID is not null then
                         htp.p('<select onchange="dirty(this)">');
                      for o in options(p_dm_treatm_row.DIMENSION_GROUP_ID) 
                        loop
                          if o.super_typ_id = v_unit_type_id then
                             htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                          else
                             htp.p('<option value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                             
                          end if;
                        end loop;
 
                      htp.p('</select>');
                        
                      else
                        htp.p('<input type="text">');
                      end if;
                   end if;
                htp.p('</td>');
                
                if p_dm_treatm_row.subj_group_id is not null then
                 
                  htp.p('<td class = "alany">');
                    htp.p('<select id="p'||p_dm_treatm_row.subj_group_id ||'" onchange="SubjList(this,''k'||p_dm_treatm_row.subj_group_id ||''')">');
                      htp.p('<option value="">- Válasszon -</option>');     
                      for o in options(p_dm_treatm_row.subj_group_id) 
                        loop
                          if o.super_typ_id = p_treatm_param_row.SUBJ_TYPE_ID then
                             htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');
                          else
                             htp.p('<option value="'|| o.super_typ_id || '">'|| o.super_type_name ||'</option>');                            
                          end if;
                        end loop;
                      htp.p('</select>');
                   htp.p('</td>');
                  if v_treatm_group_id != 1601 then
                      htp.p('<td class="konkretAlany">');
                      htp.p('<select  id="k'||p_dm_treatm_row.subj_group_id ||'"  onchange="dirty(this)">');
                      htp.p('<option value="">- Válasszon -</option>'); 
                       for alany in alanyok(p_treatm_param_row.SUBJ_TYPE_ID)
                          loop
                            if alany.subj_id = p_treatm_param_row.SUBJ_ID then
                                 htp.p('<option selected="selected" value="'|| alany.subj_id || '">'|| alany.subj_name ||'</option>');
                              else
                                 htp.p('<option value="'|| alany.subj_id || '">'|| alany.subj_name ||'</option>');                            
                              end if;
                          end loop;
                      htp.p('</td>');
                  end if;
                end if;
              htp.p('</tr>');
end;

PROCEDURE GET_SUBJ_LIST (p_subj_type_id NUMBER)
  AS
  cursor alanyok is
   SELECT * FROM V_SUBJ_SUBJ_TYPE vsst WHERE vsst.SUBJ_TYPE_ID = p_subj_type_id;
  BEGIN
    htp.p('<option> -Válasszon-</option>');
    for alany in alanyok 
      loop
         htp.p('<option value='||alany.subj_id||'>'|| alany.subj_name ||'</option>');
      end loop;
    
  END;



PROCEDURE GET_TREATM_VIEWER (p_treatm_id NUMBER)
    AS
    cursor treatments is 
      SELECT * from VD_TREATM where TREATM_ID = p_treatm_id;
BEGIN 
    NULL;
END;
    
PROCEDURE GET_DM_XL_EDITOR  (p_doc_id NUMBER,p_list_id NUMBER,p_rel_id NUMBER)
  AS
     cursor dm_xl_rows(c_rel_id number) is
      SELECT * from vd_dm_xl where REL_TYPE_ID = c_rel_id;



     cursor super_type_rows(c_group_id number) is
      SELECT * from DM_SUPER_TYP WHERE GROUP_ID = c_group_id;

     cursor dm_xl_rel_rows(c_result_id number, c_rel_type_id number) is
      SELECT * FROM DM_XL_REL where REL_TYPE_ID = c_rel_type_id and DM_XL_ID3 = c_result_id;

     cursor lists(c_treatm_id number, c_list_type_id number, c_rel_type_id number) is
      SELECT 
        LOOKUP_TREATM_NAME(treatm_id)||'-'||LOOKUP_LIST_NAME(LIST_TYPE_ID)||'-'||LOOKUP_SUPER_TYPE_NAME(PARAM_TYPE_ID) DISPLAY,
        PARAM_TYPE_ID
        FROM DM_XL WHERE TREATM_ID = c_treatm_id AND LIST_TYPE_ID = c_list_type_id and REL_TYPE_ID = c_rel_type_id;
      

l_row_param_group number (12,0);
l_col_param_group number (12,0);

  BEGIN
    delete from wk_pf_audit_table;
    insert into wk_pf_audit_table values('p_doc_id',p_doc_id,sysdate);
    insert into wk_pf_audit_table values('p_list_id',p_list_id,sysdate);
    insert into wk_pf_audit_table values('p_rel_id',p_rel_id,sysdate);

    begin 
      select VALUE_TYPE_ID into l_col_param_group from TREATM_PARAM where TREATM_ID = p_doc_id and PARAM_TYPE_ID = 1308594878;
    exception when others then
      l_col_param_group := 2200;
    end;
    begin
      select VALUE_TYPE_ID into l_row_param_group from TREATM_PARAM where TREATM_ID = p_doc_id and PARAM_TYPE_ID = 1308594877;
    exception when others then
      l_row_param_group := 2200;
    end;

    HTP.P('<table id="DmXlTable" width=1900px  class="responstable" >');
    HTP.P('<tr>');
    HTP.P('<th width = 35px>&nbsp;</th>');
    HTP.P('<th width = 130px>&nbsp;</th>');
    HTP.P('<th width = 130px>PARAM_TYPE_ID</th>');
    HTP.P('<th width = 170px>PARAM_UNIT_ID</th>');
    HTP.P('<th width = 170px>ORDER_NO</th>');
    HTP.P('<th width = 170px>ORDER_SIGN</th>');
    HTP.P('<th width = 170px>ORDER_REG</th>');
    HTP.P('<th width = 170px>PRINT_TYPE</th>');
    HTP.P('<th width = 170px>FROM_DATE</th>');
    HTP.P('<th width = 170px>TO_DATE</th>');
    HTP.P('<th width = 170px>DESCRIPTION</th>');
    HTP.P('</tr>');
 
    IF p_rel_id IS null OR p_rel_id = 42 THEN
        
        HTP.P('<tr>');
        HTP.P('<th width = 35>');

        IF p_rel_id IS NOT NULL THEN
          HTP.P('<img onclick="javascript:InsertLine()" src="'||v('WORKSPACE_IMAGES')||'key_plus.png">');
        ELSE
          HTP.P('&nbsp;');
        END IF;

        HTP.P('</th>');
        HTP.P('<th colspan =9>'||LOOKUP_SUPER_TYPE_NAME(42)||'</th>');
        HTP.P('<th>&nbsp;</th>');
        HTP.P('</tr>');
        FOR dm_xl_row IN dm_xl_rows(42) LOOP
          HTP.P('<tr  class="editable">');
          HTP.P('<td  class="dmXlId" >');
		      htp.p('<input type="hidden" value="'|| dm_xl_row.DM_XL_ID ||'">');  
              IF has_calc_column_rule( dm_xl_row.dm_xl_id ) != 0 THEN
                  HTP.P('<span onclick="hideOrShow(this); return false"> > </span');
              ELSE
                  HTP.P('&nbsp;');
              END IF;    
		      HTP.P('</td>');
          HTP.P('<td calass = "paramTypeID">');
          HTP.P('<SELECT>');
          HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
          FOR super_type_row IN super_type_rows(l_col_param_group) LOOP
            HTP.P('<OPTION value ="'|| super_type_row.super_typ_id ||'" ');
			if  super_type_row.super_typ_id = dm_xl_row.param_type_id then
			  HTP.P('selected '); 
			end if;
			HTP.P('    >'|| super_type_row.super_type_name  ||'</OPTION>');
          END LOOP;
          HTP.P('</SELECT>');
          HTP.P('</td>');
          HTP.P('<td class="unitTypeId">');         
          HTP.P('<SELECT>');
         HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
          FOR super_type_row IN super_type_rows(20000) LOOP
            HTP.P('<OPTION value ="'|| super_type_row.super_typ_id ||'" ');
			if  super_type_row.super_typ_id = dm_xl_row.param_unit_id then
			  HTP.P('selected ');
			end if;
			HTP.P('    >'|| super_type_row.super_type_name  ||'</OPTION>');          
		  END LOOP;
          HTP.P('</SELECT>');
          HTP.P('</td>');
 --         HTP.P('<td><input type="text" value="'||dm_xl_row.PARAM_UNIT_ID||'" ></td>');
          HTP.P('<td class = "orderNo"><input type="text" value="'||dm_xl_row.ORDER_NO||'" ></td>');
          HTP.P('<td class = "orderSign"><input type="text" value="'||dm_xl_row.ORDER_SIGN||'" ></td>');
          HTP.P('<td class = "orderReg"><input type="text" value="'||dm_xl_row.ORDER_REG||'" ></td>');
          HTP.P('<td class = "printType"><input type="text" value="'||dm_xl_row.PRINT_TYPE||'" ></td>');
          HTP.P('<td class = "description"><input type="text" class="datePicker" value="'||TO_CHAR(dm_xl_row.FROM_DATE,'YYYY.MM.DD')||'" ></td>');
          HTP.P('<td class = "fromDate"><input type="text" class="datePicker" value="'||TO_CHAR(dm_xl_row.TO_DATE,'YYYY.MM.DD')||'" ></td>');
          HTP.P('<td class = "toDate"><input type="text" value="'||dm_xl_row.DESCRIPTION||'" ></td>');
          HTP.P('</tr>');
          IF has_calc_column_rule( dm_xl_row.dm_xl_id ) != 0 THEN
            HTP.P('<tr><td>&nbsp;</td><td colspan=9>');
            HTP.P('<table width=800px>');
            HTP.P('<tr>');
            HTP.P('<td width=260px>Operandus 1</td>');
            HTP.P('<td width=260px>Opearndus 2</td>');
            HTP.P('<td width=60px>Opearátor</td>');
            HTP.P('<td>Sorrend</td>');
            HTP.P('</tr>');
            
            for rel_rows in dm_xl_rel_rows(dm_xl_row.DM_XL_ID,46)
            loop
              HTP.P('<tr>');
              HTP.P('<td>');
              HTP.P('<SELECT>');
              HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
              FOR lista IN lists(p_doc_id,p_list_id,42) LOOP
                 HTP.P('<OPTION value ="'|| lista.PARAM_TYPE_ID  ||'" ');
			           if  lista.PARAM_TYPE_ID = rel_rows.DM_XL_ID1 then
			             HTP.P('selected '); 
			           end if;
			           HTP.P('    >'|| lista.DISPLAY  ||'</OPTION>');
              END LOOP;
              HTP.P('</SELECT>');
              HTP.P('</td>');
              HTP.P('<td>');
              HTP.P('<SELECT>');
              HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
              FOR lista IN lists(p_doc_id,p_list_id,42) LOOP
                 HTP.P('<OPTION value ="'|| lista.PARAM_TYPE_ID  ||'" ');
			           if  lista.PARAM_TYPE_ID = rel_rows.DM_XL_ID2 then
			             HTP.P('selected '); 
			           end if;
			           HTP.P('    >'|| lista.DISPLAY  ||'</OPTION>');
              END LOOP;
              HTP.P('</SELECT>');
              HTP.P('</td>');
              HTP.P('<td>'||rel_rows.MATHOP||'</td>');
              HTP.P('<td>'||rel_rows.ORDER_NO||'</td>');
              HTP.P('</tr>');
            
            end loop;
            HTP.P('</table>');
          
          END IF;
          
        END LOOP;
    END IF;


    IF p_rel_id IS null OR p_rel_id = 43 THEN
      HTP.P('<tr>');
      HTP.P('<th >');
	   IF p_rel_id IS NOT NULL THEN
          HTP.P('<img onclick="javascript:InsertLine()" src="'||v('WORKSPACE_IMAGES')||'Add Green Button.png">');
        ELSE
          HTP.P('&nbsp;');
        END IF;
	  HTP.P('</th>');
      HTP.P('<th colspan =8>'||LOOKUP_SUPER_TYPE_NAME(43)||'</th>');
      HTP.P('<th>&nbsp;</th>');
      HTP.P('</tr>');
        FOR dm_xl_row IN dm_xl_rows(43) LOOP
          HTP.P('<tr class="editable">');
          HTP.P('<td class="dmXlId">');
		   htp.p('<input type="hidden" value="'|| dm_xl_row.DM_XL_ID ||'">');      
		  HTP.P('</td>');
           HTP.P('<td calass = "paramTypeID">');
          HTP.P('<SELECT>');
          HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
          FOR super_type_row IN super_type_rows(l_row_param_group) LOOP
            HTP.P('<OPTION value ="'|| super_type_row.super_typ_id ||'" ');
			if  super_type_row.super_typ_id = dm_xl_row.param_type_id then
			  HTP.P('selected ');
			end if;
			HTP.P('    >'|| super_type_row.super_type_name  ||'</OPTION>');
          END LOOP;
          HTP.P('</SELECT>');
          HTP.P('</td>');
          HTP.P('<td  class="unitTypeId">');
          HTP.P('<SELECT>');
          HTP.P('<OPTION value ="" > - Válasszon - </OPTION>');
          FOR super_type_row IN super_type_rows(20000) LOOP
            HTP.P('<OPTION value ="'|| super_type_row.super_typ_id ||'" ');
			if  super_type_row.super_typ_id = dm_xl_row.param_unit_id then
			  HTP.P('selected ');
			end if;
			HTP.P('    >'|| super_type_row.super_type_name  ||'</OPTION>');          
          END LOOP;
          HTP.P('</SELECT>');
          HTP.P('</td>');
          HTP.P('<td class = "orderNo"><input type="text" value="'||dm_xl_row.ORDER_NO||'" ></td>');
          HTP.P('<td class = "orderSign"><input type="text" value="'||dm_xl_row.ORDER_SIGN||'" ></td>');
          HTP.P('<td class = "orderReg"><input type="text" value="'||dm_xl_row.ORDER_REG||'" ></td>');
          HTP.P('<td class = "printType"><input type="text" value="'||dm_xl_row.PRINT_TYPE||'" ></td>');
          HTP.P('<td class = "description"><input type="text" class="datePicker" value="'||TO_CHAR(dm_xl_row.FROM_DATE,'YYYY.MM.DD')||'" ></td>');
          HTP.P('<td class = "fromDate"><input type="text" class="datePicker" value="'||TO_CHAR(dm_xl_row.TO_DATE,'YYYY.MM.DD')||'" ></td>');
          HTP.P('<td class = "toDate"><input type="text" value="'||dm_xl_row.DESCRIPTION||'" ></td>');
          HTP.P('</tr>');
        END LOOP;
    END IF;   
  END;
  
   PROCEDURE GET_DM_XL_PREVIEW  (p_doc_id NUMBER,p_list_id NUMBER)
   AS

      cursor dm_xl_rows is
      SELECT * from vd_dm_xl where /* treatm_id = p_doc_id  and list_type_id =p_list_id  and */  REL_TYPE_ID = 43;

       cursor dm_xl_columns is
      SELECT * from vd_dm_xl where /* treatm_id = p_doc_id  and list_type_id =p_list_id  and */ REL_TYPE_ID = 42;

    l_row_cnt NUMBER;
	l_cnt NUMBER := 0;
   BEGIN
    select count(1) into l_row_cnt from dm_xl where treatm_id = p_doc_id and list_type_id =p_list_id and REL_TYPE_ID = 43;
	HTP.P('<table id="DmXlTable">');
	HTP.P('<tr>');
	HTP.P('<th width="60px">&nbsp;</th>');
    HTP.P('<th width="200px">Megnevezés</th>');
	for column in dm_xl_columns
	  loop
	    HTP.P('<th width="200px">');
		HTP.P(column.param_type);
	    HTP.P('</th>');
		
      end loop;
      HTP.P('</tr>');
		
	  for row in dm_xl_rows
		   loop
		     l_cnt := l_cnt + 1;
			 HTP.P('<tr>');
			  HTP.P('<td>');
			   HTP.P(l_cnt);
			  HTP.P('</td>');
			  HTP.P('<td>');
			   HTP.P(row.param_type);
			  HTP.P('</td>');
			  for column in dm_xl_columns
			    loop
				 HTP.P('<td class><input type="text" value = "szöveg" disabled ></td>');
				end loop;
			 HTP.P('</tr>');
		   end loop;
	HTP.P('</table>');
   END;


PROCEDURE GET_DM_TREATM_EDITOR(p_treatm_id number)
AS

 cursor dm_treatm_rows is
 SELECT      
  *
FROM table(DM_TREATM_tapi.get_all(p_treatm_id))
ORDER  BY ORDER_NO;

cursor select_list_values(c_group_id number) is
 select super_type_name, super_typ_id 
 from dm_super_typ 
 where group_id = c_group_id;

 l_treatm_name varchar2 (2000);
BEGIN
 select treatm_name into l_treatm_name from treatm where treatm_id = p_treatm_id;
 HTP.P('<TABLE id="DmTreatmTable" class="responstable" >');
 HTP.P('<TR class="mainHead">');
 HTP.P('<TH colspan = 13>');
 HTP.P(l_treatm_name);

 HTP.P('<SPAN class="right">');
 HTP.P('<button type="button"  onclick="window.location = ''f?p='||V('APP_ID')||':410:'||V('APP_SESSION')||':::'';">Vissza</button>');
 HTP.P('<button type="button"  onclick="InsertLine()">Új sor</button>');
 HTP.P('<button type="button"  onclick="saveChanges()">Mentés</button>');
 HTP.P('</SPAN>');

 HTP.P('</TH>');
 HTP.P('</TR>');

 HTP.P('<TR class="mainHead">');
 HTP.P('<TH width="300px">TREATM_PARAM_TYPE_ID</TH>');
-- HTP.P('<TH ><a title="This is some information for our tooltip." class="tooltip">PARAM_VISIBLE</a></TH>');
 HTP.P('<TH width="40px"><div data-tooltip="A paraméter látható" class="tooltip">PV</div></TH>');

 HTP.P('<TH width="70px"><div data-tooltip="Sorrend" class="tooltip">S</div></TH>');
 HTP.P('<TH width="40px"><div data-tooltip="Kötelezõ" class="tooltip">K</div></TH>');
 HTP.P('<TH width="40px"><div data-tooltip="Többszörös" class="tooltip">M</div></TH>');
 HTP.P('<TH width="40px"><div data-tooltip="Érték látható" class="tooltip">E</div></TH>');
 HTP.P('<TH>VALUE_TYPE</TH>');
 HTP.P('<TH>VALUE_GROUP_ID</TH>');
 HTP.P('<TH>VALUE_GROUP_TABLE</TH>');
 HTP.P('<TH width="40px"><div data-tooltip="Mértékegység látható" class="tooltip">D</div></TH>');
 HTP.P('<TH>DIMENSION_GROUP_ID</TH>');
 HTP.P('<TH>SUBJ_GROUP_ID</TH>');

 HTP.P('</TR>');
 for treatm_row in dm_treatm_rows loop
    HTP.P('<TR ');
    if treatm_row.treatm_id = p_treatm_id then
       HTP.P('class ="editable" ');
    else
       HTP.P('class ="fromParent" ');
    end if;
    HTP.P('id="'||treatm_row.dm_treatm_id ||'">');
    HTP.P('<TD class ="TREATM_PARAM_TYPE_ID width="300px""> ');
     SEND_SELECT_LIST(treatm_row.TREATM_PARAM_TYPE_ID,0,'DM_TREATM','TREATM_PARAM_TYPE_ID',false);
    HTP.P('</TD>');
    HTP.P('<TD class ="PARAM_VISIBLE">');
    HTP.P('<INPUT type="checkbox" '); 
    IF treatm_row.PARAM_VISIBLE = 1 then
      HTP.P(' checked');
    end if;
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD  class ="ORDER_NO">');
    HTP.P('<INPUT   width="50px" TYPE = "text" value="'|| treatm_row.ORDER_NO ||'">');
    HTP.P('</TD>');
    HTP.P('<TD class ="MANDATORY">');
    HTP.P('<INPUT type="checkbox" ');
    IF treatm_row.MANDATORY = 1 then
      HTP.P(' checked');
    end if;
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD  class ="MULTIPLY">');
    HTP.P('<INPUT type="checkbox" ');
    IF treatm_row.MULTIPLY = 1 then
      HTP.P(' checked');
    end if;
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD class ="VALUE_ALLOWED">');
    HTP.P('<INPUT type="checkbox" ');
    IF treatm_row.VALUE_ALLOWED = 1 then
      HTP.P(' checked');
    end if;
    HTP.P('>');
    HTP.P('</TD>');    
    HTP.P('<TD class ="VALUE_TYPE">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    HTP.P('<OPTION value="TEXT"');
    IF 'TEXT' = treatm_row.VALUE_TYPE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('TEXT');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="SELECT"');
    IF 'SELECT' = treatm_row.VALUE_TYPE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('SELECT');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="DATE"');
    IF 'DATE' = treatm_row.VALUE_TYPE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('DATE');
    HTP.P('</OPTION>');
    HTP.P('</SELECT>');
    HTP.P('</TD>');   
    HTP.P('<TD class ="VALUE_GROUP_ID">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(1308590030) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID||'"');
      IF o.SUPER_TYP_ID = treatm_row.VALUE_GROUP_ID then
        HTP.P(' SELECTED');
      END if;
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');

    HTP.P('</TD>');
    HTP.P('<TD class ="VALUE_GROUP_TABLE">');
   
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    HTP.P('<OPTION value="DM_SUPER_TYP"');
    IF 'DM_SUPER_TYP' = treatm_row.VALUE_GROUP_TABLE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('Törzsadat');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="TREATM"');
    IF 'TREATM' = treatm_row.VALUE_GROUP_TABLE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('Norma');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="DOC"');
    IF 'DOC' = treatm_row.VALUE_GROUP_TABLE then
      HTP.P(' SELECTED');
    END if;
    HTP.P('>');
    HTP.P('Dokumentum');
    HTP.P('</OPTION>');
    HTP.P('</SELECT>');
    
    HTP.P('</TD>');       
    HTP.P('<TD class ="DIMENSION_ALLOWED">');
    HTP.P('<INPUT type="checkbox" ');
    IF treatm_row.DIMENSION_ALLOWED = 1 then
      HTP.P(' checked');
    end if;
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD class ="DIMENSION_GROUP_ID">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(20000) loop
      HTP.P('<OPTION value="'||treatm_row.DIMENSION_GROUP_ID||'"');
      IF o.SUPER_TYP_ID = treatm_row.DIMENSION_GROUP_ID then
        HTP.P(' SELECTED');
      END if;
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');

    HTP.P('</TD>');
    HTP.P('<TD class ="SUBJ_GROUP_ID">');

    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(101) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID ||'"');
      IF o.SUPER_TYP_ID = treatm_row.SUBJ_GROUP_ID then
        HTP.P(' SELECTED');
      END if;
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');


    HTP.P('</TD>');
    HTP.P('</TR>');
 end loop;
 HTP.P('</TABLE>');
END GET_DM_TREATM_EDITOR;

PROCEDURE GET_EMPTY_DM_TREATM_ROW
as
cursor select_list_values(c_group_id number) is
 select super_type_name, super_typ_id 
 from dm_super_typ 
 where group_id = c_group_id;
begin
    HTP.P('<TR class ="editable" id="0">');
    HTP.P('<TD class ="TREATM_PARAM_TYPE_ID">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(1308590030) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID||'"');
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');
    HTP.P('</TD>');
    HTP.P('<TD class ="PARAM_VISIBLE">');
    HTP.P('<INPUT type="checkbox" '); 
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD  class ="ORDER_NO">');
    HTP.P('<INPUT TYPE = "text" value="">');
    HTP.P('</TD>');
    HTP.P('<TD class ="MANDATORY">');
    HTP.P('<INPUT type="checkbox" ');
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD  class ="MULTIPLY">');
    HTP.P('<INPUT type="checkbox" ');
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD class ="VALUE_ALLOWED">');
    HTP.P('<INPUT type="checkbox" ');
    HTP.P('>');
    HTP.P('</TD>');    
    HTP.P('<TD class ="VALUE_TYPE">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    HTP.P('<OPTION value="TEXT"');
    HTP.P('>');
    HTP.P('TEXT');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="SELECT"');
    HTP.P('>');
    HTP.P('SELECT');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="DATE"');
    HTP.P('>');
    HTP.P('DATE');
    HTP.P('</OPTION>');
    HTP.P('</SELECT>');
    HTP.P('</TD>');   
    HTP.P('<TD class ="VALUE_GROUP_ID">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(1308590030) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID||'"');
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');

    HTP.P('</TD>');
    HTP.P('<TD class ="VALUE_GROUP_TABLE">');
   
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    HTP.P('<OPTION value="DM_SUPER_TYP"');
    HTP.P('>');
    HTP.P('DM_SUPER_TYP');
    HTP.P('</OPTION>');
    HTP.P('<OPTION value="TREATM"');
    HTP.P('>');
    HTP.P('TREATM');
    HTP.P('</OPTION>');
    HTP.P('</SELECT>');
    HTP.P('</TD>');
    HTP.P('<TD class ="DIMENSION_ALLOWED">');
    HTP.P('<INPUT type="checkbox" ');
    HTP.P('>');
    HTP.P('</TD>');
    HTP.P('<TD class ="DIMENSION_GROUP_ID">');
    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(20000) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID||'"');
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');

    HTP.P('</TD>');
    HTP.P('<TD class ="SUBJ_GROUP_ID">');

    HTP.P('<SELECT>');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in select_list_values(101) loop
      HTP.P('<OPTION value="'||o.SUPER_TYP_ID ||'"');
      HTP.P('>');
      HTP.P(o.SUPER_TYPE_NAME);
      HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');
    HTP.P('</TD>');
    HTP.P('</TR>');
end;

PROCEDURE SEND_SUBJ_LIST(p_subj_type number,p_selected number) as
cursor c is 
 SELECT * FROM V_SUBJ_SUBJ_TYPE 
   where subj_type_id in
  (SELECT SUPER_TYP_ID from DM_SUPER_TYP
   START WITH SUPER_TYP_ID = p_subj_type
    CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID);
begin
  HTP.P('<SELECT >');
  HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
  for o in c loop
        HTP.P('<OPTION value="'||o.subj_id ||'"');
        if o.subj_id = p_selected then
           HTP.P(' selected ');   
        end if;     
        HTP.P('>'); 
        HTP.P(o.subj_name);
        HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');
end;

procedure GET_SUPER_TYP_POPUP as
begin
   HTP.P('<div id="popUpSuperTypDiv">');
   HTP.P('<TABLE id = "popupSuperTypTable"  class="responstable">');
   HTP.P('<TR>');
   HTP.P('<TH colspan = 13>');
   HTP.P('Szuper típus hozzáadása');
   HTP.P('<span id = "spanSuperTypClosePopup"  style="float:right" >');
   HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Cancel Red Button.png">');
   HTP.P('</span>');
   HTP.P('</TH>');
   HTP.P('</TR>');
   
   HTP.P('<TR>');
   HTP.P('<TH>');
   HTP.P('Szuper típus neve');
   HTP.P('</TH>');
   HTP.P('<TD>');
   HTP.P('<INPUT TYPE="text" id="pSuperTypeName">');
   HTP.P('</TD>');
   HTP.P('</TR>');

   HTP.P('<TR>');
   HTP.P('<TH>');
   HTP.P('Szuper típus rövid neve');
   HTP.P('</TH>');
   HTP.P('<TD>');
   HTP.P('<INPUT TYPE="text">');
   HTP.P('</TD>');
   HTP.P('</TR>');

   HTP.P('</TABLE>');
   HTP.P('</div>');
end;

procedure GET_SUBJECT_POPUP as
begin
   HTP.P('<div id="popUpSubjectDiv">');
   HTP.P('<TABLE id = "popupSubjectTable"  class="responstable">');
   HTP.P('<TR>');
   HTP.P('<TH colspan = 13>');
   HTP.P('Szuper típus hozzáadása');
   HTP.P('<span id = "spanSubjectClosePopup"  style="float:right" >');
   HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Cancel Red Button.png">');
   HTP.P('</span>');
   HTP.P('</TH>');
   HTP.P('</TR>');
   
   HTP.P('<TR>');
   HTP.P('<TH>');
   HTP.P('Alany neve');
   HTP.P('</TH>');
   HTP.P('<TD>');
   HTP.P('<INPUT TYPE="text" id="pSubjName">');
   HTP.P('</TD>');
   HTP.P('</TR>');

   HTP.P('<TR>');
   HTP.P('<TH>');
   HTP.P('Alany tulajdonsága');
   HTP.P('</TH>');
   HTP.P('<TD>');
   HTP.P('<INPUT TYPE="text">');
   HTP.P('</TD>');
   HTP.P('</TR>');

   HTP.P('</TABLE>');
   HTP.P('</div>?');
end;

PROCEDURE GET_TREATM_ROW_FORM (p_treatm_id TREATM.TREATM_ID%TYPE,
                               p_treatm_group_id TREATM.TREATM_ID%TYPE default null) AS
l_treatm_row TREATM%rowtype;
l_is_fact boolean;
BEGIN
 begin 
  select * into l_treatm_row from treatm where treatm_id = p_treatm_id;
  exception WHEN NO_DATA_FOUND THEN
    l_treatm_row.treatm_group_id := p_treatm_group_id;
 end;
 if l_treatm_row.treatm_group_id = 1604 then 
   l_is_fact := true;
 else
   l_is_fact := false;
 end if;
 GET_SUPER_TYP_POPUP();
 GET_SUBJECT_POPUP();
 
 HTP.P('<TABLE id="TreatmTable" class="responstable" >');
 HTP.P('<TR>');
 HTP.P('<TH colspan = 13>');
 HTP.P(lookup_super_type_name(l_treatm_row.treatm_group_id));
 if p_treatm_id is not null then
  HTP.P(' szerkesztése');
 else 
  HTP.P(' létrehozása');
 end if;
 HTP.P('<SPAN class="right">');
 HTP.P('<button type="button"  onclick="window.location = ''f?p='||V('APP_ID')||':301:'||V('APP_SESSION')||'''">Vissza</button>');
 if not l_is_fact  then
  HTP.P('<button type="button"  onclick="window.location = ''f?p='||V('APP_ID')||':3202:'||V('APP_SESSION')||'::::P3202_TREATM_ID:'||p_treatm_id||''';">Szabályok</button>');
 else
  HTP.P('<button type="button"  onclick="window.location = ''f?p='||V('APP_ID')||':6099:'||V('APP_SESSION')||'''">Dokumentum</button>');
  HTP.P('<button type="button"  onclick="CloseTreatm()">Lezárás</button>');
 end if;
 HTP.P('<button type="button"  onclick="SaveChanges()">Mentés</button>');
 HTP.P('</SPAN>');

 HTP.P('</TH>'); 
 HTP.P('</TR>');

 HTP.P('<TR>');
 HTP.P('<TH>');HTP.P('Treatm Id');HTP.P('</TH>');
 HTP.P('<TD>');HTP.P(p_treatm_id);HTP.P('</TD>');
 HTP.P('<TD>');HTP.P(lookup_super_type_name(l_treatm_row.treatm_group_id));HTP.P('</TD>');
 HTP.P('</TR>');

 HTP.P('<TR>');
 HTP.P('<TH>');HTP.P('Treatm name');HTP.P('</TH>');
 HTP.P('<TD id="TREATM_NAME" COLSPAN = 5>');
 HTP.P('<INPUT onchange=dirty()" TYPE = "TEXT"   value = "'||l_treatm_row.treatm_name||'">');
 HTP.P('</TD>');
 HTP.P('</TR>');

 HTP.P('<TR>');
 HTP.P('<TH>');HTP.P('Treatm Category Id');HTP.P('</TH>');
 HTP.P('<TD valign="middle" id="TREATM_CATEGORY_ID">');
 IF l_treatm_row.treatm_group_id != 1604 then
  SEND_SELECT_LIST(l_treatm_row.treatm_category_id,l_treatm_row.treatm_group_id,'TREATM','TREATM_CATEGORY_ID',l_is_fact);
  HTP.P('<span id = "spanAddCategoryId"  style="float:right" onclick="AddSuperTyp(this); return false;" >');
  HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('</span>');
 ELSE
   htp.p('<select disabled>');
   htp.p('<option value="'||l_treatm_row.treatm_category_id||'" selected>');
   htp.p(lookup_super_type_name(l_treatm_row.treatm_category_id));
   htp.p('</option>');
   htp.p('</select>');
 end if; 
 HTP.P('</TD>');
 HTP.P('<TH>');HTP.P('Treatm Type Id');HTP.P('</TH>');
 HTP.P('<TD id="TREATM_TYPE_ID">');
 IF l_treatm_row.treatm_group_id != 1604 then
   SEND_SELECT_LIST(l_treatm_row.treatm_type_id,1308590010,l_is_fact);
   HTP.P('<span id = "spanAddTypeId"  style="float:right" onclick="AddSuperTyp(this); return false;"  >');
   HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
   HTP.P('</span>');
 ELSE
   htp.p('<select disabled>');
   htp.p('<option value="'||l_treatm_row.treatm_type_id||'" selected>');
   htp.p(lookup_super_type_name(l_treatm_row.treatm_type_id));
   htp.p('</option>');
   htp.p('</select>');
 end if;
 HTP.P('</TD>');
 HTP.P('</TR>');

 HTP.P('<TR>');
 HTP.P('<TH>');HTP.P('From date');HTP.P('</TH>');
 HTP.P('<TD id="FROM_DATE">');
 HTP.P('<input onchange=dirty() type="text"  class="text_field datePicker" onchange="dirty(this)" value="'||to_char(NVL(l_treatm_row.from_date, sysdate),'YYYY.MM.DD') ||'" size="30" maxlength="4000">');
 HTP.P('</TD>');
 HTP.P('<TH>');HTP.P('To date');HTP.P('</TH>');
 HTP.P('<TD id="TO_DATE"  >');
 HTP.P('<input onchange=dirty() type="text" class="text_field datePicker" onchange="dirty(this)" value="'||to_char(NVL(l_treatm_row.to_date, to_date('2099.12.31','YYYY.MM.DD')),'YYYY.MM.DD') ||'" size="30" maxlength="4000">');
 HTP.P('</TD>');
 HTP.P('</TR>');

if l_treatm_row.treatm_group_id = 1604 then
HTP.P('<TR>');
 HTP.P('<TH>');HTP.P('Time start');HTP.P('</TH>');
 HTP.P('<TD id="TIME_START">');
 HTP.P('<input onchange=dirty() type="text"  class="text_field datePicker" onchange="dirty(this)" value="'||to_char(NVL(l_treatm_row.TIME_START, sysdate),'YYYY.MM.DD') ||'" size="30" maxlength="4000">');
 HTP.P('</TD>');
 HTP.P('<TH>');HTP.P('Time end');HTP.P('</TH>');
 HTP.P('<TD id="TIME_END"  >');
 HTP.P('<input onchange=dirty() type="text" class="text_field datePicker" onchange="dirty(this)" value="'||to_char(NVL(l_treatm_row.TIME_END, to_date('2099.12.31','YYYY.MM.DD')),'YYYY.MM.DD') ||'" size="30" maxlength="4000">');
 HTP.P('</TD>');
 HTP.P('</TR>');
end if;

  if l_treatm_row.treatm_group_id = 1604 then
     HTP.P('<TR>');
     HTP.P('<TH>');HTP.P(lookup_super_type_name(l_treatm_row.TYPE1_ID));HTP.P('</TH>');
     HTP.P('<TD id = "SUBJ1_ID">');
     SEND_SUBJ_LIST(l_treatm_row.TYPE1_ID,l_treatm_row.SUBJ1_ID );
     HTP.P('<span id = "spanAddType1Id"  style="float:right"  onclick="AddSubject(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>'); 
     HTP.P('</TD>');
     HTP.P('<TH>');HTP.P(lookup_super_type_name(l_treatm_row.TYPE2_ID));HTP.P('</TH>');
     HTP.P('<TD id = "SUBJ2_ID">');
     SEND_SUBJ_LIST(l_treatm_row.TYPE2_ID,l_treatm_row.SUBJ2_ID );
     HTP.P('<span id = "spanAddType2Id"  style="float:right"  onclick="AddSubject(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>');

     HTP.P('</TD>');
     HTP.P('</TR>');
  else
     HTP.P('<TR>');
     HTP.P('<TH>');HTP.P('Type1 Id');HTP.P('</TH>');
     HTP.P('<TD id = "TYPE1_ID">');
     SEND_SELECT_LIST(l_treatm_row.TYPE1_ID,l_treatm_row.treatm_group_id,'TREATM','TYPE1_ID',l_is_fact);
      HTP.P('<span id = "spanAddType1Id"  style="float:right"  onclick="AddSuperTyp(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>');
     HTP.P('</TD>');
     HTP.P('<TH>');HTP.P('Type2 Id');HTP.P('</TH>');
     HTP.P('<TD id = "TYPE2_ID">');
     SEND_SELECT_LIST(l_treatm_row.TYPE2_ID,l_treatm_row.treatm_group_id,'TREATM','TYPE2_ID',l_is_fact);

       HTP.P('<span id = "spanAddType2Id"  style="float:right" onclick="AddSuperTyp(this); return false; ">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png" >');
       HTP.P('</span>');
     HTP.P('</TD>');
     HTP.P('</TR>');
     HTP.P('<TR>');
     HTP.P('<TH>');HTP.P('Leírás');HTP.P('</TH>');
     HTP.P('<TD id="DESCRIPTION" colspan = 3>');
     HTP.P('<input type="text" onchange="dirty(this)" value="'||l_treatm_row.description||'" >');
      HTP.P('</TD>');

     HTP.P('</TR>');
  end if;
  HTP.P('</TABLE>');
END;


PROCEDURE SEND_SELECT_LIST(p_id number,p_group_id number, p_read_only boolean default false) AS
begin
  if p_read_only then
    HTP.P(LOOKUP_SUPER_TYPE_NAME(p_id));
  else
    GET_SELECT(p_group_id,p_id);
  end if; 
end;

 
PROCEDURE SEND_SELECT_LIST(p_id number,p_treatm_group_id number, p_table_name varchar2, p_column_name varchar2, p_read_only boolean default false) AS
  l_group_id number (12,0); 
begin
  if p_read_only then
    HTP.P(LOOKUP_SUPER_TYPE_NAME(p_id));
  else
    l_group_id := dm_domain_rule_tapi.GET_GROUP(V('DOMAIN'),p_treatm_group_id,p_table_name,p_column_name);
    GET_SELECT(l_group_id,p_id);
  end if; 
end;

PROCEDURE GET_SELECT(P_GROUP_ID NUMBER, P_ID NUMBER) AS 
cursor c is 
  select * FROM table(BASE_PKG.VALUE_LIST_DM_SUPER_TYP(p_group_id));
BEGIN
 HTP.P('<SELECT onchange =  "selectListChanged(this)" data-group ="'||P_GROUP_ID||'">');
    HTP.P('<OPTION value = "0" > - Válasszon - </OPTION>');
    for o in c loop
        HTP.P('<OPTION value="'||o.value ||'"');
        if o.value = p_id then
           HTP.P(' selected ');   
        end if;     
        HTP.P('>'); 
        HTP.P(o.display);
        HTP.P('</OPTION>');
    end loop;
    HTP.P('</SELECT>');
END;





PROCEDURE GET_TREATM_CHILDS(p_treatm_id number) AS
 cursor childs is
   select * FROM V_TREATM_CHILDS WHERE TREATM_ID2 = p_treatm_id AND rel_type_id = 39;
 cursor normas is
   select treatm_id,treatm_name FROM treatm where treatm_group_id = 1601;
begin
  HTP.P('<div id="popUpDiv">');
  HTP.P('<TABLE id = "popupTable"  class="responstable">');
  HTP.P('<TR>');
  HTP.P('<TH colspan = 13>');
  HTP.P('Beépülõ elem hozzáadása');
  HTP.P('<span id = "spanClosePopup"  style="float:right" >');
  HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Cancel Red Button.png">');
  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');
  for norma in normas loop
  HTP.P('<TR class = "trclass" data-id ="'||norma.treatm_id||'"><td class ="popTd">'||norma.treatm_name||'</td></tr>');
  end loop;

 HTP.P('</TABLE>');
 HTP.P('</div>?');

 HTP.P('<TABLE id="ChildTable" class="responstable" >');
 
 HTP.P('<TR>');
 HTP.P('<TH colspan = 13>');
 HTP.P('Beépülõ elemek');
 HTP.P('<span id = "spanAddChild"  style="float:right" >');
 HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
 HTP.P('</span>');
 HTP.P('</TH>');
 HTP.P('</TR>');

 HTP.P('<TR>');
 HTP.P('<TH>');
 HTP.P('&nbsp;');
 HTP.P('</TH>');

 HTP.P('<TH>');
 HTP.P('TREATM');
 HTP.P('</TH>');
 

 FOR child in childs LOOP
 HTP.P('<TR id = "'||child.link ||'">');


 HTP.P('<TH class = "thDelete">');
 HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Minus Red Button.png">');

   HTP.P('</TH>');
  
   HTP.P('<TD class="CHILD">');
   HTP.P('<INPUT class="CHILD_ID" TYPE="HIDDEN" VALUE="'||child.link ||'">');
   HTP.P(child.child_name);
   HTP.P('</TD>');
 HTP.P('</TR>');

 END LOOP;

 HTP.P('</TABLE>');


end;


PROCEDURE GET_DM_DOMAIN_RULE_EDITOR(p_domain number) as
BEGIN
 Null;
end;




procedure GET_MAIN_PAGE AS

cursor alerts is
  select ALERT.ALERT_ID as ALERT_ID,
    ALERT.ALERT_TYPE_ID as ALERT_TYPE_ID,
    SUBJ_ID as SUBJ_ID,
    SUBJ_TYPE_ID as SUBJ_TYPE_ID,
    GET_APEX_LINK (ALERT.ALERT_ID) as link,
    ALERT.ALERT_STATUS as ALERT_STATUS,
    ALERT.MESSAGE_ID as MESSAGE_ID,
    (select message_text from dm_message where dm_message.message_id = ALERT.MESSAGE_ID ) as message_text,
    ALERT.EPI_ID as EPI_ID,
    ALERT.U_COMMENT as U_COMMENT,
    ALERT.TO_DATE as TO_DATE,
    ALERT.PRIORITY as PRIORITY,
    ALERT.CRU as CRU,
    ALERT.CRD as CRD,
    ALERT.MDU as MDU,
    ALERT.MDD as MDD,
    ALERT.STATUS_ID as STATUS_ID,
    alert.description
 from ALERT ALERT
where 
 
 (subj_id is not null and subj_id = get_subj_id(V('APP_USER'))) or 
 (subj_id is null and   SUBJ_IS_IN_TYPE(V('APP_USER'), 1308590016) > 0)
; 


BEGIN



htp.p('<table class="responstable">');
htp.p('<tr>');

htp.p('<th>');
htp.p('Típus');
htp.p('</th>');

htp.p('<th>');
htp.p('Prioritás');
htp.p('</th>');

htp.p('<th>');
htp.p('&nbsp;');
htp.p('</th>');

htp.p('<th>');
htp.p('Megnevezés');
htp.p('</th>');

htp.p('</tr>');

for alert in alerts loop
  htp.p('<tr>');
  if alert.SUBJ_ID is not null then
    htp.p('<td>');
  else
   htp.p('<td onclick="getGroupAlert(this)">');
  end if;
   htp.p('<img src="'||V('WORKSPACE_IMAGES'));
  if alert.SUBJ_ID is not null then
    htp.p('User.png"');
  else
   htp.p('Users.png"');
  end if;
  htp.p('>');
  htp.p('</td>');

  htp.p('<td>');
     htp.p('<img src="'||V('WORKSPACE_IMAGES'));
    if alert.to_date > sysdate then
      htp.p('Appointment Urgent.png"');
    else
     htp.p('Appointment Cool.png"');
    end if;
  htp.p('>');
  htp.p('</td>');


  htp.p('<td>');
  htp.p(alert.link);
  htp.p('</td>');

  htp.p('<td>');
  htp.p(alert.message_text||' '||alert.U_COMMENT);
  htp.p('</td');
  
  
  htp.p('</tr>');

end loop;

htp.p('</table');

end GET_MAIN_PAGE;


PROCEDURE GENERATE_BETEG_SELECT as

cursor betegek is 
 SELECT SUBJ_NAME,SUBJ_ID from V_SUBJ_SUBJ_TYPE WHERE SUBJ_TYPE_ID = 1308590162;
begin
 htp.p('<SELECT>');
 htp.p('<option>- Szabad -</OPTION>');

 for beteg in betegek loop
  htp.p('<option value = "'|| beteg.SUBJ_ID ||'">'|| beteg.SUBJ_NAME|| '</OPTION>');
 end loop;
 htp.p('</SELECT>');
end;



PROCEDURE GENERATE_HACK as
  type myarray is table of varchar2(255) index by binary_integer;
  v_array myarray;

begin
  v_array(v_array.count + 1) := '08:00';  
  v_array(v_array.count + 1) := '08:30';

  v_array(v_array.count + 1) := '09:00';  
  v_array(v_array.count + 1) := '09:30';

  v_array(v_array.count + 1) := '10:00';  
  v_array(v_array.count + 1) := '10:30';

  v_array(v_array.count + 1) := '11:00';  
  v_array(v_array.count + 1) := '11:30';

  v_array(v_array.count + 1) := '12:00';  
  v_array(v_array.count + 1) := '12:30';

  v_array(v_array.count + 1) := '14:00';  
  v_array(v_array.count + 1) := '14:30';

  v_array(v_array.count + 1) := '15:00';  
  v_array(v_array.count + 1) := '15:30';

  v_array(v_array.count + 1) := '16:00';  
  v_array(v_array.count + 1) := '16:30';
  
  htp.p('<table class="responstable">');
  htp.p('<tr>');

  htp.p('<th colspan = "10">');
  htp.p('Kezelési kapacitás nyilvántartás ');
  htp.p(to_char (sysdate,'YYYY.MM.DD'));
  htp.p('</th>');

  htp.p('</tr>');

  htp.p('<tr>');

htp.p('<th>');
htp.p('Idõpont');
htp.p('</th>');

htp.p('<th>');
htp.p('dr. Kukugyenka Tógyel');
htp.p('</th>');

htp.p('<th>');
htp.p('dr. Gipsz Jakab');
htp.p('</th>');

htp.p('<th>');
htp.p('dr Teszt Elek');
htp.p('</th>');

htp.p('</tr>');

for i in 1..v_array.count loop
   
  htp.p('<tr>');
  htp.p('<th>');
  htp.p  (v_array(i));
  htp.p('</th>');
  
  htp.p('<td>');
  GENERATE_BETEG_SELECT;
  htp.p('</td>');

  htp.p('<td>');
  GENERATE_BETEG_SELECT;
  htp.p('</td>');

  htp.p('<td>');
  GENERATE_BETEG_SELECT;
  htp.p('</td>');
end loop; 
end;


END GENERATE_HTML;

/
