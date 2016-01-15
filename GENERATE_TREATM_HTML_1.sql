--------------------------------------------------------
--  DDL for Package Body GENERATE_TREATM_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_TREATM_HTML" AS

PROCEDURE GENERATE_TREATM_LIST( p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE)
AS
CURSOR TREATMS IS
  select 
 "TREATM_ID",
 "TREATM_ID" ID,
 TREATM_NAME AS TREATM_NAME,
 -- lookup_super_type_name("TREATM_GROUP_ID") TREATM_GROUP_NAME,
 lookup_super_type_name("TREATM_TYPE_ID") TREATM_TYPE_NAME,
 lookup_super_type_name("TREATM_CATEGORY_ID") TREATM_CATEGORY_NAMe,
 FROM_DATE,
 TO_DATE 
from TREATM
where TREATM_GROUP_ID = p_treatm_group_id or p_treatm_group_id is NULL;

BEGIN
  HTP.P('<TABLE id="TreatmTable" class="responstable" >');
 HTP.P('<TR>');
 HTP.P('<TH colspan = 13>');
 HTP.P(lookup_super_type_name(p_treatm_group_id));
 HTP.P('<span onclick="goToEdit(0)" id = "spanAdd" class="hot"  style="float:right" >');
 HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
 HTP.P('</span>');
 HTP.P('</TH>'); 

 HTP.P('</TR>');

 HTP.P('<TR>');
 htp.p('<th></th>');
 HTP.P('<TH>TREATM_NAME <span style="float:right" > <img class="sortImg" data-col="TREATM_NAME" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span></TH>'); 
 HTP.P('<TH>TREATM_CATEGORY_NAME <span style="float:right" > <img class="sortImg" data-col="TREATM_CATEGORY_NAME" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span></TH>'); 
 HTP.P('<TH>TREATM_TYPE_ID <span style="float:right" > <img class="sortImg" data-col="TREATM_TYPE_ID" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span></TH>'); 
 HTP.P('<TH>FROM_DATE <span style="float:right" > <img class="sortImg" data-col="FROM_DATE" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span></TH>'); 
 HTP.P('<TH>TO_DATE <span style="float:right" > <img class="sortImg" data-col="TO_DATE" onclick="changeOrder(this)" src="'||v('WORKSPACE_IMAGES')|| 'sort-icon.png" data-ord="none"> </span></TH>'); 


 HTP.P('</TR>');

 HTP.P('<TR>');
 htp.p('<th></th>');
 HTP.P('<TH><INPUT TYPE="text" id="srcTREATM_NAME" onchange="changeSearch(this)" style="color:black"></TH>'); 
 HTP.P('<TH><INPUT TYPE="text" id="srcTREATM_CATEGORY_NAME" onchange="changeSearch(this)" style="color:black"></TH>'); 
 HTP.P('<TH><INPUT TYPE="text" id="srcTREATM_TYPE_ID" onchange="changeSearch(this)" style="color:black"></TH>'); 
 HTP.P('<TH><INPUT TYPE="text" id="srcFROM_DATE" class="text_field datePicker"  onchange="changeSearch(this)" style="color:black"></TH>'); 
 HTP.P('<TH><INPUT TYPE="text" id="srcTO_DATE" class="text_field datePicker"  onchange="changeSearch(this)" style="color:black"></TH>'); 
 HTP.P('</TR>');
 FOR treatm in treatms loop
      htp.p('<tr class="dataRow" onclick="goToEdit('|| treatm.TREATM_ID ||')">');    
        htp.p('<td class = "hot">');
        HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'File_Edit.png">');
        htp.p('</td>');
        htp.p('<td>'|| treatm.TREATM_NAME ||'</td>');
        htp.p('<td>'|| treatm.TREATM_CATEGORY_NAME ||'</td>');
        htp.p('<td>'|| treatm.TREATM_TYPE_NAME ||'</td>');
        htp.p('<td>'|| to_char(treatm.FROM_DATE,'YYYY.MM.DD') ||'</td>');
        htp.p('<td>'|| to_char(treatm.TO_DATE,'YYYY.MM.DD') ||'</td>');

     HTP.P('</TR>');
 end loop;
 HTP.P('</TABLE>');
END GENERATE_TREATM_LIST; 

PROCEDURE GENERATE_TREATM_ROW_FORM (p_treatm_id TREATM.TREATM_ID%TYPE,
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
-- GENERATE_HTML.GET_SUPER_TYP_POPUP();
-- GENERATE_HTML.GET_SUBJECT_POPUP();
 
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
 HTP.P('<button type="button"  onclick="window.location = ''f?p='||V('APP_ID')||':301:'||V('APP_SESSION')||'::::P3202_TREATM_NAME:'||p_treatm_id||''';">Vissza</button>');
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
  GENERATE_HTML.SEND_SELECT_LIST(l_treatm_row.treatm_category_id,l_treatm_row.treatm_group_id,'TREATM','TREATM_CATEGORY_ID',l_is_fact);
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
   GENERATE_HTML.SEND_SELECT_LIST(l_treatm_row.treatm_type_id,1308590010,l_is_fact);
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
--     GENERATE_HTML.SEND_SUBJ_LIST(l_treatm_row.TYPE1_ID,l_treatm_row.SUBJ1_ID );
     HTP.P('<span id = "spanAddType1Id"  style="float:right"  onclick="AddSubject(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>'); 
     HTP.P('</TD>');
     HTP.P('<TH>');HTP.P(lookup_super_type_name(l_treatm_row.TYPE2_ID));HTP.P('</TH>');
     HTP.P('<TD id = "SUBJ2_ID">');
--     GENERATE_HTML.SEND_SUBJ_LIST(l_treatm_row.TYPE2_ID,l_treatm_row.SUBJ2_ID );
     HTP.P('<span id = "spanAddType2Id"  style="float:right"  onclick="AddSubject(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>');

     HTP.P('</TD>');
     HTP.P('</TR>');
  else
     HTP.P('<TR>');
     HTP.P('<TH>');HTP.P('Type1 Id');HTP.P('</TH>');
     HTP.P('<TD id = "TYPE1_ID">');
     GENERATE_HTML.SEND_SELECT_LIST(l_treatm_row.TYPE1_ID,l_treatm_row.treatm_group_id,'TREATM','TYPE1_ID',l_is_fact);
      HTP.P('<span id = "spanAddType1Id"  style="float:right"  onclick="AddSuperTyp(this); return false;">');
       HTP.P('<img src="'||v('WORKSPACE_IMAGES')|| 'Add Green Button.png">');
       HTP.P('</span>');
     HTP.P('</TD>');
     HTP.P('<TH>');HTP.P('Type2 Id');HTP.P('</TH>');
     HTP.P('<TD id = "TYPE2_ID">');
     GENERATE_HTML.SEND_SELECT_LIST(l_treatm_row.TYPE2_ID,l_treatm_row.treatm_group_id,'TREATM','TYPE2_ID',l_is_fact);

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
END GENERATE_TREATM_ROW_FORM;

END GENERATE_TREATM_HTML;

/
