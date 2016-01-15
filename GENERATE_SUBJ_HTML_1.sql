--------------------------------------------------------
--  DDL for Package Body GENERATE_SUBJ_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_SUBJ_HTML" 
AS
  FUNCTION IS_DESCENDENT(
      p_type_id      NUMBER,
      p_ascendent_id NUMBER)
    RETURN BOOLEAN
  AS
    l_group_id NUMBER;
  BEGIN
    l_group_id    := SUPER_TYP_TAPI.LOOKUP_GROUP_ID(p_type_id);
    IF l_group_id IS NULL THEN
      RETURN false;
    ELSE
      IF l_group_id = p_ascendent_id THEN
        RETURN true;
      ELSE
        RETURN IS_DESCENDENT(l_group_id,p_ascendent_id);
      END IF;
    END IF;
  END IS_DESCENDENT;
  
function get_param_value( p_subj_id number, p_param_type_id number, p_group_id number default null) return varchar2
as
l_retval varchar2 (255);
begin
   select value into l_retval from subj_param 
    where subj_id = p_subj_id 
    and param_type_id = p_param_type_id
    and ( p_group_id is null or p_group_id = group_id );
   return l_retval;
exception 
when no_data_found then
   return null;
when too_many_rows then
   return null;
end;

PROCEDURE PRINT_SUBJ_ROW(
    p_subject V_SUBJECTIV%rowtype)
AS
  CURSOR roles(c_subj_id NUMBER)
  IS
    SELECT DISTINCT subj_id,
      SUBJ_TYPE_ID,
      SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(SUBJ_TYPE_ID) ROLE_NAME
    FROM subj_param
    WHERE SUBJ_ID = c_subj_id
    ORDER BY SUBJ_TYPE_ID DESC;
BEGIN
  htp.p('<tr class="dataRow" onclick="goToEdit('|| p_subject.SUBJ_ID ||')">');
  htp.p('<td class = "hot">');
  HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'File_Edit.png">');
  htp.p('</td>');
  htp.p('<td class = "hot">');
  HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'document_32.png">');
  htp.p('</td>');
  htp.p('<td>'|| p_subject.SUBJ_ID ||'</td>');
  htp.p('<td>'|| p_subject.subj_name ||'</td>');
  --        htp.p('<td>'|| lookup_super_type_name(p_subject.SUBJ_CATEGORY_ID) ||'</td>');
--  htp.p('<td>Teszt szervezet 1</td>');
  htp.p('<td>'|| TO_CHAR(p_subject.FROM_DATE,'YYYY.MM.DD') ||'</td>');
  htp.p('<td>'|| TO_CHAR(p_subject.TO_DATE,'YYYY.MM.DD') ||'</td>');
  htp.p('<td>');
  FOR role IN roles(p_subject.SUBJ_ID)
  LOOP
    htp.p(role.ROLE_NAME||' ');
    EXIT;
  END LOOP;
  htp.p('</td>');
  htp.p('</tr>');
END PRINT_SUBJ_ROW;

PROCEDURE GENERATE_SUBJ_LIST_AJAX(
    p_json VARCHAR2)
AS
type v_subject_type
IS
  TABLE OF V_SUBJECTIV%rowtype INDEX BY pls_integer;
  v_subject_table v_subject_type;
  l_subj_type_id NUMERIC(12,0);
  l_json json := json(p_json);
  l_order  VARCHAR2(2000);
  l_where  VARCHAR2(2000);
  l_select VARCHAR(2000);
  l_subject VARCHAR(2000);

BEGIN
  l_subj_type_id := json_ext.get_number (l_json, 'SUBJ_TYPE');
  l_order        := json_ext.get_string(l_json, 'ORDER');
  l_where        := json_ext.get_string(l_json, 'WHERE');
  l_subject      := json_ext.get_string(l_json, 'SUBJ_NAME');
  l_select       := 'SELECT * from v_subjectiv where SUBJ_CATEGORY_ID='||l_subj_type_id;
  IF l_subject     IS NOT NULL THEN
    l_select     := l_select || ' and upper(SUBJ_NAME) like ''%'||upper(l_subject)||'%''';
  END IF;

  IF l_order     IS NOT NULL THEN
    l_select     := l_select || ' order by '||l_order;
  END IF;
  EXECUTE immediate l_select bulk collect INTO v_subject_table;
  FOR indx IN 1..v_subject_table.count
  LOOP
    if l_where is null then
       PRINT_SUBJ_ROW( v_subject_table(indx) );
    elsif SUBJECT_tapi.is_subj_in_type(v_subject_table(indx).subj_id,l_where)=true then
       PRINT_SUBJ_ROW( v_subject_table(indx) );
    end if;
  END LOOP;
  -- htp.p(l_select);

END GENERATE_SUBJ_LIST_AJAX;

PROCEDURE GENERATE_SUBJ_LIST(
    p_subj_type_id NUMBER)
AS
  CURSOR subjects
  IS
    SELECT *
    FROM V_SUBJECTIV SUBJECT
    where SUBJ_CATEGORY_ID=p_subj_type_id 
    ORDER BY SUBJECT_TAPI.GET_SUBJECT_NAME (SUBJECT.SUBJ_ID );

  cursor types 
  IS
   select DISTINCT VALUE subj_type_id, LOOKUP_SUPER_TYPE_NAME(VALUE) subj_type_name from SUBJECT, SUBJ_PARAM
  where SUBJ_PARAM.SUBJ_ID = SUBJECT.SUBJ_ID
  and PARAM_TYPE_ID = 1010
  and SUBJ_CATEGORY_ID = p_subj_type_id;
BEGIN
  htp.p('<TABLE id = "mainTable"  class="responstable">');
  htp.p('<tr>');
  htp.p('<th colspan = 8>' || SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(p_subj_type_id));
  HTP.P('<span onclick="goToEdit(0)" id = "spanAdd" class="hot"  style="float:right" >');
  HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('</span>');
  HTP.P('</th>');
  htp.p('</tr>');
  htp.p('<tr id = "sortRow">');
  htp.p('<th></th>');
  htp.p('<th></th>');
  htp.p('<th>SUBJ_ID  <span style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="SUBJ_ID" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span> </th>');
  htp.p('<th>SUBJ_NAME <span  style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="SUBJ_NAME"  onclick="changeOrder(this)"  src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png"  data-ord="none"> </span> </th>');
