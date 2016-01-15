--------------------------------------------------------
--  DDL for Package Body STAGING
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "STAGING" AS

PROCEDURE LOAD_SUBJ_FROM_SZALLITO as

cursor szallitok is
  select * from wk_stage_szallito;
v_subj_id number (12,0);
v_group_id number (12,0);
begin
  for szallito in szallitok loop
     insert INTO SUBJECT (SUBJ_CATEGORY_ID) VALUES (102) RETURNING SUBJ_ID into v_subj_id;
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,1010,'5000001238',5000001238);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11500,'',5000001238) 
         RETURNING subj_param_id INTO v_group_id;
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11501,szallito."C�g neve",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11508,szallito."Ad�azonos�t� jele",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11901,szallito."Sz�mlavezet� bank neve",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11902,szallito."Banksz�mlasz�ma",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11506,szallito."C�gjegyz�k-sz�ma",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11531,szallito."C�me",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11534,szallito."Sz�ml�z�si c�me",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11554,szallito."e-mail",5000001238,v_group_id);    
  end loop;
end;


PROCEDURE LOAD_SUBJ_FROM_VEVO as

cursor vevok is
  select * from wk_stage_vevo;
v_subj_id number (12,0);
v_group_id number (12,0);
begin
  for vevo in vevok loop
     insert INTO SUBJECT (SUBJ_CATEGORY_ID) VALUES (102) RETURNING SUBJ_ID into v_subj_id;
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,1010,'5000001239',5000001239);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11500,'',5000001238) 
         RETURNING subj_param_id INTO v_group_id;
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11501,vevo."C�g neve",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11508,vevo."Ad�azonos�t� jele",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11901,vevo."Sz�mlavezet� bank neve",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11902,vevo."Banksz�mlasz�ma",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11506,vevo."C�gjegyz�k-sz�ma",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11531,vevo."C�me",5000001238,v_group_id);
     insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,11534,vevo."Sz�ml�z�si c�me",5000001238,v_group_id);
  end loop;
end;

function get_street_name_id(p_street_name varchar2) RETURN NUMBER
  AS
  l_name VARCHAR2(255);
  l_name_id NUMBER(12,0);
  
  BEGIN
   l_name := REGEXP_REPLACE(p_street_name,' [^ ]+$', ' ');
   begin
          select TEXT_ID into l_name_id FROM DM_TEXT 
            where CNAMES = l_name
            and W_FORM = 'WK_STAGE_STREET';
        EXCEPTION WHEN NO_DATA_FOUND THEN
          INSERT INTO DM_TEXT (TEXT_ID,LANGUAGE_ID,CNAMES,W_FORM)
            VALUES (SEQ_BASE.NEXTVAL,1,l_name,'WK_STAGE_STREET')
            RETURNING TEXT_ID INTO l_name_id;
      
        end;
  RETURN l_name_id;
  END;

function get_city_id(p_city_name varchar2) return number 
  as
  l_city_id number (12,0);
  begin
    select dm_city_id into l_city_id from dm_city where trim(upper(NAME)) = trim(upper(p_city_name));
    return l_city_id;
  exception when no_data_found then
    insert into dm_city ( NAME ) VALUES (p_city_name) RETURNING dm_city_id INTO l_city_id;
    return l_city_id;
  end;


