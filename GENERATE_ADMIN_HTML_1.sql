--------------------------------------------------------
--  DDL for Package Body GENERATE_ADMIN_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_ADMIN_HTML" AS

procedure GENERATE_ALERTS AS

cursor alerts is
  select *
 from ALERT ALERT
  where ALERT.ALERT_STATUS = 90901 ; 


BEGIN

htp.p('<table class="responstable">');
htp.p('<tr>');

htp.p('<th>');
htp.p('Típus');
htp.p('</th>');

htp.p('<th>');
htp.p('&nbsp;');
htp.p('</th>');

htp.p('<th>');
htp.p('Prioritás');
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
   htp.p('<td>');
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
 htp.p('<img onclick="goExec(this)" data-alertId="'||alert.alert_id ||'" src="'||V('WORKSPACE_IMAGES')||'Write Document.png">');

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
  htp.p(alert.message_text);

  htp.p('</td');
  
  
  htp.p('</tr>');

end loop;

htp.p('</table');

end GENERATE_ALERTS;


PROCEDURE GENERATE_CONFIRM_PAGE(p_alert_id NUMBER)
AS

cursor subjects is
  select V_SUBJECTIV.*
  ,SUBJ_PARAM.PARAM_TYPE_ID
  ,SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(SUBJ_PARAM.PARAM_TYPE_ID) 
  ,SUBJ_PARAM.VALUE
  from V_SUBJECTIV,SUBJ_PARAM WHERE SUBJ_PARAM.SUBJ_ID = V_SUBJECTIV.SUBJ_ID
  and VALUE = '1300';

cursor types(c_group_id number) IS
  SELECT SUPER_TYP_TAPI.LOOKUP_SUPER_TYPE_NAME(DM_SUPER_TYP.SUPER_TYP_ID)
    , DM_SUPER_TYP.SUPER_TYP_ID
  FROM DM_SUPER_TYP
    WHERE GROUP_ID = c_group_id;

l_alert_row alert%rowtype;
l_table varchar2(50);
l_id number (12,0);



l_super_type_row dm_super_typ%rowtype;
l_subject subject%rowtype;

BEGIN

select * into l_alert_row from alert where alert_id = p_alert_id;
select value into l_table FROM ALERT_PARAM where ALERT_PARAM.alert_id = l_alert_row.alert_id AND PARAM_TYPE_ID = 90201;
select value into l_id FROM ALERT_PARAM where ALERT_PARAM.alert_id = l_alert_row.alert_id AND PARAM_TYPE_ID = 90202;

htp.p('<table class="responstable">');
htp.p('<tr>');
htp.p('<th colspan = 2>');
if l_table = 'DM_SUPER_TYP' then 
   htp.p( 'Az új típus :'||super_typ_tapi.lookup_super_type_name(l_id) );
elsif l_table = 'SUBJECT' then 
   htp.p( 'Az új típus :'||subject_tapi.get_subject_name(l_id) );
end if;
htp.p('</th>');
htp.p('</tr>');

htp.p('<tr>');
htp.p('<td style="width:70px">');
  HTP.P('<img id ="imgAccept"  onclick="accept('|| p_alert_id ||');" src="'||v('WORKSPACE_IMAGES')|| 'Clear Green Button.png">');
htp.p('</td>');
htp.p('<td>');
htp.p('<select onchange="decline()">');
  if l_table = 'DM_SUPER_TYP' then
for typ in types(super_typ_tapi.lookup_group_id(l_id)) loop
htp.p('<option>'||super_typ_tapi.lookup_super_type_name(typ.super_typ_id)||'</option>');
end loop;
 elsif l_table = 'SUBJECT' then  
     for subj in subjects loop
htp.p('<option>'||subj.subj_name||'</option>');
end loop;
  end if;


htp.p('</select>');
htp.p('</td>');
htp.p('</tr>');



htp.p('</table');

END;

PROCEDURE INVALIDATE_ALERT(p_alert_id NUMBER)
  as
  begin
    update ALERT SET ALERT_STATUS = 90902 WHERE ALERT_ID = p_alert_id;
    htp.p('success');
end INVALIDATE_ALERT;

END GENERATE_ADMIN_HTML;

/