--  htp.p('<th>ORGANIZATION <span  style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="ORGANIZATION"  onclick="changeOrder(this)"  src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png"  data-ord="none"> </span> </th>');
  htp.p('<th>FROM <span style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="FROM_DATE"  onclick="changeOrder(this) " src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png"  data-ord="none"> </span> </th>');
  htp.p('<th>TO <span style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="TO_DATE"  onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png"  data-ord="none"> </span> </th>');
  htp.p('<th>Típus <span style="float:right" > <img title="this will be displayed as a tooltip" class="sortImg" data-col="TYPE"  onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png"  data-ord="none"> </span> </th>');
  htp.p('</tr>');
  htp.p('<tr id ="filterRow">');
  htp.p('<th></th>');
  htp.p('<th></th>');
  htp.p('<th><INPUT TYPE="text" id="srcSUBJ_ID" onchange="changeSearch(this)" style="color:black"></th>');
  htp.p('<th><INPUT TYPE="text" id="srcSUBJ_NAME" onchange="changeSearch(this)" style="color:black"></th>');
--  htp.p('<th>');
--  htp.p('<SELECT style="color:black">');
--  htp.p('<OPTION value = 0> - Válasszon - </OPTION>');
--  htp.p('<OPTION> Teszt szervezet 1 </OPTION>');
--  htp.p('</SELECT>');
--  htp.p('</th>');
  htp.p('<th><INPUT TYPE="text" class="text_field datePicker" id="srcFROM" onchange="changeSearch(this)" style="color:black"></th>');
  htp.p('<th><INPUT TYPE="text" class="text_field datePicker" id="srcTO" onchange="changeSearch(this)" style="color:black"></th>');
  htp.p('<th>');
  htp.p('<SELECT id="srcTYPE" onchange="changeSearch(this)" style="color:black">');
  htp.p('<OPTION value=0> - Válasszon - </OPTION>');
  for t in types loop
    htp.p('<OPTION value = "'|| t.subj_type_id ||'"> '|| t.subj_type_name ||' </OPTION>');
  end loop;
  htp.p('</SELECT>');
  htp.p('</th>');
  htp.p('</tr>');
  FOR subject IN subjects
  LOOP
    IF SUBJ_IN_TYPE(subject.subj_id,p_subj_type_id) THEN
      PRINT_SUBJ_ROW(subject);
    END IF;
  END LOOP;
  htp.p('</TABLE>');
END;

PROCEDURE GENERATE_SUBJ_LIST_BY_TYPE
AS
  CURSOR subjects
  IS
    SELECT SUBJECT.SUBJ_ID                             AS LINK,
      SUBJECT.SUBJ_ID                                  AS SUBJ_ID,
      SUBJECT_TAPI.GET_SUBJECT_NAME (SUBJECT.SUBJ_ID ) AS SUBJ_NAME,
      SUPER_TYP_TAPI.lookup_super_type_name(SUBJECT.SUBJ_CATEGORY_ID) KATEGORIA
    FROM SUBJECT SUBJECT
    ORDER BY SUBJ_NAME;
BEGIN
  htp.p('<TABLE id = "mainTable"  class="responstable">');
  htp.p('<thead>');
  htp.p('<tr>');
  htp.p('<th colspan = 4>Alanyok');
  HTP.P('<span onclick="goToEdit(0)" id = "spanAdd" class="hot"  style="float:right" >');
  HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('</span>');
  HTP.P('</th>');
  htp.p('</tr>');
  htp.p('<tr>');
  htp.p('<th></th>');
  htp.p('<th>SUBJ_ID</th>');
  htp.p('<th>SUBJ_NAME</th>');
  htp.p('<th>KATEGORIA</th>');
  htp.p('</tr>');
  htp.p('</thead>');
  htp.p('<tbody>');
  FOR subject IN subjects
  LOOP
    htp.p('<tr onclick="goToEdit('|| subject.LINK ||')">');
    htp.p('<td class = "hot">');
    HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'File_Edit.png">');
    htp.p('</td>');
    htp.p('<td>'|| subject.SUBJ_ID ||'</td>');
    htp.p('<td>'|| subject.SUBJ_NAME ||'</td>');
    htp.p('<td>'|| subject.KATEGORIA ||'</td>');
    htp.p('</tr>');
  END LOOP;
  htp.p('</tbody>');
  htp.p('</TABLE>');
END GENERATE_SUBJ_LIST_BY_TYPE;

PROCEDURE GENERATE_SUBJ_FOOT_EDITOR
  as
BEGIN
  HTP.P('<TABLE id="SubjFootTable" class="responstable" >');
  HTP.P('<TR>');
  HTP.P('<TH  colspan = 13>');
 
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
--  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('BACK')||'" id ="imgBack" onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'left_32.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" id ="imgFootOk"   onclick="SaveChanges();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgFootHelp"  style="float:right"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');
  HTP.P('</TABLE>');

END;

PROCEDURE GENERATE_SUBJ_EDITOR(
    p_subj_type_id NUMBER,
    p_subj_id      NUMBER DEFAULT NULL,
    p_disp_type    number default 0)
AS
BEGIN
  GENERATE_SUBJ_HEAD_EDITOR (p_subj_id,p_disp_type);
  IF p_subj_id IS NOT NULL THEN
    GENERATE_SUBJ_PARAM_EDITOR(p_subj_id);
  ELSE
    GENERATE_SUBJ_PARAM_EDITOR(p_subj_id,p_subj_type_id);
  END IF;
  GENERATE_SUBJ_FOOT_EDITOR;
END ;

procedure GET_SUPER_TYP_POPUP as
begin
   HTP.P('<div id="popUpSuperTypDiv">');
   HTP.P('<TABLE id = "popupSuperTypTable"  class="responstable">');
   HTP.P('<TR>');
   HTP.P('<TH  colspan = 13>');
   HTP.P('<span id="popupHeadRow">');
   HTP.P('Listaelem hozzáadása');
   HTP.P('</span>');
   HTP.P('<span  id = "spanSuperTypClosePopup"  style="float:right" >');
   HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('CANCEL')||'" onclick="ClosePopup();" src="'||v('WORKSPACE_IMAGES')|| 'Cancel Red Button.png">');
   HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" onclick="addListElement();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
   HTP.P('</span>');
   HTP.P('</TH>');
   HTP.P('</TR>');   
   HTP.P('<TR>');
   HTP.P('<TH>');
   HTP.P('Érték');
   HTP.P('</TH>');
   HTP.P('<TD>');
   HTP.P('<INPUT TYPE="text" id="pSuperTypeName">');
   HTP.P('<INPUT TYPE ="hidden" id="popupItemValue">');
   HTP.P('</TD>');
   HTP.P('</TR>');
   HTP.P('</TABLE>');
   HTP.P('</div>');