PROCEDURE LOAD_FROM_WORKERS AS

  CURSOR workers is
    select * from WK_V_STAGE_WORKERS;
  v_subj_id number (12,0);
  v_group_id number (12,0);
  v_addr_id number (12,0);
  v_id_tmp number (12,0);

  BEGIN
    FOR worker in workers loop
            insert INTO SUBJECT (SUBJ_CATEGORY_ID) VALUES (101) RETURNING SUBJ_ID into v_subj_id;
      /* Alany t�pus param�ter */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,1010,'111',111);
      /* Szem�ly egyedi adatt�pus csoport */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11100,'',111) 
        RETURNING subj_param_id INTO v_group_id;
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11101,worker.TITULUS,111,v_group_id);
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11102,worker.LAST_NAME,111,v_group_id);
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11103,worker.FIRST_NAME,111,v_group_id);
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11105,worker."sz�let�si n�v",111,v_group_id);
        v_id_tmp:= get_city_id(worker."sz�letet�si hely");
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11107,v_id_tmp,111,v_group_id);
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11108,to_char(worker."sz�letet�si id�",'YYYY.MM.DD'),111,v_group_id);
        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11106,worker."anyja neve",111,v_group_id);
      /* Szem�ly c�mt�pus csoport */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11130,'',111) 
        RETURNING subj_param_id INTO v_group_id;
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11131,worker."�lland� lakc�m",111) 
        RETURNING subj_param_id INTO v_addr_id;
      /* c�m r�szletes adata */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,5000072678,worker."ir.sz�m",111,v_addr_id) ;
      v_id_tmp:= get_city_id(worker."v�ros");      
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,5000002573,v_id_tmp,111,v_addr_id) ;
--      v_id_tmp:= get_street_id(worker.UTCA_N�V);      
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,5000002575,worker.UTCA_N�V,111,v_addr_id) ;
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,5000002581,worker.PLACE_TYPE,111,v_addr_id) ;     
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) values(v_subj_id,5000002576,worker.HAZ,111,v_addr_id) ;
      /* Szem�ly okirat csoport */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11160,'',111) 
        RETURNING subj_param_id INTO v_group_id;
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11111,worker."szig sz�ma",111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11110,worker."TAJ sz�m",111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11109,worker."ad�azonos�t� jel",111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,5000335918,worker."vezet�i enged�ly sz�ma",111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,5000335920,worker."di�kigazolv�ny sz�m",111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,5000335919,worker."oktat�si azonos�t�",111,v_group_id);
      /* Nyugd�j csoport */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11170,'',111) 
        RETURNING subj_param_id INTO v_group_id;
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,5000335921,to_char(worker."nyugd�j kezdete",'YYYY.MM.DD'),111,v_group_id);
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,5000335922,worker."nyugd�jas t�rzssz�m",111,v_group_id);
  
             /* Bank csoport */
      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID) values(v_subj_id,11900,'',111) 
        RETURNING subj_param_id INTO v_group_id;

        insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
            values(v_subj_id,11901,worker."bank neve",111,v_group_id);

      insert INTO SUBJ_PARAM (SUBJ_ID,PARAM_TYPE_ID,VALUE,SUBJ_TYPE_ID,GROUP_ID) 
          values(v_subj_id,11902,worker."banksz�mla sz�ma",111,v_group_id);     
 
    END loop; 
  END;


PROCEDURE ADJUST_STREET(p_city number) as  

CURSOR streets IS
  SELECT * FROM WK_STAGE_STREET where WK_STAGE_STREET.CITY = p_city;

l_name_id NUMBER(12,0);

l_type VARCHAR2(255);
l_type_id NUMBER(12,2);
l_cnt NUMBER :=0;

BEGIN
  for street in streets loop

    if street.name is null then
      l_cnt := l_cnt + 1;
      begin
        l_type := regexp_substr(street.STREET_NAME, '\S+$');
        begin
          select SUPER_TYP_ID into l_type_id from DM_SUPER_TYP 
          where
          GROUP_ID = 5000002581 
          and SUPER_TYPE_NAME = regexp_substr(street.STREET_NAME, '\S+$');
        EXCEPTION WHEN NO_DATA_FOUND THEN
          l_type_id := null;
        end;
        l_name_id := get_street_name_id(street.street_name);
        UPDATE WK_STAGE_STREET set NAME = l_name_id , KOZTER=l_type_id, street_id = seq_base.nextval
          WHERE CITY = street.CITY
          AND STREET_NAME = street.STREET_NAME;
--      exception when others then
--        null;
      end;
    end if;
  end loop;
    DBMS_OUTPUT.PUT_LINE(l_cnt);
  COMMIT;
END;

PROCEDURE ADJUST_STREETS
  AS
  cursor cities is
    SELECT DISTINCT CITY city_id,
   (select name from dm_city where DM_CITY_ID = CITY) name
  FROM WK_STAGE_STREET
order by name;

  l_cnt number;
  BEGIN
    for citx in cities loop
--        select COUNT(1) INTO l_cnt FROM WK_STAGE_STREET where CITY = citx.city_id;
--        if l_cnt > 0 then
--           DBMS_OUTPUT.PUT_LINE(citx.name ||' start.');
           ADJUST_STREET(citx.city_id);
--           DBMS_OUTPUT.PUT_LINE(citx.name ||' done.');
--        end if;
    end loop;
  END;

END STAGING;

/
