--------------------------------------------------------
--  DDL for Package Body GENERATE_DM_SUBJECT_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_DM_SUBJECT_HTML" AS

PROCEDURE SAVE_CHANGES(p_json varchar2) as
  l_json json := json(p_json);
  l_param_json json;
  l_json_list json_list;
  l_cnt number (2,0);
  l_dm_subj_id number(12,0);
  l_param_id number (12,0);
  l_dm_subject_row dm_subject%rowtype;
  l_subject_row subject%rowtype;
  l_value varchar2 (2000);
  l_value_type_id number (12,0);
  l_group_param_type number(12,0);
  l_new_group_param_id number(12,0);

  BEGIN
   
    htp.p('Feldolgozás:'||l_dm_subj_id);

    l_dm_subj_id := json_ext.GET_STRING  (l_json, 'DM_SUBJECT_ID');
    select count(0) into l_cnt from DM_SUBJECT where DM_SUBJECT_ID = l_dm_subj_id;
    if l_cnt = 0 then
      insert into DM_SUBJECT 
        (DM_SUBJECT_ID,SUBJ_TYPE_ID,GROUP_ID,SUBJ_PARAM_TYPE_ID,ORDER_NO,MANDATORY,
         IS_GROUP, MULTIPLY,APPENDABLE,FIELD_TYPE,VALUE_GROUP_TABLE,VALUE_GROUP_ID,DIMENSION_ALLOWED,
         DIMENSION_GROUP_ID)
      VALUES(
          json_ext.GET_STRING  (l_json, 'DM_SUBJECT_ID'),
          json_ext.GET_STRING  (l_json, 'SUBJ_TYPE_ID'),
          json_ext.GET_STRING  (l_json, 'GROUP_ID'),
          json_ext.GET_STRING  (l_json, 'SUBJ_PARAM_TYPE_ID'),
          json_ext.GET_STRING  (l_json, 'ORDER_NO'),
          json_ext.GET_STRING  (l_json, 'MANDATORY'),
          json_ext.GET_STRING  (l_json, 'MULTIPLY'),
          json_ext.GET_STRING  (l_json, 'IS_GROUP'),
          json_ext.GET_STRING  (l_json, 'APPENDABLE'),
          json_ext.GET_STRING  (l_json, 'FIELD_TYPE'),
          json_ext.GET_STRING  (l_json, 'VALUE_GROUP_TABLE'),
          json_ext.GET_STRING  (l_json, 'VALUE_GROUP_ID'),
          json_ext.GET_STRING  (l_json, 'DIMENSION_ALLOWED'),
          json_ext.GET_STRING  (l_json, 'DIMENSION_GROUP_ID')
        );

      htp.p('inserted'); 
    else
     UPDATE DM_SUBJECT SET