end;

PROCEDURE NEW_LIST_ELEMENT_ALERT(p_table_name varchar2, p_value number, p_text varchar2) as
 l_new_alert_id number (12,0);

BEGIN
 insert into alert (ALERT_TYPE_ID, MESSAGE_TEXT, SUBJ_TYPE_ID)
  values (90101,'Listalem beszúrás:'||p_text,1012)
  returning alert_id into l_new_alert_id;
---- Tábla név
  insert into alert_param (  ALERT_ID,  PARAM_TYPE_ID, VALUE )
    values  (l_new_alert_id,90201,p_table_name);
---- Id
  insert into alert_param (  ALERT_ID,  PARAM_TYPE_ID, VALUE )
    values  (l_new_alert_id,90202,p_value);
END;

PROCEDURE INSERT_NEW_LIST_ELEMENT(p_dm_subject_id number, p_text varchar2) as
  l_dm_subject_row dm_subject%rowtype;
  l_new_row_id number (12,0);
  l_cnt number (2);
begin
  select * into l_dm_subject_row from dm_subject where dm_subject_id =  p_dm_subject_id ;

  if l_dm_subject_row.VALUE_GROUP_TABLE = 'DM_SUPER_TYP' then
    begin 
      select super_typ_id into l_new_row_id from dm_super_typ 
        where GROUP_ID = l_dm_subject_row.VALUE_GROUP_ID 
        and super_type_name = p_text;
    exception 
      when NO_DATA_FOUND then
      insert into dm_super_typ (GROUP_ID,SUPER_TYPE_NAME)
        values(l_dm_subject_row.VALUE_GROUP_ID,p_text)
        returning super_typ_id into l_new_row_id;
      when OTHERS then
         htp.p('ERROR:'||SQLCODE||' '||SQLERRM);
    end;
    NEW_LIST_ELEMENT_ALERT('DM_SUPER_TYP',l_new_row_id,p_text);
    htp.p('<option selected value="'||l_new_row_id||'">'||p_text||'<option>');
  elsif l_dm_subject_row.VALUE_GROUP_TABLE = 'SUBJECT' then
    begin
      select subj_id into l_new_row_id from SUBJ_PARAM
        where SUBJ_TYPE_ID = l_dm_subject_row.VALUE_GROUP_ID
        and PARAM_TYPE_ID = 1301
        and VALUE = p_text;
    exception 
    when NO_DATA_FOUND then
      insert into subject (SUBJ_CATEGORY_ID)
        values(l_dm_subject_row.VALUE_GROUP_ID)
        returning SUBJ_ID into l_new_row_id;
      insert into SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
        values (l_new_row_id,l_dm_subject_row.VALUE_GROUP_ID,1301,p_text);
      insert into SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
        values (l_new_row_id,l_dm_subject_row.VALUE_GROUP_ID,1001,l_dm_subject_row.VALUE_GROUP_ID);
    when OTHERS then
         htp.p('ERROR:'||SQLCODE||' '||SQLERRM);
    end;
    NEW_LIST_ELEMENT_ALERT('SUBJECT',l_new_row_id,p_text);
    htp.p('<option selected value="'||l_new_row_id||'">'||p_text||'<option>');
  else
    raise VALUE_ERROR;
  end if;
  
exception when others then
   htp.p('ERROR:'||SQLCODE||' '||SQLERRM);
end;

PROCEDURE GENERATE_SUBJ_HEAD_EDITOR( 
    p_subj_id NUMBER DEFAULT NULL,
    p_disp_type NUMBER)
AS
  CURSOR subj_types
  IS
    SELECT LPAD ('-', LEVEL - 1)
      || SUPER_TYPE_NAME d ,
      SUPER_TYP_ID r
    FROM DM_SUPER_TYP
      START WITH GROUP_ID           = 100
      CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID;
  CURSOR organizations
  IS
    SELECT * FROM V_ORGANIZATIONS; 
  l_subject_row V_SUBJECTIV%ROWTYPE;
BEGIN
  GET_SUPER_TYP_POPUP;
  HTP.P('<TABLE id="SubjHeadTable" class="responstable" >');
  HTP.P('<TR>');
  HTP.P('<TH  colspan = 13>');
  HTP.P('<span id="HeadTableCaptionText">');
  IF p_subj_id IS NULL THEN
    if p_disp_type = 0 then 
       HTP.P('Új alany felvétele');
    else
       HTP.P('Új keresés definiálása');
    end if;
  ELSE
    SELECT * INTO l_subject_row FROM V_SUBJECTIV WHERE SUBJ_ID = p_subj_id;
    HTP.P(l_subject_row.subj_name ||' szerkesztése');

  END IF;
  HTP.P('</span>');
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('BACK')||'" id ="imgBack" onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'left_32.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" id ="imgOk"   onclick="SaveChanges();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"  style="float:right"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');
  HTP.P('</TABLE>');
END;

FUNCTION GET_DM_SUBJECT_GROUP(
    p_dm_subject_id NUMBER)
  RETURN NUMBER
AS
  v_retval NUMBER (12,0);
BEGIN
  SELECT group_id
  INTO v_retval
  FROM dm_subject
  WHERE dm_subject_id = p_dm_subject_id;
  RETURN v_retval;
END;

PROCEDURE GET_STREET_TYPE_ID (p_street_id number)
  as
  l_retval number (12,0) := 0;
  begin
      select KOZTER into l_retval from WK_STAGE_STREET_OLD where STREET_ID = p_street_id;
      htp.p(l_retval);
  exception when no_data_found then
       htp.p('no_data_found');
  end;

FUNCTION GET_ZIP(p_city_id number, street_id number default null ) RETURN varchar2
  as
   l_ret_val number (12,0);
  begin
 
     SELECT "postal_code" into l_ret_val from prt_plz,DM_CITY
       where DM_CITY.NAME = prt_plz."place_name"
       and DM_CITY_ID = p_city_id
      AND rownum <= 1;
       return l_ret_val;
  end;

PROCEDURE GET_STREET_CONTROL(p_par dm_subject%rowtype,
    p_subj_param subj_param%rowtype default null,
    p_city_id number default null)
  as
  cursor  streets is
  select * from wk_stage_street_old 
    where /* p_city_id is null or */ city = p_city_id;

  l_id number(12,0) := seq_base.nextval;
  l_addr VARCHAR2 (255);

  function get_city_name (p_text_id number) return varchar2
  as
  l_retval varchar2(50) := 'hiba';
  begin
    select trim(cnames) into l_retval from dm_text where text_id = p_text_id and language_id = 1;
    return l_retval;
  exception when no_data_found then
    return l_retval;
  end;
  
