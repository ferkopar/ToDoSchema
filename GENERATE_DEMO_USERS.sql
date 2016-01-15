--------------------------------------------------------
--  DDL for Procedure GENERATE_DEMO_USERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GENERATE_DEMO_USERS" 
AS
  l_next_subj_id number (12,0);
  l_first_name varchar2(200);
  l_last_name varchar2(200);
  l_sex varchar2(1);
  l_sex_id  number(12,0);
  l_dummy varchar2(1);
  l_new_group  number(12,0);
  l_date_str_born varchar2(200); 
  l_year_born  number (4,0);

  TYPE gyarArray IS VARRAY(10) of VARCHAR2(100);
  v_gyarray gyarArray;

  TYPE refArray IS VARRAY(5) of VARCHAR2(100);
  v_rarray refArray;

    TYPE beoArray IS VARRAY(11) of VARCHAR2(100);
  v_beoarray beoArray;

  TYPE feladArray IS VARRAY(11) of VARCHAR2(100);
  v_feladarray feladArray;

  TYPE csopArray IS VARRAY(11) of VARCHAR2(100);
  v_csoparray csopArray;

   TYPE teveArray IS VARRAY(11) of VARCHAR2(100); 
  v_tevearray teveArray;

     TYPE szervArray IS VARRAY(11) of VARCHAR2(100); 
  v_szervarray szervArray;

BEGIN

   v_gyarray := gyarArray('T-SYSTEM', 'Váti', 'FÖMI', 'A vállalat','B vállalat','C vállalat','C vállalat','D vállalat','E vállalat','F vállalat');
   v_rarray := refArray('Kiss Péter','Nagy Pál','Kurucz László','Bazsa Boldizsár','Kapor Anasztáz');
   v_beoarray := beoArray('Projekt vezetõ','Csoport vezetõ','Térinformatikai ov','Térinformatikus','Adatbázis tervezõ','Rendszer architektúra tervezõ','Minõségbiztosító','Hálózat fejlesztõ','Hálózat tervezõ','Rendszertervezõ','Informatikai biztonsági auditor');
   v_feladarray := feladArray('Adózási rendszer','Pénzügyi rendszer','E-építésügy','MEPÁR fejlesztés','Termelésirányítási rendszer adatbázisának tervezése'
    ,'A-rendszer minõség ellenõrzése, átvétele','Hálózat bõvítés','X hálózati infrastruktúra átalakítása','Y rendszertervezése'
    ,'Z rendszer biztonsági auditja','');
   v_csoparray := csopArray('5 rendszerszervezõ, programozó','3 Informatikus','6 térinformatikus','','','','','','','','');
   v_tevearray := teveArray('IT alkalmazási rendszer-tervezés','Rendszertervezés','IT alkalmazási rendszer-tervezés','Adatbázis tervezés','Informatikai infrastruktúra','','','','','','');
   v_szervarray := szervArray('NJSZT','Mérnöki kamara','','','','','','','','','');