--          DM_SUBJECT_ID = json_ext.GET_STRING  (l_json, 'DM_SUBJECT_ID'),
--          SUBJ_TYPE_ID = json_ext.GET_STRING  (l_json, 'SUBJ_TYPE_ID'),
          GROUP_ID = json_ext.GET_STRING  (l_json, 'GROUP_ID'),
          SUBJ_PARAM_TYPE_ID = json_ext.GET_STRING  (l_json, 'SUBJ_PARAM_TYPE_ID'),
          ORDER_NO = json_ext.GET_STRING  (l_json, 'ORDER_NO'),
          MANDATORY = json_ext.GET_STRING  (l_json, 'MANDATORY'),
          MULTIPLY = json_ext.GET_STRING  (l_json, 'MULTIPLY'),
          IS_GROUP = json_ext.GET_STRING  (l_json, 'IS_GROUP'),
          APPENDABLE = json_ext.GET_STRING  (l_json, 'APPENDABLE'),
          FIELD_TYPE = json_ext.GET_STRING  (l_json, 'FIELD_TYPE'),
          VALUE_GROUP_TABLE = json_ext.GET_STRING  (l_json, 'VALUE_GROUP_TABLE'),
          VALUE_GROUP_ID = json_ext.GET_STRING  (l_json, 'VALUE_GROUP_ID'),
          DIMENSION_ALLOWED = json_ext.GET_STRING  (l_json, 'DIMENSION_ALLOWED'),
          DIMENSION_GROUP_ID = json_ext.GET_STRING  (l_json, 'DIMENSION_GROUP_ID')
    where DM_SUBJECT.DM_SUBJECT_ID = l_dm_subj_id;
    htp.p('updated'); 
    end if;
    htp.p(p_json); 


  exception when others then
      htp.p('An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
      htp.p(p_json); 
  END SAVE_CHANGES;    



procedure GENERATE_DM_SUBJ_TYPE_LIST
  AS
  cursor SUPER_TYPES is 
    
  SELECT SUPER_TYP_ID,GROUP_ID,SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(SUPER_TYP_ID) SUPER_TYPE_NAME,
     LEVEL, SYS_CONNECT_BY_PATH(SUPER_TYPE_NAME, '/') PATH
     FROM DM_SUPER_TYP
     where LEVEL > 1
     START WITH SUPER_TYP_ID = 100
     CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID;

begin

  HTP.P('<TABLE id="SubjHeadTable" class="responstable" >');
  HTP.P('<TR>');
  HTP.P('<TH  colspan = 13>');
  HTP.P('<span id="TableCaptionText">');
  htp.p(SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SUBJ_TYPE_SELECTOR_FORM'));
  HTP.P('</span>');
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
--  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('BACK')||'" id ="imgBack" onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'left_32.png">');
--  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" id ="imgOk"   onclick="SaveChanges();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"  style="float:right"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  FOR SUPER_TYPE in SUPER_TYPES loop
    htp.p( '<TR data-subjtypeid="'||SUPER_TYPE.SUPER_TYP_ID ||'" onclick="GoToEditor(this);" >');
    for i in 1..SUPER_TYPE.LEVEL-2 loop
    htp.p( '<TH style="width:20px;">');
    htp.p( '</TH>');
    end loop;
    htp.p( '<TH  colspan = 13>');
    htp.p( SUPER_TYPE.SUPER_TYPE_NAME );
    HTP.P('<span id = "spanAddDescendent"  style="float:right;width:auto" >');
    HTP.P('<img data-id="'||SUPER_TYPE.SUPER_TYP_ID||'" title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD')||'" id ="imgBack" onclick="addDescendant(this);" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');

    HTP.P('</span>');
    htp.p( '</TH>');
    htp.p( '</TR>');
  END LOOP;

  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');

  HTP.P('</TABLE>');
 
end;

PROCEDURE GET_GROUPS_COMBO(p_dm_subject_row dm_subject%rowtype)
  as
  cursor gr is
    select * FROM dm_subject where IS_GROUP = 1; 
begin
  htp.p('<select onchange="dirty(this);">');
  htp.p('<option value="0"> - Válasszon - </option>');
  for g in gr loop
    htp.p('<option value ="'|| g.DM_SUBJECT_ID || '"');
    if g.DM_SUBJECT_ID = p_dm_subject_row.GROUP_ID then 
      htp.p ( 'selected');
    end if;
    htp.p('>');
    htp.p(SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(g.SUBJ_PARAM_TYPE_ID));
   htp.p('</option>');
  end loop;
end; 

function YES_NO_INPUT(p_value number) return varchar2
  as
  begin 
    if p_value = 0 then
       return '<input onchange="dirty(this);" type="checkbox"  >';
    else
       return '<input onchange="dirty(this);" type="checkbox" checked>';
    end if;
  end;

procedure GET_SUPER_TYPE_COMBO(p_group_id number, p_selected number) as

cursor ty is
SELECT SUPER_TYP_ID,GROUP_ID,SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(SUPER_TYP_ID) SUPER_TYPE_NAME,
   LEVEL, SYS_CONNECT_BY_PATH(SUPER_TYPE_NAME, '/') PATH
   FROM DM_SUPER_TYP
   START WITH SUPER_TYP_ID = p_group_id
   CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID;

begin
  htp.p('<select onchange="dirty(this);">');
  htp.p('<option value = "0"> - Válasszon - </option>');
  for t in ty loop
    htp.p('<option value ="'|| t.super_typ_id || '"');
    if  t.super_typ_id  = p_selected then 
      htp.p ( 'selected');
    end if;
    htp.p('>');
    htp.p(SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(t.super_typ_id));
   htp.p('</option>');
  end loop;
end;

procedure GET_SUBJ_PARAM_COMBO( p_selected number) AS
begin
   GET_SUPER_TYPE_COMBO(11000,p_selected);
end;

procedure GET_FIELD_TYPE_COMBO( p_selected varchar2) as
  TYPE TypeList IS TABLE OF VARCHAR2(16);
   types TypeList;
  begin
  types := TypeList('TEXT', 'SELECT', 'DATE', 'LOCATION');
  htp.p('<select onchange="dirty(this);">');
  htp.p('<option  value = "0"> - Válasszon - </option>');
  for i in types.FIRST .. types.LAST loop
    htp.p('<option value ="'|| types(i) || '"');
    if types(i)  = p_selected then 
      htp.p ( ' selected');
    end if;
    htp.p('>');
    htp.p(types(i));
   htp.p('</option>');
  end loop;
  
  end;

procedure GET_VAULE_TABLE_COMBO( p_selected varchar2 ) as
  TYPE TableNameList IS TABLE OF VARCHAR2(16);
   tableNames TableNameList;
begin
   tableNames := TableNameList('SUBJECT', 'DM_LANGUAGE', 'DM_COUNTRY', 'DM_CITY', 'DM_SUPER_TYP');
  htp.p('<select onchange="dirty(this);">');
  htp.p('<option  value = ""> - Válasszon - </option>');
  for i in tableNames.FIRST .. tableNames.LAST loop
    htp.p('<option value ="'|| tableNames(i) || '"');
    if tableNames(i)  = p_selected then 
      htp.p ( ' selected');
    end if;
    htp.p('>');
    htp.p(tableNames(i));
   htp.p('</option>');
  end loop;
end;

procedure GET_VALUE_GROUP_ID ( p_dm_subject_row dm_subject%rowtype ) as
  CURSOR OPTIONS_SUBJ(p_group_id NUMBER)
  IS
    SELECT * FROM V_SUBJECTIV WHERE SUBJ_CATEGORY_ID = p_group_id order by SUBJ_NAME ;
  l_table_name varchar2 (255) := p_dm_subject_row.VALUE_GROUP_TABLE;
begin
    if l_table_name =    'DM_SUPER_TYP' then
      null;
    elsif l_table_name = 'SUBJECT' then
      null;
    elsif l_table_name = 'DM_LANGUAGE' then
      null;
    elsif l_table_name = 'DM_COUNTRY' then
      null;
    elsif l_table_name = 'DM_CITY' then
      null;
    else
      null;
    end if;
 
end;

PROCEDURE GET_DM_SUBJECT_ROW_EDITOR_FORM(p_dm_subject_row dm_subject%rowtype)
  AS

  BEGIN
HTP.P('<TABLE  class="responstable" >');
 
  HTP.P('<TR>');
  HTP.P('<TH colspan = 13>');
  HTP.P('<span id="HeadTableCaptionText">');
  HTP.P('DM_SUBJECT_EDITOR_FORM');
  HTP.P(p_dm_subject_row.DM_SUBJECT_ID);
  HTP.P('</span>');
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('BACK')||'" id ="imgBack" onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'left_32.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" id ="imgOk"   onclick="SaveChanges();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"  style="float:right"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');

  HTP.P('<TR data-colname = "DM_SUBJECT_ID"><th>DM_SUBJECT_ID</th><td class="readonly"> <input type="hidden" value="'|| p_dm_subject_row.DM_SUBJECT_ID ||'">'||p_dm_subject_row.DM_SUBJECT_ID||'</td></tr>' );
  HTP.P('<TR data-colname = "SUBJ_TYPE_ID"><th>SUBJ_TYPE_ID</th><td  class="readonly"><input type="hidden" value="'|| p_dm_subject_row.SUBJ_TYPE_ID ||'">'||super_typ_tapi.lookup_super_type_name(p_dm_subject_row.SUBJ_TYPE_ID)||p_dm_subject_row.SUBJ_TYPE_ID||'</td></tr>' );
  HTP.P('<TR data-colname = "GROUP_ID"><th>GROUP_ID</th><td>' );
  GET_GROUPS_COMBO(p_dm_subject_row);
  HTP.P(  '</td></tr>' );
  HTP.P('<TR data-colname ="SUBJ_PARAM_TYPE_ID"><th>SUBJ_PARAM_TYPE_ID</th><td>');
  GET_SUBJ_PARAM_COMBO(p_dm_subject_row.SUBJ_PARAM_TYPE_ID);
  HTP.P('</td></tr>' );
  HTP.P('<TR data-colname ="ORDER_NO"><th>ORDER_NO</th><td><input onchange="dirty(this);" type = "text" value="'||p_dm_subject_row.ORDER_NO||'"></td></tr>' );
  HTP.P('<TR data-colname ="MANDATORY"><th>MANDATORY</th><td>'||YES_NO_INPUT(p_dm_subject_row.MANDATORY)||'</td></tr>' );
  HTP.P('<TR data-colname ="MULTIPLY"><th>MULTIPLY</th><td>'||YES_NO_INPUT(p_dm_subject_row.MULTIPLY)||'</td></tr>' );
  HTP.P('<TR data-colname ="IS_GROUP"><th>IS_GROUP</th><td>'||YES_NO_INPUT(p_dm_subject_row.IS_GROUP)||'</td></tr>' );
  HTP.P('<TR data-colname ="APPENDABLE"><th>APPENDABLE</th><td>'||YES_NO_INPUT(p_dm_subject_row.APPENDABLE)||'</td></tr>' );
  HTP.P('<TR data-colname ="FIELD_TYPE"><th>FIELD_TYPE</th><td>');
  GET_FIELD_TYPE_COMBO(p_dm_subject_row.FIELD_TYPE);
  HTP.P('</td></tr>' );  
  HTP.P('<TR data-colname ="VALUE_GROUP_TABLE"><th>VALUE_GROUP_TABLE</th><td>');
  GET_VAULE_TABLE_COMBO( p_dm_subject_row.VALUE_GROUP_TABLE );
  HTP.P('</td></tr>' );
  HTP.P('<TR data-colname ="VALUE_GROUP_ID"><th>VALUE_GROUP_ID</th><td><input onchange="dirty(this);" type = "text" value="'||p_dm_subject_row.VALUE_GROUP_ID||'"></td></tr>' );
  HTP.P('</td></tr>' );
  HTP.P('<TR data-colname ="DIMENSION_ALLOWED"><th>DIMENSION_ALLOWED</th><td>'||YES_NO_INPUT(p_dm_subject_row.DIMENSION_ALLOWED)||'</td></tr>' );
  HTP.P('<TR data-colname ="DIMENSION_GROUP_ID"><th>DIMENSION_GROUP_ID</th><td><input onchange="dirty(this);" type = "text" value="'||p_dm_subject_row.DIMENSION_GROUP_ID||'"></td></tr>' );  
  HTP.P('<TR data-colname ="MEDIA"><th>MEDIA</th><td>'||YES_NO_INPUT(p_dm_subject_row.MEDIA)||'</td></tr>' );
  HTP.P('</TABLE>');
END;

PROCEDURE GET_DM_SUBJECT_ROW_INSERT(p_subj_type number, p_group_id number)
AS 
  l_dm_subject_id number (12,0);
  l_dm_subject_row dm_subject%rowtype;
BEGIN
  select SEQ_BASE.NEXTVAL INTO l_dm_subject_id FROM DUAL;
  l_dm_subject_row.DM_SUBJECT_ID := l_dm_subject_id;
  l_dm_subject_row.SUBJ_TYPE_ID := p_subj_type;
  l_dm_subject_row.GROUP_ID := p_group_id;
  GET_DM_SUBJECT_ROW_EDITOR_FORM(l_dm_subject_row);
END;

PROCEDURE GET_DM_SUBJECT_ROW_EDIT(p_dm_subject_id number)
AS
  l_dm_subject_row dm_subject%rowtype;
BEGIN
  SELECT * INTO l_dm_subject_row FROM  dm_subject where DM_SUBJECT_ID = p_dm_subject_id;
  GET_DM_SUBJECT_ROW_EDITOR_FORM(l_dm_subject_row);
END;

PROCEDURE GET_TR(p_dm_subject_row dm_subject%rowtype, p_subrow boolean default false) 
  AS
BEGIN
  htp.p( '<TR data-id="'|| p_dm_subject_row.DM_SUBJECT_ID ||'"');
  if p_subrow = true then
    HTP.P( ' data-group="'|| p_dm_subject_row.DM_SUBJECT_ID||'"');
  end if;
  if p_dm_subject_row.IS_GROUP = 1 then
     htp.p( ' onclick="toggleGroup(this);"');
  end if;
  if  p_subrow = true then
     htp.p( ' style =" display: none;"');
  end if;
  htp.p( '>' );
END;


PROCEDURE GET_SINGLE_ROW(p_dm_subject_row dm_subject%rowtype)
  AS

BEGIN
-- htp.p( '<TR data-dmsubjid="'|| p_dm_subject_row.DM_SUBJECT_ID ||'" onclick="GoToEditor(this);" >');
    GET_TR(p_dm_subject_row);
    htp.p( '<TD  colspan = 13>');
    htp.p( super_typ_tapi.lookup_super_type_name( p_dm_subject_row.SUBJ_PARAM_TYPE_ID )||' ['||p_dm_subject_row.order_no||']');
      HTP.P('<span id = "spanAddChild"  style="float:right;width:auto;" >');
--      HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD')||'" id ="imgBack"  style=";display:none;"onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
      HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('EDIT')||'" id ="imgOk"     onclick="EditDmSubj(this);" src="'||v('WORKSPACE_IMAGES')|| 'Write Document.png">');
      HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"   style="float:right;"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');  
  HTP.P('</span>');

    htp.p( '</TD>');
    htp.p( '</TR>');