BEGIN
       begin 
         select value into l_addr from subj_param where GROUP_ID = p_subj_param.subj_param_id and PARAM_TYPE_ID = 5000002575;
       exception when NO_DATA_FOUND THEN
          l_addr := '';
       end;
       htp.p('<input type="text" data-subjParamID ="5000002573" ');   
       htp.p('data-dmsubject="'||p_par.dm_subject_id ||'" list="street_'||nvl(p_subj_param.subj_param_id,l_id)||'"'); 
       htp.p(' class="Resizable"   data-dmsubject="'||p_par.dm_subject_id ||'"  onchange="streetChanged(this)"'); 
       htp.p(' value ="'|| l_addr ||'"');
       htp.p(' >');       
       htp.p('<datalist id="street_'||nvl(p_subj_param.subj_param_id,l_id)||'" >');
        for street in streets loop
           htp.p('<option data-combodata="'||street.street_id ||'" value="'||get_city_name (street.name)||'"></option>');
        end loop;       
	      htp.p('</datalist>');
  END;

PROCEDURE AJAX_GET_STREET_CONTROL(p_city_name varchar2, p_par_id number) AS 

  l_par dm_subject%rowtype;
  function get_city_id(p_name varchar2) return number as
  l_retval number (12,0) := null;
  begin
--    htp.p('get_city_id => p_city_name:'||p_city_name|| ' p_par_id:'||p_par_id);
    select dm_city_id into l_retval from dm_city where name = p_city_name;
    return l_retval;
    exception when no_data_found then
    return l_retval;
  end;
BEGIN

  select * into l_par from dm_subject where dm_subject_id = p_par_id;
  GET_STREET_CONTROL(p_par=>l_par, p_city_id=>get_city_id(p_city_name));
  exception when others then
   htp.p('p_city_name:'||p_city_name|| ' p_par_id:'||p_par_id);
END;

PROCEDURE GET_ADDRESS_CONTROL (
    p_par dm_subject%rowtype,
    p_subj_param subj_param%rowtype default null)
AS
  cursor cities is
   select * from dm_city order by name;
--   id_num number := seq_base.nextval;

  cursor pat is -- közterület jellegek
  select super_typ_id,SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(super_typ_id) name from dm_super_typ where group_id = 5000002581 ORDER BY name ;

     l_city_id varchar2(255);
     l_zip varchar2(255);
     l_street varchar2(255);
     l_no varchar2(255);
     l_type varchar2(255);

   function get_city_name(p_dm_city_id number) return varchar2
    as
    l_retval varchar2 (255);
    begin 
      select name into l_retval from dm_city where dm_city_id = p_dm_city_id;
      return l_retval;
    exception when others then
      return null;
    end;
  
BEGIN

      if V('APP_ID') > '30022' then
        l_city_id := get_param_value( p_subj_param.subj_id, 5000002573, p_subj_param.subj_param_id);
        l_zip := get_param_value( p_subj_param.subj_id, 5000072678, p_subj_param.subj_param_id);
        l_street := get_param_value( p_subj_param.subj_id, 5000002574, p_subj_param.subj_param_id);
        l_no := get_param_value( p_subj_param.subj_id, 5000002576, p_subj_param.subj_param_id);
        l_type := get_param_value( p_subj_param.subj_id, 5000002581, p_subj_param.subj_param_id);
        htp.p('<table width= "100%">');
        htp.p('<tr><td onclick = "addressHeadClick(this);" colspan=2>'||p_subj_param.value || '</td></tr>');
        htp.p('<tr style="display: none;"  data-row-name="zip"   data-paramgroup =  "'||p_subj_param.subj_param_id ||'"><th width = "20%"> Irányítószám </th><td>');
        htp.p('<input type="text" data-subjParamID ="5000072678" class="Resizable"   data-dmsubject="'||p_par.dm_subject_id ||'"');
        if l_zip is not null then
            htp.p(' value="'||l_zip||'"');
        else
            if l_city_id is not null then
                htp.p(GET_ZIP(l_city_id));
            end if;
        end if;

        htp.p(' onchange="zipChanged(this);" >');
        
        htp.p('</td></tr>');
        htp.p('<tr style="display: none;"  data-row-name="city" data-paramgroup =  "'||p_subj_param.subj_param_id ||'"><th width = "20%"> Város </th><td>');
        htp.p('<input type="text" data-subjParamID ="5000002573"  list="city_'||p_subj_param.subj_param_id||'" ');
        if l_city_id is not null then
         htp.p('value="'||nvl(get_city_name(l_city_id),l_city_id)||'"');
        end if;   
        htp.p(' class="Resizable"   data-dmsubject="'||p_par.dm_subject_id ||'"  onchange="cityChanged(this);" >');
        htp.p('<datalist id="city_'||p_subj_param.subj_param_id||'" >');
        for city in cities loop
           htp.p('<option data-combodata="'||city.dm_city_id||'" value="'||city.name||'" ');
           if l_city_id is not null and l_city_id = city.dm_city_id then
            htp.p(' selected ');
           end if;
           htp.p('></option>');
        end loop;       
	      htp.p('</datalist>');
        htp.p('</td></tr>');
       
        htp.p('<tr style="display: none;"  data-row-name="street"  data-paramgroup =  "'||p_subj_param.subj_param_id ||'"><th> Közterület neve  </th><td>');
        GET_STREET_CONTROL(p_par,p_subj_param,l_city_id);
        htp.p('</td></tr>'); 
        htp.p('<tr style="display: none;" data-row-name="type"  data-paramgroup =  "'||p_subj_param.subj_param_id ||'"><th> Közterület jellege </th><td>');
        
       htp.p('<input type="text" value ="'||l_type ||'" list="streetType_'||p_subj_param.subj_param_id||'"  class="Resizable" data-dmsubject="'||p_par.dm_subject_id ||'" data-subjParamID ="5000002575" onchange="dirty(this);" >');
       htp.p('<datalist id="streetType_'||p_subj_param.subj_param_id||'" >');
       for p in pat loop
           htp.p('<option value="'||p.super_typ_id||'">'||p.name||'</option>');
        end loop;
        htp.p('</select>');
        htp.p('</td></tr>'); 
        htp.p('<tr style="display: none;" data-row-name="houseNo" data-paramgroup =  "'||p_subj_param.subj_param_id ||'"><th width = "20%"> Házszám </th><td>');
        htp.p('<input type="text"  class="Resizable" data-subjParamID ="5000002576"   data-dmsubject="'||p_par.dm_subject_id ||'"');
        htp.p(' onchange="dirty(this);" value="'||get_param_value( p_subj_param.subj_id, 5000002576, p_subj_param.subj_param_id)||'"> ');
         htp.p('</td></tr>'); 
        htp.p('</table>');
    else
        htp.p('<input  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" class="datePicker Resizable" style = "width:205px;" onchange="dirty(this)" type="text" value="'|| p_subj_param.value ||'">');
    end if;