-- teveArray('','','','','','','','','','','');


  DELETE from SUBJECT WHERE DESCRIPTION = 'GENERATED';
   FOR i IN 1..120 LOOP
      l_first_name := INITCAP(GET_RANDOM_TEXT('DM_FIRST_NAMES',l_sex));
      l_last_name  := INITCAP(GET_RANDOM_TEXT('DM_LAST_NAME',l_dummy));
      if l_sex = 'F' then 
         l_sex_id := 11;
      else
         l_sex_id := 12; 
      end if;
      insert INTO SUBJECT ( SUBJ_CATEGORY_ID, DESCRIPTION )
         values (1010,'GENERATED')
         RETURNING SUBJ_ID into l_next_subj_id;
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1121,DROP_ACCENT(LOWER(l_last_name||'.'||l_first_name||'@gogole.hu')));  
      insert into dm_user (SUBJ_ID,USER_NAME,USER_PSWD)
        values (l_next_subj_id,DROP_ACCENT(UPPER(SUBSTR(l_first_name,0,2) ||l_last_name)),'titok');
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,VALUE_TYPE_ID)
         values (l_next_subj_id,1010,1001,'1011',1011);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1112,l_last_name);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1113,l_first_name);     
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID)
         values (l_next_subj_id,1010,1114,l_sex_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1115,l_last_name);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1116,l_first_name);  
      l_first_name := GET_RANDOM_TEXT('DM_FIRST_NAMES',l_dummy,'F');
      l_last_name  := GET_RANDOM_TEXT('DM_LAST_NAME',l_dummy);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1117,INITCAP(l_last_name||' '||l_first_name));   
      if DBMS_RANDOM.VALUE (1, 3) > 2 then
        insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
           values (l_next_subj_id,1010,1111,'dr.'); 
      end if;    
      l_date_str_born:=GET_RANDOM_DATE_TEXT;
      l_year_born := to_number(substr(l_date_str_born,1,4));
       insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1119,l_date_str_born);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID)
         values (l_next_subj_id,1010,11120,373);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID)
         values (l_next_subj_id,1010,1118,get_random_id('DM_CITY'));
     
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
         values (l_next_subj_id,1010,1400)
      RETURNING subj_param_id into l_new_group;
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1403,GET_RANDOM_SUPER_TYP (1403),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1401,GET_RANDOM_SUPER_TYP(1401),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1404,GET_RANDOM_SUPER_TYP(1404),l_new_group);

      
      

       l_first_name := GET_RANDOM_TEXT('DM_CITY',l_dummy);
      l_last_name  := GET_RANDOM_TEXT('UCCAK',l_dummy);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1122,TRUNC(DBMS_RANDOM.VALUE(1000,9999))||' '||l_first_name||' '||l_last_name||' '||trunc(DBMS_RANDOM.VALUE(1,99)));  
       insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
         values (l_next_subj_id,1010,1125,'+36'||TRUNC( DBMS_RANDOM.VALUE(2,7))||'0'||TRUNC(DBMS_RANDOM.VALUE(1111111,9999999)));  


      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
         values (l_next_subj_id,1010,1130)
      RETURNING subj_param_id into l_new_group;
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1132,GET_RANDOM_id ('SUBJECT'),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1131,TRUNC( DBMS_RANDOM.VALUE(l_year_born+18,least(2015,l_year_born+25))),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1136,TRUNC(DBMS_RANDOM.VALUE(least(2015,l_year_born+25),least(2015,l_year_born+30))),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1133,GET_RANDOM_SUPER_TYP(10000),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1135,TRUNC(DBMS_RANDOM.VALUE(9000,11000))||'/1980',l_new_group);

       insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
         values (l_next_subj_id,1010,1140)
      RETURNING subj_param_id into l_new_group;
      
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1141,get_random_id('DM_LANGUAGE'),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1142,GET_RANDOM_SUPER_TYP(1142),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1143,GET_RANDOM_SUPER_TYP(1143),l_new_group);

       insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
         values (l_next_subj_id,1010,1150)
      RETURNING subj_param_id into l_new_group;
      
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1151,'ECDL',l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1122,'CISM oklevele',l_new_group);
      

      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
         values (l_next_subj_id,1010,1160)
      RETURNING subj_param_id into l_new_group;
      
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1161,TRUNC(DBMS_RANDOM.VALUE(least(2015,l_year_born+25),least(2015,l_year_born+30))),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1168,TRUNC(DBMS_RANDOM.VALUE(least(2015,l_year_born+31),least(2015,l_year_born+50))),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1162,v_gyarray(DBMS_RANDOM.value(1,10)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1163,v_rarray(DBMS_RANDOM.value(1,5)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1164,v_beoarray(DBMS_RANDOM.value(1,11)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1165,v_feladarray(DBMS_RANDOM.value(1,11)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1166,v_csoparray(DBMS_RANDOM.value(1,11)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1167,v_tevearray(DBMS_RANDOM.value(1,11)),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1181,v_szervarray(DBMS_RANDOM.value(1,11)),l_new_group);

      if DBMS_RANDOM.VALUE (1, 3) > 2 then
        insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID)
           values (l_next_subj_id,1010,1170)
        RETURNING subj_param_id into l_new_group;
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1174,'PHD',l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1171,TRUNC(DBMS_RANDOM.VALUE(least(2015,l_year_born+31),least(2015,l_year_born+50))),l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE,GROUP_ID)
         values (l_next_subj_id,1010,1172,'Informatika',l_new_group);
      insert INTO SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE_TYPE_ID,GROUP_ID)
         values (l_next_subj_id,1010,1173,GET_RANDOM_id ('SUBJECT'),l_new_group);
      end if;
   end loop;
END;

/