end;

PROCEDURE GET_GROUP_ROW(p_dm_subject_row dm_subject%rowtype, p_subj_type number)
AS
BEGIN
--    htp.p( '<TR data-dmsubjid="'|| p_dm_subject_row.DM_SUBJECT_ID ||'" onclick="GoToEditor(this);" >');
  GET_TR(p_dm_subject_row);
  htp.p( '<TH  colspan = 13>');
  htp.p( super_typ_tapi.lookup_super_type_name( p_dm_subject_row.SUBJ_PARAM_TYPE_ID )||' ['||p_dm_subject_row.order_no||']' );
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto;" >');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD')||'" id ="imgBack"    onclick="AddDmSubj(this);" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('EDIT')||'" id ="imgOk"     onclick="EditDmSubj(this);" src="'||v('WORKSPACE_IMAGES')|| 'Write Document.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"  style="float:right;"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  HTP.P('</span>');

    htp.p( '</TD>');
    htp.p( '</TH>');

--    htp.p( '<TR data-dmsubjid="'|| p_subj_type ||'" onclick="GoToEditor(this);" >');
    GET_TR(p_dm_subject_row, true);
    htp.p( '<TD  colspan = 13>');
    GET_DM_SUBJ_EDITOR_TABLE(p_subj_type,p_dm_subject_row.DM_SUBJECT_ID );
    htp.p( '</TD>');
    htp.p( '</TR>');