--<input data-dmsubject="5000002565" data-subjparamid="5000001325" class="Resizable" style="width: 941px;" onchange="dirty(this)" type="text" value="">
  
END;

PROCEDURE GET_INPUT_CONTROL(
    p_par dm_subject%rowtype,
    p_subj_param subj_param%rowtype default null)
AS
  CURSOR OPTIONS(p_group_id NUMBER)
  IS
    SELECT SUPER_TYP_ID,
      SUPER_TYPE_NAME
    FROM DM_SUPER_TYP
    WHERE GROUP_ID = p_group_id;

  CURSOR OPTIONS_SUBJ(p_group_id NUMBER)
  IS
    SELECT * FROM V_SUBJECTIV WHERE SUBJ_CATEGORY_ID = p_group_id order by SUBJ_NAME ;
  v_style_str     VARCHAR2 (100);
  v_value_type_id NUMBER (12,0);

  CURSOR 
     OPTIONS_LANGUAGE IS
--       select language_id,language_name from dm_language where status_id = 3;
--     select language_id,language_name from dm_language where LANGUAGE_TYP ='Alapnyelv';
     select language_id,nvl(LANGUAGE_NAME,nvl(HUN_NAME, ENG_NAME)) language_name from DM_LANGUAGE  where status_id = 3 order by 2;
  CURSOR 
     OPTIONS_COUNTRY IS
       select country_id,country_name from dm_country where stat_type_id = 3 order by country_name;

  CURSOR 
     OPTIONS_CITY IS
       select DM_CITY_ID,name from dm_city order by name ; 


BEGIN
  IF p_par.MEDIA = 0 AND p_par.APPENDABLE = 0 THEN
    v_style_str := 'width:205px;';
  ELSE
    v_style_str := 'width:175px;';
  END IF;
  IF p_par.FIELD_TYPE = 'TEXT' THEN
    htp.p('<input  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '"  class="Resizable" style = "'||v_style_str||'"  onchange="dirty(this)" type="text" value="'|| p_subj_param.value ||'">');
    -- ELSIF p_par.VALUE_GROUP_ID IS NOT NULL THEN
  ELSIF p_par.FIELD_TYPE = 'DATE' THEN
    htp.p('<input  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" class="datePicker Resizable" style = "width:205px;" onchange="dirty(this)" type="text" value="'|| p_subj_param.value ||'">');
  ELSIF p_par.FIELD_TYPE = 'LOCATION' THEN
    if V('APP_ID') > '30022' then
        GET_ADDRESS_CONTROL ( p_par,p_subj_param);
    else
        htp.p('<input  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" class="datePicker Resizable" style = "width:205px;" onchange="dirty(this)" type="text" value="'|| p_subj_param.value ||'">');
    end if;
  ELSIF p_par.FIELD_TYPE  = 'SELECT' THEN
    begin
     v_value_type_id := nvl(p_subj_param.value_type_id,to_number(p_subj_param.value));
    exception when others then
     v_value_type_id := null;
    end;
    IF p_par.VALUE_GROUP_TABLE = 'DM_SUPER_TYP' THEN
      htp.p('<select data-headtext="'|| super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID)||'"  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" style = "'||v_style_str||'" class="Resizable"  onchange="dirty(this)">');
      IF V('LANGUAGE') != 3 then
        htp.p('<option >- Válasszon -</option>');
      ELSE
        htp.p('<option >- Select -</option>');
      END IF;
      FOR o IN OPTIONS(p_par.value_group_id)
      LOOP
        IF o.super_typ_id = v_value_type_id THEN
          htp.p('<option selected="selected" value="'|| o.super_typ_id || '">'||  super_typ_tapi.lookup_super_type_name(o.super_typ_id) ||'</option>');
        ELSE
          htp.p('<option value="'|| o.super_typ_id || '">'|| super_typ_tapi.lookup_super_type_name(o.super_typ_id) ||'</option>');
        END IF;
      END LOOP;
      htp.p('</select>');
    ELSIF p_par.VALUE_GROUP_TABLE = 'SUBJECT' THEN
      htp.p('<select  data-headtext="'|| super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID)||'"  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" style = "'||v_style_str||'" class="Resizable"  onchange="dirty(this)">');
      IF V('LANGUAGE') != 3 then
        htp.p('<option >- Válasszon -</option>');
      ELSE
        htp.p('<option >- Select -</option>');
      END IF;
      FOR o IN OPTIONS_SUBJ(p_par.value_group_id)
      LOOP
        IF o.subj_id = v_value_type_id THEN
          htp.p('<option selected="selected" value="'|| o.subj_id || '">'|| o.subj_name ||'</option>');
        ELSE
          htp.p('<option value="'|| o.subj_id || '">'|| o.subj_name ||'</option>');
        END IF;
      END LOOP;
      htp.p('</select>');

      ELSIF p_par.VALUE_GROUP_TABLE = 'DM_LANGUAGE' THEN
      htp.p('<select  data-headtext="'|| super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID)||'"  data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" style = "'||v_style_str||'" class="Resizable"  onchange="dirty(this)">');
      IF V('LANGUAGE') != 3 then
        htp.p('<option >- Válasszon -</option>');
      ELSE
        htp.p('<option >- Select -</option>');
      END IF;
      FOR o IN OPTIONS_language
      LOOP
        IF o.language_id = v_value_type_id THEN
          htp.p('<option selected="selected" value="'|| o.language_id || '">'|| o.language_name ||'</option>');
        ELSE
          htp.p('<option value="'|| o.language_id || '">'|| o.language_name ||'</option>');
        END IF;
      END LOOP;
      htp.p('</select>');


      ELSIF p_par.VALUE_GROUP_TABLE = 'DM_COUNTRY' THEN
      htp.p('<select  data-headtext="'|| super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID)||'" data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" style = "'||v_style_str||'" class="Resizable"  onchange="dirty(this)">');
      IF V('LANGUAGE') != 3 then
        htp.p('<option >- Válasszon -</option>');
      ELSE
        htp.p('<option >- Select -</option>');
      END IF;
      FOR o IN OPTIONS_COUNTRY
      LOOP
        IF o.country_id = v_value_type_id THEN
          htp.p('<option selected="selected" value="'|| o.country_id || '">'|| o.country_name ||'</option>');
        ELSE
          htp.p('<option value="'|| o.country_id || '">'|| o.country_name ||'</option>');
        END IF;
      END LOOP;
      htp.p('</select>');

      ELSIF p_par.VALUE_GROUP_TABLE = 'DM_CITY' THEN
      htp.p('<select  data-headtext="'|| super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID)||'" data-dmSubject ="'|| p_par.dm_subject_id || '" data-subjParamID ="'|| p_subj_param.subj_param_id || '" style = "'||v_style_str||'" class="Resizable"  onchange="dirty(this)">');
      IF V('LANGUAGE') != 3 then
        htp.p('<option >- Válasszon -</option>');
      ELSE
        htp.p('<option >- Select -</option>');
      END IF;
      FOR o IN OPTIONS_CITY
      LOOP
        IF o.dm_city_id = v_value_type_id THEN
          htp.p('<option selected="selected" value="'|| o.dm_city_id || '">'|| o.name ||'</option>');
        ELSE
          htp.p('<option value="'|| o.dm_city_id || '">'|| o.name ||'</option>');
        END IF;
      END LOOP;
      htp.p('</select>');


    END IF;
    IF p_par.APPENDABLE <> 0 THEN
      htp.p('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD_OPTION')||'"  data-dmsupertypid = "'||p_par.DM_SUBJECT_ID||'" onClick ="AddSuperTyp(this);"  src="'||v('WORKSPACE_IMAGES')||'Add.png"'||'">');
    END IF;
  ELSE
    htp.p('Nem támogatott típus');
  END IF;
  IF p_par.MEDIA <> 0 THEN
    htp.p('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')||'New Document.png"'||'">');
  END IF;
