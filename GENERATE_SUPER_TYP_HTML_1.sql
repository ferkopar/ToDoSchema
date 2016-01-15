--------------------------------------------------------
--  DDL for Package Body GENERATE_SUPER_TYP_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_SUPER_TYP_HTML" AS

PROCEDURE SAVE_CHANGES(p_json varchar2) as
  l_json json := json(p_json);
  l_param_json json;
  l_json_list json_list;
  l_cnt number (2,0);
  l_super_typ_id number(12,0);


  BEGIN
   
    

    l_super_typ_id := json_ext.GET_STRING  (l_json, 'SUPER_TYP_ID');
    htp.p('Feldolgozás:'||l_super_typ_id);
    select count(0) into l_cnt from DM_SUPER_TYP where SUPER_TYP_ID = l_super_typ_id;
    if l_cnt = 0 then
      insert into DM_SUPER_TYP
        (SUPER_TYP_ID,SUPER_TYPE_NAME,SUPER_TYPE_SHORT_NAME,GROUP_ID,ROLL_TYPE,GROUND_LEVEL_ID)
      VALUES(
          json_ext.GET_STRING  (l_json, 'SUPER_TYP_ID'),
          json_ext.GET_STRING  (l_json, 'SUPER_TYPE_NAME'),
          json_ext.GET_STRING  (l_json, 'SUPER_TYPE_SHORT_NAME'),
          json_ext.GET_STRING  (l_json, 'GROUP_ID'),
          json_ext.GET_STRING  (l_json, 'ROLL_TYPE'),
          SUPER_TYP_TAPI.SEARCH_GROUND_LEVEL_ID(json_ext.GET_STRING  (l_json, 'GROUP_ID'))
        );

      htp.p('inserted'); 
    else
     UPDATE DM_SUPER_TYP SET