end;
   
 
PROCEDURE GET_DM_SUBJ_EDITOR_ROW(p_dm_subject_row dm_subject%rowtype, p_subj_type number)
AS 
begin  
  if p_dm_subject_row.is_group = 0 then
     GET_SINGLE_ROW(p_dm_subject_row);
  else
     GET_GROUP_ROW(p_dm_subject_row,p_subj_type);
  end if;
end;

FUNCTION GET_DM_SUBJECT_ROWS(p_subj_type_id number, p_group_id number) 
  RETURN DmSubTabTyp
AS
 cursor rows is 
 select * from dm_subject where 
    subj_type_id IN
      (
         SELECT SUPER_TYP_ID /*,GROUP_ID,SUPER_TYPE_NAME,
         LEVEL, SYS_CONNECT_BY_PATH(SUPER_TYPE_NAME, '/') PATH */
         FROM DM_SUPER_TYP
         START WITH SUPER_TYP_ID = p_subj_type_id
         CONNECT BY PRIOR GROUP_ID = SUPER_TYP_ID
      )
    and  group_id = p_group_id
    order by ORDER_NO;
    DmSubTab DmSubTabTyp;
    found boolean;
BEGIN
--  htp.p('<br>p_subj_type_id:' || p_subj_type_id || ' p_group_id:' ||p_group_id);
  DmSubTab := DmSubTabTyp();     
   FOR row in rows loop   
      found := false; 
      FOR i IN 1 .. DmSubTab.count() loop
        if DmSubTab(i).SUBJ_PARAM_TYPE_ID = row.SUBJ_PARAM_TYPE_ID then
          DmSubTab(i) := row; 
          found := true ;    
          exit;
        end if;
        
      end loop; 
      if found = false then
        DmSubTab.EXTEND;
        DmSubTab(DmSubTab.LAST) := row;    
      end if;  
   END LOOP;
  RETURN DmSubTab;