END;

PROCEDURE GENERATE_SUBJ_PARAM_ROW(
    p_par dm_subject%rowtype,
    p_subj_id NUMBER)
AS
  v_subj_param_row subj_param%rowtype;
  v_unit_type_id  NUMBER (12,0);
BEGIN
  IF p_par.ORDER_NO IS NOT NULL AND p_par.ORDER_NO > 0 THEN 
    BEGIN
      SELECT *
      INTO v_subj_param_row
      FROM SUBJ_PARAM
      WHERE SUBJ_ID     = p_subj_id
      AND PARAM_TYPE_ID = p_par.SUBJ_PARAM_TYPE_ID;
    EXCEPTION
    WHEN OTHERS THEN
      v_subj_param_row := null;
    END;
    htp.p('<tr style="display:none;"  data-id ="'|| p_par.dm_subject_id ||'"  data-group = "'||GET_DM_SUBJECT_GROUP(p_par.dm_subject_id)||'">');
    htp.p('<th class="rowHead" style = "width:20%">');
    htp.p('<input class="mandantory" type="hidden" value="'|| p_par.MANDATORY ||'">');
    htp.p('<input class="paramType" type="hidden" value="'|| p_par.SUBJ_PARAM_TYPE_ID ||'">');
    htp.p('<input class="paramId" type="hidden" value="'|| v_subj_param_row.subj_param_id ||'">');
    IF p_par.MANDATORY > 0 THEN
      htp.p('<strong>');
      htp.p(super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID));
      htp.p('</strong>');
    ELSE
      htp.p(super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID));
    END IF;
    IF v('APP_USER') = 'FPARDI' THEN
      htp.p('('||p_par.SUBJ_PARAM_TYPE_ID||')');
    END IF;
    htp.p('</td>');
    htp.p('<td  class = "value">');
    GET_INPUT_CONTROL(p_par , v_subj_param_row);
    htp.p('</td>');
    htp.p('</tr>');
  END IF;
END;

FUNCTION GET_CELL(
    p_group_id      NUMBER,
    p_param_type_id number )
  RETURN subj_param%rowtype
AS
v_ret_val subj_param%rowtype;   
BEGIN
   select * into v_ret_val from subj_param where group_id = p_group_id 
    and param_type_id = p_param_type_id;
  return v_ret_val;
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END;

PROCEDURE GENERATE_GROUP_ROW(
    p_par dm_subject%rowtype,
    p_param_row subj_param%rowtype,
    p_subj_id NUMBER,
    p_new_row boolean default false)
AS
  v_data_paramgroup number (12,0);