--          DM_SUBJECT_ID = json_ext.GET_STRING  (l_json, 'DM_SUBJECT_ID'),
--          SUBJ_TYPE_ID = json_ext.GET_STRING  (l_json, 'SUBJ_TYPE_ID'),
          SUPER_TYPE_NAME = json_ext.GET_STRING  (l_json, 'SUPER_TYPE_NAME'),
          SUPER_TYPE_SHORT_NAME = json_ext.GET_STRING  (l_json, 'SUPER_TYPE_SHORT_NAME'),
          ROLL_TYPE = json_ext.GET_STRING  (l_json, 'ROLL_TYPE')
    where SUPER_TYP_ID = l_super_typ_id;
    htp.p('updated'); 
    end if;
    htp.p(p_json); 


  exception when others then
      htp.p('An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
      htp.p(p_json); 
  END SAVE_CHANGES;    



PROCEDURE GENERATE_FIELD(p_mnemo varchar2, p_value varchar2 default null, p_attr varchar2  default null) as
l_attr varchar2 (200);
begin
    if p_attr is not null then
       l_attr := p_attr;
    else 
--      if USER_ROLE_LEVEL(v('APP_USER')) > 0 then
--       l_attr := 'disabled';
--      else
       l_attr := null;
--      end if;
    end if;
    htp.p('<th>'||SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME(p_mnemo)||'</th>');
    htp.p('<td id = "'||p_mnemo||'" data-id="'||p_mnemo||'" ><input onchange=dirty(this) type="text" value="'|| p_value ||'"'||l_attr||'></td>');
end;

PROCEDURE GENERATE_SUPER_TYP_EDITOR (p_super_typ_id number, p_group_id number default null) as
cursor languages is
  select * from DM_LANGUAGE where STATUS_ID = 3;

v_row dm_super_typ%rowtype;
v_add BOOLEAN;



BEGIN
 if p_super_typ_id is not null then
  select * into v_row FROM DM_SUPER_TYP where SUPER_TYP_ID  = p_super_typ_id;
 else
  select SEQ_BASE.NEXTVAL into v_row.super_typ_id from DUAL;
  v_row.GROUP_ID := p_group_id;
 end if;
 htp.p('<TABLE id = "typeTable"  class="responstable">');
 htp.p('<tr>');
 htp.p('<th colspan=10>');
 IF p_super_typ_id is null then
    htp.p(SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('SUPER_TYPE_ADD'));
    v_add := true;
 ELSE
    htp.p(SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('SUPER_TYPE_EDIT'));
    v_add := false;
 END IF;
 HTP.P('<SPAN class="right">');
 HTP.P('<button type="button"  onclick="GoBack()">'|| SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('BACK') ||'</button>');
-- HTP.P('<button type="button"  onclick="CreateChild()">'|| SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('NEW_CHILD') ||'</button>');
-- if USER_ROLE_LEVEL(v('APP_USER')) = 0 then
--  HTP.P('<button type="button"  onclick="Clear()">'|| DM_SUPER_TYP_tapi.LOOKUP_NAME('NEW_SUPER_TYPE') ||'</button>');
-- end if;
 HTP.P('<button type="button"  onclick="SaveChanges()">'|| SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('SAVE') ||'</button>');
 HTP.P('</SPAN>');
 htp.p('</th>');
 htp.p('</tr>');
 htp.p('<tr>');
 GENERATE_FIELD('SUPER_TYP_ID',v_row.super_typ_id,'disabled');
 GENERATE_FIELD('SUPER_TYPE_NAME',v_row.super_type_name);
 GENERATE_FIELD('SUPER_TYPE_SHORT_NAME',v_row.SUPER_TYPE_SHORT_NAME);
 htp.p('</tr>');

 htp.p('<tr>');
 GENERATE_FIELD('GROUP_ID',v_row.GROUP_ID);
 GENERATE_FIELD('SUPER_GROUP_NAME',SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME(v_row.GROUP_ID),'disabled');
 GENERATE_FIELD('ROLL_TYPE',0);
 htp.p('</tr>');
 if v_add = false then
   htp.p('<tr>');
   GENERATE_FIELD('GROUND_LEVEL_ID',SUPER_TYP_tapi.SEARCH_GROUND_LEVEL_ID(p_super_typ_id),'disabled');
   GENERATE_FIELD('GROUND_LEVEL_NAME',SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME(SUPER_TYP_tapi.SEARCH_GROUND_LEVEL_ID(p_super_typ_id)),'disabled');
   --GENERATE_FIELD('SUPER_TYPE_SHORT_NAME');
   htp.p('</tr>');
 end if;
 HTP.P('</TABLE>');


 htp.p('<TABLE  id = "translateTable" class="responstable">');
 htp.p('<tr>');
 
 htp.p('<th colspan=10>'||SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME('TRANSLATE')||'</th>');
 htp.p('</tr>');

 for language in languages loop
     htp.p('<tr data-langid = "'||language.LANGUAGE_ID ||'">');
       htp.p('<th style="width:50px">');
       htp.p('<img src="f?p='||v('APP_ID')||':7:'|| v('APP_SESSION') ||':APPLICATION_PROCESS=nagyZaszlo:::LANGUAGE:'|| language.LANGUAGE_ID ||'" style="float: left">');
       htp.p('</th>');
       htp.p('<td class="text"><input onchange=dirty(this) type="text" value="'|| SUPER_TYP_tapi.LOOKUP_SUPER_TYPE_NAME(v_row.super_typ_id,language.LANGUAGE_ID) ||'"></td>');
     htp.p('</tr>');
 end loop;
HTP.P('</TABLE>');
 
END;

PROCEDURE GENERATE_SUPER_TYP_TOP_LEVEL
  AS
  cursor superTypes is
    select * FROM DM_SUPER_TYP WHERE GROUP_ID is null or GROUP_ID = 0 order by SUPER_TYPE_NAME;
  BEGIN
  HTP.P('<TABLE id="SuperTypeTable" class="responstable" >');
  HTP.P('<THEAD>');
  HTP.P('<TR>');
  HTP.P('<TH  colspan = 13>');
  HTP.P('<span id="TableCaptionText">');
  htp.p(SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('SUBJ_TYPE_SELECTOR_FORM'));
  HTP.P('</span>');
  HTP.P('<span id = "spanAddChild"  style="float:right;width:auto" >');
  HTP.P('<img title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('HELP')||'" id ="imgHelp"  style="float:right"   onclick="callHelpPopup();" src="'||v('WORKSPACE_IMAGES')|| 'help.png">');
  HTP.P('</span>');
  htp.p( '</TH>');  
  HTP.P('</TR>');
  HTP.P('</THEAD>');

  HTP.P('</TBODY>');
  for superType in superTypes loop
    htp.p( '<TR data-typid="'||superType.SUPER_TYP_ID ||'" onclick="LoadTree(this);" >');
    htp.p( '<TH  colspan = 13>');
    htp.p( super_typ_tapi.lookup_super_type_name(superType.SUPER_TYP_ID) );
    htp.p( '</TH>');  
  end loop;
  HTP.P('</TBODY>');
  HTP.P('</TABLE>');
  END;

  PROCEDURE GENERATE_TREE_TABLE_ROWS(p_group_id number) as
   
    cursor descendants is
   SELECT SUPER_TYP_ID,GROUP_ID,SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(SUPER_TYP_ID) SUPER_TYPE_NAME,
   LEVEL, SYS_CONNECT_BY_PATH(SUPER_TYPE_NAME, '/') PATH
   FROM DM_SUPER_TYP
   START WITH SUPER_TYP_ID = p_group_id
   CONNECT BY PRIOR SUPER_TYP_ID = GROUP_ID;
    begin
        FOR descendant in descendants loop
    htp.p( '<TR data-typeid="'||descendant.SUPER_TYP_ID ||'" onclick="GoToEditor(this);" >');
    for i in 1..descendant.LEVEL-2 loop
    htp.p( '<TH style="width:20px;">');
    htp.p( '</TH>');
    end loop;
    htp.p( '<TH  colspan = 13>');
     htp.p( super_typ_tapi.lookup_super_type_name(descendant.SUPER_TYP_ID) );
        HTP.P('<span id = "spanAddDescendent"  style="float:right;width:auto" >');
        HTP.P('<img data-id="'||descendant.SUPER_TYP_ID||'" title="'||SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME('ADD')||'" id ="imgBack" onclick="addDescendant(this);" src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
    htp.p( '</TH>');
    htp.p( '</TR>');
  END LOOP;
    end;
END GENERATE_SUPER_TYP_HTML;

/