END;


PROCEDURE GET_DM_SUBJ_EDITOR_TABLE(p_subj_type_id number, p_group_id number default 0)
  as

DmSubTab DmSubTabTyp;

begin
  DmSubTab := GET_DM_SUBJECT_ROWS(p_subj_type_id,p_group_id);

  HTP.P('<TABLE  class="responstable datatable" >');
  HTP.P('<TR>');
--  HTP.P('<TD>');
--  HTP.P('p_subj_type_id='||p_subj_type_id||',p_group_id='||  p_group_id );
--  HTP.P('</TD>');
  HTP.P('</TR>');
  FOR i IN 1 .. DmSubTab.count() loop     
    GET_DM_SUBJ_EDITOR_ROW(DmSubTab(i),p_subj_type_id);
  END LOOP;
  HTP.P('</TABLE>');
end;



PROCEDURE GET_DM_SUBJ_EDITOR(p_subj_type_id number)
 
AS
 
BEGIN
 -- GET_SUPER_TYP_POPUP;
  HTP.P('<TABLE  class="responstable" >');
 
  HTP.P('<TR>');
  HTP.P('<TH  colspan = 13>');
  HTP.P('<span id="HeadTableCaptionText">');
  HTP.P( SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(p_subj_type_id) ||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SUBJ_TYPE_RULE_EDITOR'));
  HTP.P('</span>');
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('BACK')||'" id ="imgBack" onclick="goBack();" src="'||v('WORKSPACE_IMAGES')|| 'left_32.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SAVE')||'" id ="imgOk"   onclick="SaveChanges();" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD')||'"  id ="imgAddTop" onclick="AddDmSubj(0);" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp" style="float:right" onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  
  HTP.P('</span>');
  HTP.P('</TH>');
  HTP.P('</TR>');
  HTP.P('</TABLE>');

  GET_DM_SUBJ_EDITOR_TABLE(p_subj_type_id);
 
END;



END GENERATE_DM_SUBJECT_HTML;

/