BEGIN
 if p_new_row = true then
    v_data_paramgroup := seq_base.nextval;
 else
    v_data_paramgroup := p_param_row.subj_param_id;
 end if;
 htp.p('<tr ');
   if p_new_row = true then
     htp.p(' class="EmptyRow" ');
   end if;
   htp.p('data-paramgroup = "'||v_data_paramgroup||'">');
    htp.p('<td style = "width:70px;">');
     if p_new_row = true then
        htp.p('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('NEW_LINE')||'" onclick="AddParamRow(this)" src="'||v('WORKSPACE_IMAGES')||'Add Green Button.png"'||'">');
    else
        htp.p('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('DEL_LINE')||'" onclick="DeleteParamRow(this)" src="'||v('WORKSPACE_IMAGES')||'Minus Red Button.png"'||'">');
    htp.p(' ');
    end if;
    htp.p('</td>');
    FOR param IN params(p_par.dm_subject_id)
    LOOP
      htp.p('<td style = "width:205px;">');
       if p_new_row = true then
           GET_INPUT_CONTROL(param);
      else
           GET_INPUT_CONTROL(param ,GET_CELL(p_param_row.subj_param_id,param.SUBJ_PARAM_TYPE_ID));
      end if;
      htp.p('</td>');
    END LOOP;
    htp.p('</tr>');
END;

PROCEDURE GENERATE_EMPTY_GROUP_ROW(
    p_dm_subj_id number,
    p_subj_par_id NUMBER)
AS
  v_par dm_subject%rowtype;
  v_param_row subj_param%rowtype;
BEGIN
  select * into v_par from dm_subject where dm_subject_id = p_dm_subj_id;
  GENERATE_GROUP_ROW(v_par,null,p_subj_par_id,true);
end;

PROCEDURE GENERATE_GROUP_ROWS_HOR(
    p_par dm_subject%rowtype,
    p_subj_id NUMBER)
AS
  
  CURSOR groups(p_PARAM_TYPE_ID NUMBER, p_SUBJ_ID NUMBER)
  IS
    SELECT *
    FROM SUBJ_PARAM
    WHERE PARAM_TYPE_ID = p_PARAM_TYPE_ID
    AND SUBJ_ID         = p_SUBJ_ID;
BEGIN
  htp.p('<tr style="display:none;"  data-id ="'|| p_par.dm_subject_id ||'"  data-group = "'||p_par.dm_subject_id||'">');
  htp.p('<td colspan = 2>');
  htp.p( '<table  class="responstable subtable" style = "width:1300px;" > ' );
  htp.p('<tr>');
  htp.p('<th style = "width:70px;">');
  htp.p( ' ');
  htp.p('</th>');
  FOR param IN params(p_par.dm_subject_id)
  LOOP
    htp.p('<th style = "width:205px;">');
    htp.p( SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(param.SUBJ_PARAM_TYPE_ID) );
    IF v('APP_USER') = 'FPARDI' THEN
      htp.p('('||param.SUBJ_PARAM_TYPE_ID||')');
    END IF;
    htp.p('</th>');
  END LOOP;
  -------
  FOR g IN groups(p_par.subj_param_type_id,p_SUBJ_ID)
  LOOP
    GENERATE_GROUP_ROW(p_par,g,p_subj_id); 
  END LOOP;
  -----------
  GENERATE_GROUP_ROW(p_par,null,p_subj_id,true);
  -------------------
  htp.p('</table>');
  htp.p('</td></tr>');
END;

PROCEDURE GENERATE_SUBJ_PARAM_GROUP(
    p_par dm_subject%rowtype,
    p_subj_id NUMBER)
AS
BEGIN
  IF p_par.group_id IS NULL OR p_par.group_id = 0 THEN
    htp.p('<tr class = "groupHead" data-id ="'|| p_par.dm_subject_id ||'" data-closed = "yes" onclick="toggleGroup(this)" data-group = "'||GET_DM_SUBJECT_GROUP(p_par.dm_subject_id)||'">');
  ELSE
    htp.p('<tr class = "groupHead" style="display:none;"  data-id ="'|| p_par.dm_subject_id ||'" data-closed = "yes" onclick="toggleGroup(this)" data-group = "'||GET_DM_SUBJECT_GROUP(p_par.dm_subject_id)||'">');
  END IF;
  htp.p('<th colspan = 2>');
  htp.p(super_typ_tapi.lookup_super_type_name(p_par.SUBJ_PARAM_TYPE_ID));
  
  IF v('APP_USER') = 'FPARDI' THEN
    htp.p('('||p_par.SUBJ_PARAM_TYPE_ID||')');
  END IF;
  htp.p('</th>');
  htp.p('</tr>');
  IF p_par.multiply = 0 THEN
    GENERATE_GROUP_ROWS(p_par,p_subj_id);
  ELSE
    GENERATE_GROUP_ROWS_HOR(p_par,p_subj_id);
  END IF;
END;

PROCEDURE GENERATE_GROUP_ROWS(
    p_par dm_subject%rowtype,
    p_subj_id NUMBER)
AS
  CURSOR params
  IS
    SELECT dm_subject.*
    FROM dm_subject
    WHERE group_id = p_par.dm_subject_id
    ORDER BY order_no;
BEGIN
  htp.p('<tr style="display:none;"  data-id ="'|| p_par.dm_subject_id ||'"  data-group = "'||p_par.dm_subject_id||'">');
  htp.p('<td colspan = 2>');
  htp.p( '<table  class="responstable subtable" style = "width:1300px;" > ' );
  htp.p('<tr>');
  FOR param IN params
  LOOP
--    IF param.IS_GROUP = 0 THEN
      GENERATE_SUBJ_PARAM_ROW(param,p_subj_id );
--    ELSE
--      GENERATE_SUBJ_PARAM_GROUP(param,p_subj_id);
--    END IF;
  END LOOP;
  htp.p('</table>');
  htp.p('</td></tr>');
END;

PROCEDURE GENERATE_SUBJ_PARAM_EDITOR(
    p_subj_id      NUMBER,
    p_subj_type_id NUMBER DEFAULT 1010)
AS
--  CURSOR params
--  IS
--    SELECT dm_subject.* 
--      FROM dm_subject 
--      WHERE is_group = 1 
--      ORDER BY order_no;

  v_value         VARCHAR(255);
  v_value_type_id NUMBER (12,0);
  v_subj_param_id NUMBER (12,0);
  v_unit_type_id  NUMBER (12,0);
  v_subj_type_id  NUMBER (12,0);

   DmSubTab GENERATE_DM_SUBJECT_HTML.DmSubTabTyp;
BEGIN
--  begin 
--    select distinct value into v_subj_type_id from subj_PARAM where PARAM_TYPE_ID = 1010 
--      and  p_;
--  exception when others then
----    v_subj_type_id := 1010;
--    raise_application_error
--            (-20000
--             , 'GENERATE_SUBJ_PARAM_EDITOR:'); 
--  end;


  if p_subj_id is not null and p_subj_id <> 0 then
      select distinct value into v_subj_type_id from subj_PARAM 
        where PARAM_TYPE_ID = 1010 
        and subj_id = p_subj_id;  
  else
     v_subj_type_id := p_subj_type_id;
  end if;
  DmSubTab := GENERATE_DM_SUBJECT_HTML.GET_DM_SUBJECT_ROWS(v_subj_type_id, 0);

  htp.p('<div id="tableContainer" class="tableContainer">');
  IF V('APP_USER') = 'FPARDI' THEN
    htp.p( 'subj_id ='||p_subj_id|| ' subj_type_id ='||p_subj_type_id );
  END IF;
  htp.p('<input type="hidden" id="SubjId" value = "'||p_subj_id||'">');
  htp.p( '<table id="ParameterTable" class="responstable" > ' );
  htp.p('<tbody>');
--  FOR param IN params
  FOR i IN 1 .. DmSubTab.count() 
  LOOP
--    GENERATE_SUBJ_PARAM_GROUP(param,p_subj_id);
    GENERATE_SUBJ_PARAM_GROUP(DmSubTab(i),p_subj_id);
  END LOOP;
  htp.p('</tbody>');
  htp.p('</table>');
  htp.p('</div>');
END;

PROCEDURE GENERATE_DM_SUBJ_LIST_ROWS(
    p_subj_type_id NUMBER)
AS
  CURSOR items
  IS
    SELECT "DM_SUBJECT_ID",
      "SUBJ_TYPE_ID",
      SUPER_TYP_TAPI.lookup_super_type_name(SUBJ_TYPE_ID) ALANY,
      "SUBJ_PARAM_TYPE_ID",
      SUPER_TYP_TAPI.lookup_super_type_name(SUBJ_PARAM_TYPE_ID) PARAMETER,
      "ORDER_NO",
      "MANDATORY",
      "MULTIPLY",
      "FROM_DATE",
      "TO_DATE"
    FROM DM_SUBJECT
    WHERE SUBJ_TYPE_ID = p_subj_type_id
    OR p_subj_type_id IS NULL;
BEGIN
  FOR item IN items
  LOOP
    htp.p('<tr>');
    HTP.P('<td>');
    HTP.P(item."DM_SUBJECT_ID");
    HTP.P('</th>');
    -- HTP.P('<td>');HTP.P(item."SUBJ_TYPE_ID");HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(item.ALANY);
    HTP.P('</th>');
    -- HTP.P('<td>');HTP.P(item."SUBJ_PARAM_TYPE_ID");HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(item.PARAMETER);
    HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(item."ORDER_NO");
    HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(item."MANDATORY");
    HTP.P('</th>');
    --  HTP.P('<td>');HTP.P(item."MULTIPLY");HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(TO_CHAR(item."FROM_DATE",'YYYY.MM.DD'));
    HTP.P('</th>');
    HTP.P('<td>');
    HTP.P(TO_CHAR(item."TO_DATE",'YYYY.MM.DD'));
    HTP.P('</th>');
    htp.p('</tr>');
  END LOOP;
END;

PROCEDURE GENERATE_DM_SUBJ_LIST(
    p_subj_type_id NUMBER)
AS
  CURSOR subj_types
  IS
    SELECT LPAD ('-', LEVEL - 1)
      || SUPER_TYPE_NAME d,
      SUPER_TYP_ID r
    FROM DM_SUPER_TYP
      START WITH GROUP_ID           = 100
      CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID;
BEGIN
  htp.p('<TABLE id = "mainTable"  class="responstable">');
  htp.p('<tr>');
  htp.p('<th colspan = 10> Alany szabály karbantartó' || SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(p_subj_type_id));
  HTP.P('<span onclick="goToEdit(0)" id = "spanAdd" class="hot"  style="float:right" >');
  HTP.P('<img title="this will be displayed as a tooltip" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('</span>');
  HTP.P('</th>');
  htp.p('</tr>');
  htp.p('<tr>');
  htp.p('<th>DM_SUBJECT_ID');
  HTP.P('</th>');
  --    htp.p('<th>SUBJ_TYPE_ID');HTP.P('</th>');
  htp.p('<th>ALANY');
  HTP.P('</th>');
  --    htp.p('<th>SUBJ_PARAM_TYPE_ID');HTP.P('</th>');
  htp.p('<th>PARAMETER');
  HTP.P('</th>');
  htp.p('<th>ORDER_NO');
  HTP.P('</th>');
  htp.p('<th>MANDATORY');
  HTP.P('</th>');
  --    htp.p('<th>MULTIPLY');HTP.P('</th>');
  htp.p('<th>FROM_DATE');
  HTP.P('</th>');
  htp.p('<th>TO_DATE');
  HTP.P('</th>');
  htp.p('</tr>'); 
  htp.p('<tr>');
  htp.p('<th><INPUT TYPE="text" id="srcDM_SUBJECT_ID" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  --    htp.p('<th><INPUT TYPE="text" id="srcSUBJ_TYPE_ID" onchange="changeSearch(this)" style="color:black">');HTP.P('</th>');
  --    htp.p('<th><INPUT TYPE="text" id="srcALANY" onchange="changeSearch(this)" style="color:black">');HTP.P('</th>');
  htp.p('<th><select style="color:black">');
  htp.p('<option >- Válasszon -</option>');
  FOR subj_type IN subj_types
  LOOP
    htp.p('<option value = "'||subj_type.r||'">'||subj_type.d||'</option>');
  END LOOP;
  htp.p('</select></th>');
  --    htp.p('<th><INPUT TYPE="text" id="srcSUBJ_PARAM_TYPE_ID" onchange="changeSearch(this)" style="color:black">');HTP.P('</th>');
  htp.p('<th><INPUT TYPE="text" id="srcPARAMETER" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  htp.p('<th><INPUT TYPE="text" id="srcORDER_NO" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  htp.p('<th><INPUT TYPE="text" id="srcMANDATORY" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  --    htp.p('<th><INPUT TYPE="text" id="srcMULTIPLY" onchange="changeSearch(this)" style="color:black">');HTP.P('</th>');
  htp.p('<th><INPUT TYPE="text" class="text_field datePicker"  id="srcFROM_DATE" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  htp.p('<th><INPUT TYPE="text" class="text_field datePicker"  id="srcTO_DATE" onchange="changeSearch(this)" style="color:black">');
  HTP.P('</th>');
  htp.p('</tr>');
  GENERATE_DM_SUBJ_LIST_ROWS(p_subj_type_id);
  htp.p('</table>');
END;

PROCEDURE ADD_LOOKUP_ELEMENT( p_text varchar2, p_dm_subject_id number ) as

  begin
   htp.p(p_text);
   htp.p(p_dm_subject_id);
  end;

FUNCTION SUBJ_IN_TYPE(
      p_subj_id      NUMBER,
      p_subj_type_id NUMBER) 
    RETURN BOOLEAN
  AS
    CURSOR types
    IS
      SELECT * FROM V_SUBJ_SUBJ_TYPE WHERE SUBJ_ID = p_subj_id;
    l_cnt      NUMBER;
    l_group_id NUMBER;
    l_retval   BOOLEAN;
  BEGIN
    SELECT COUNT(1)
    INTO l_cnt
    FROM V_SUBJ_SUBJ_TYPE
    WHERE SUBJ_ID    = p_subj_id
    AND SUBJ_TYPE_ID = p_subj_type_id;
    IF l_cnt         = 0 THEN
      l_retval      := false;
      FOR type IN types
    LOOP
      IF IS_DESCENDENT(type.subj_type_id,p_subj_type_id) THEN
        l_retval := true;
        EXIT;
      END IF;
    END LOOP;
  ELSE
    l_retval := true;
  END IF;
RETURN l_retval;
END SUBJ_IN_TYPE;

END GENERATE_SUBJ_HTML;

/
