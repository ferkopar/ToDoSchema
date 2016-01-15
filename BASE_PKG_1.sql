--------------------------------------------------------
--  DDL for Package Body BASE_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "BASE_PKG" 
AS
  dummy NUMBER(1);


FUNCTION SUBJECTIV_ALT_F
  RETURN NUMBER
IS
BEGIN
  RETURN 1000;
END SUBJECTIV_ALT_F;


function "USER_IS_IN_ROLE" (p_user_id in int,p_role_id in int) return boolean
as
V_RET boolean := false;
BEGIN
  BEGIN
SELECT 1
  INTO DUMMY
  FROM DM_ROLE_USER
  WHERE USER_ID = P_USER_ID
    AND role_id = p_role_id
    AND ROWNUM < 2;
    RETURN true;
  EXCEPTION
  when NO_DATA_FOUND then
    null;
  END;
  return V_RET; 
END USER_IS_IN_ROLE;

FUNCTION AUTH(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2)
  RETURN BOOLEAN
AS
  v_ret BOOLEAN;
BEGIN
  BEGIN
SELECT 1
  INTO dummy
  FROM DM_USER
  WHERE user_name = p_username
    AND USER_PSWD = base_pkg.custom_hash(p_username, p_password)
    AND ROWNUM < 2;
    RETURN TRUE;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    v_ret:= FALSE;
  END;
  RETURN v_ret;
END AUTH;
FUNCTION TYPE_SUBTREE (p_type DM_SUPER_TYP.super_typ_id%type) return varchar2 is
  vissza varchar2(4000);
  cursor cur is SELECT super_typ_id
  FROM DM_SUPER_TYP t
CONNECT BY PRIOR super_typ_id = group_id
START WITH super_typ_id = p_type;
v_sep VARCHAR2(1) := ':';
BEGIN
  begin
  for r in cur loop
   vissza:=vissza||v_sep||r.super_typ_id;
  end loop;
  vissza:=vissza||v_sep;
  exception when others then null;
  end;
  return vissza;
 end TYPE_SUBTREE;
FUNCTION DM_TRANSLATE_F(
    p_TBL_NAME vt_DM_TRANSLATE.TBL_NAME%type ,
    p_TBL_COL_NAME vt_DM_TRANSLATE.TBL_COL_NAME%type ,
    p_TBL_PK_ID vt_DM_TRANSLATE.TBL_PK_ID%type ,
    p_LANGUAGE_ID vt_DM_TRANSLATE.LANGUAGE_ID%type )
  RETURN vt_DM_TRANSLATE.NAMES%type
IS
  v_return vt_DM_TRANSLATE.NAMES%type;
BEGIN
  BEGIN
    IF p_TBL_PK_ID IS NOT NULL THEN
SELECT names
  INTO v_return
  FROM vt_DM_TRANSLATE
  WHERE TBL_NAME = p_TBL_NAME
    AND TBL_COL_NAME = p_TBL_COL_NAME
    AND TBL_PK_ID = p_TBL_PK_ID
    AND LANGUAGE_ID = p_LANGUAGE_ID
--ide mÚg lehetne ÚrvÚnyessÚg, stb...
;
END IF;
EXCEPTION
WHEN no_data_found THEN    v_return:='nn';
  WHEN too_many_rows THEN
    v_return:='tn';
  END;
  RETURN v_return;
END DM_TRANSLATE_F;
FUNCTION v_LANG_F
  RETURN DM_LANGUAGE.LANGUAGE_ID%TYPE
IS
 v_lang DM_LANGUAGE.LANGUAGE_ID%TYPE:=1;
BEGIN
  begin
SELECT language_id
  INTO v_lang
  FROM dm_user
  WHERE user_name = NVL(V('APP_USER'), USER);
EXCEPTION
WHEN OTHERS THEN v_lang:=-1;
  
  end;
  RETURN V_LANG;
END v_LANG_F;
PROCEDURE DM_TRANSLATE_NAME_UPD(
    p_TBL_NAME vt_DM_TRANSLATE.TBL_NAME%type ,
    p_TBL_COL_NAME vt_DM_TRANSLATE.TBL_COL_NAME%type ,
    p_TBL_PK_ID vt_DM_TRANSLATE.TBL_PK_ID%type ,
    p_LANGUAGE_ID vt_DM_TRANSLATE.LANGUAGE_ID%type ,
    p_NAME vt_DM_TRANSLATE.NAMES%type )
IS
  ri rowid;
BEGIN
SELECT ROWID
  INTO ri
  FROM vt_DM_TRANSLATE
  WHERE TBL_NAME = p_TBL_NAME
    AND TBL_COL_NAME = p_TBL_COL_NAME
    AND TBL_PK_ID = p_TBL_PK_ID
    AND LANGUAGE_ID = p_LANGUAGE_ID
--ide mÚg lehetne ÚrvÚnyessÚg, stb...
FOR UPDATE OF names NOWAIT;
UPDATE vt_DM_TRANSLATE
  SET names = P_NAME
  WHERE ROWID = ri;
EXCEPTION
WHEN no_data_found THEN INSERT INTO vt_DM_TRANSLATE (
  NAMES, LANGUAGE_ID, TBL_NAME, TBL_COL_NAME, TBL_PK_ID
)
VALUES (p_NAME, p_LANGUAGE_ID, p_TBL_NAME, p_TBL_COL_NAME, p_TBL_PK_ID); END DM_TRANSLATE_NAME_UPD;
PROCEDURE DM_TRANSLATE_DEL(p_TBL_NAME vt_DM_TRANSLATE.TBL_NAME % TYPE,
p_TBL_PK_ID vt_DM_TRANSLATE.TBL_PK_ID % TYPE) IS BEGIN
DELETE vt_DM_TRANSLATE
  WHERE TBL_NAME = p_TBL_NAME
    AND TBL_PK_ID = p_TBL_PK_ID; END DM_TRANSLATE_DEL;
FUNCTION RIGHTS_READ_ROW_F(p_tab DM_REGULATION.TYPE_TABLE1 % TYPE,
p_ID NUMBER,
P_STAT DM_REGULATION.TYPE_VALUE1 % TYPE,
p_typ DM_SUPER_TYP.super_typ_id % TYPE DEFAULT NULL) --egyel�re subjectiv-n�l
RETURN VARCHAR2 IS v_ret VARCHAR2(1) := 'N';
BEGIN
  BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r
  WHERE TYPE_TABLE2 = p_tab
    AND TYPE_VALUE3 = p_stat
    AND regul_type_id = 1008
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
  end;
  if P_TAB = 'EPI' then
    V_RET := 'Y';
  end if;
  if p_tab='SUBJECTIV' and v_ret='I' then
   v_ret:='N';
   BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r
  WHERE TYPE_TABLE1 = p_tab
    AND r.type_value1 = p_typ
    AND regul_type_id = 1000
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
   END;
  elsif p_tab='EPI_SUBJ_PARAM' and v_ret='I' then
   v_ret:='N';
   BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r
  WHERE TYPE_TABLE2 = p_tab
    AND r.type_value2 = p_typ
    AND regul_type_id = 1014
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
   END;
  elsif p_tab='LOG_TABLE' then
   v_ret:='N';
   BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r,
       log_table l
  WHERE r.regul_type_id = 1005
    AND l.LOG_ID = p_id
    AND r.TYPE_TABLE2 = l.TABLE_NAME
    AND r.TYPE_COLUMN2 = l.COLUMN_NAME
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
   END;
   
  end if;
  --RETURN 'Y';
  RETURN v_ret;
END RIGHTS_READ_ROW_F;
FUNCTION RIGHTS_field_display_f(
    p_tab DM_REGULATION.TYPE_TABLE2%type,
    p_col DM_REGULATION.TYPE_COLUMN2%type,
    p_TBL_PK_ID NUMBER default null, --nem lehet a riport columnn�l kezelni, view-ba lehetne
    P_STAT DM_REGULATION.TYPE_VALUE1%type default null, --nem lehet a riport columnn�l kezelni, view-ba lehetne
    p_menu DM_REGULATION.TYPE_VALUE1%type DEFAULT NULL ,
    p_partype DM_SUPER_TYP.super_typ_id%type DEFAULT NULL   )
  RETURN VARCHAR2
IS
  v_ret VARCHAR2(1):='N';
BEGIN
  BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r,
       dm_role_user ru
  WHERE type_value1 = v('EPI_TYPE_ID')
    AND TYPE_TABLE2 = p_tab
    AND TYPE_COLUMN2 = p_col
    AND regul_type_id = 1017
    AND NVL(p_partype, -1) = NVL(type_value3, -1)
    AND r.ROLE_ID = ru.role_id
    AND v('USER_ID') = ru.user_id
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
  END;
  RETURN v_ret;
END RIGHTS_field_display_f;
FUNCTION RIGHTS_field_updateable_f(
    p_tab DM_REGULATION.TYPE_TABLE2%type,
    p_col DM_REGULATION.TYPE_COLUMN2%type,
    p_TBL_PK_ID NUMBER ,
    P_STAT DM_REGULATION.TYPE_VALUE1%type,
    p_menu DM_REGULATION.TYPE_VALUE1%type DEFAULT NULL,
    p_partype DM_SUPER_TYP.super_typ_id%type DEFAULT NULL)
  RETURN VARCHAR2
IS
  v_ret VARCHAR2(1):='N';
BEGIN
  BEGIN
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r
  WHERE type_value1 = v('EPI_TYPE_ID')
    AND TYPE_TABLE2 = p_tab
    AND TYPE_COLUMN2 = p_col
    AND regul_type_id = 1005
    AND NVL(type_value3, -1) = NVL(p_stat, -1)
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
    
  END;
  if v_ret='Y' and p_tab='EPI_SUBJ_PARAM' then
   begin
SELECT 'Y'
  INTO v_ret
  FROM dm_regulation r
  WHERE TYPE_TABLE2 = p_tab
    AND regul_type_id = 1014
    AND v('EPI_TYPE_ID') = type_value1
    AND INSTR(base_pkg.TYPE_SUBTREE(type_value2), ':' || p_partype || ':') > 0
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
    
   END;
  end if;
  RETURN v_ret;
END RIGHTS_field_updateable_f;
FUNCTION LANGUAGE_NAME_F
  RETURN DM_LANGUAGE.LANGUAGE_NAME%TYPE
IS
  v_ret DM_LANGUAGE.LANGUAGE_NAME%TYPE;
BEGIN
SELECT LANGUAGE_NAME
  INTO v_ret
  FROM DM_LANGUAGE
  WHERE LANGUAGE_ID = v_LANG_F;
  RETURN v_ret;
END LANGUAGE_NAME_F;
PROCEDURE v_LANG_set(
    p_lang DM_LANGUAGE.LANGUAGE_ID%TYPE)
IS
BEGIN
UPDATE dm_user
  SET language_id = p_lang
  WHERE user_name = NVL(V('APP_USER'), USER); END v_LANG_set;
PROCEDURE LANGUAGE_CHANGE(p_lang VARCHAR2) IS v_lang_code DM_LANGUAGE.LANGUAGE_CODE % TYPE;
CURSOR cur IS SELECT t.apex_variable_page page,
                     SUBSTR(t.apex_variable, 2, LENGTH(t.apex_variable) - 2) apex_variable,
                     names DISPLAY_NAME
  FROM VT_DM_TRANSLATE t
  WHERE t.apex_variable IS NOT NULL
    AND language_id = base_pkg.v_LANG_F
  ORDER BY 1,
           2;
BEGIN
null;
   --APEX_UTIL.SET_SESSION_STATE ('P0_TESZT','1');
    if p_lang=-1 then
     base_pkg.v_LANG_set(1);
    else
     base_pkg.v_LANG_set(p_lang);
    end if;
  IF V('APP_ID')!=1111  and 1=2 THEN
SELECT LANGUAGE_CODE
  INTO v_lang_code
  FROM DM_LANGUAGE
  WHERE LANGUAGE_ID = (p_lang);
    APEX_UTIL.SET_SESSION_LANG( P_LANG => v_lang_code);
    --APEX_UTIL.SET_SESSION_STATE ('P0_TESZT',v_lang_code||';'|| base_pkg.v_LANG_F);
    /*
     BEGIN
      FOR rec IN cur
      LOOP
      -- APEX_UTIL.SET_SESSION_STATE (rec.APEX_VARIABLE,rec.DISPLAY_NAME );
       APEX_UTIL.SET_SESSION_STATE (rec.APEX_VARIABLE,rec.DISPLAY_NAME );
        --APEX_UTIL.SET_SESSION_STATE ('P0_TESZT',rec.APEX_VARIABLE||';'|| rec.DISPLAY_NAME);
      END LOOP;
    
    EXCEPTION
    WHEN OTHERS THEN
      NULL; 
    END;
    */
  END IF;
END LANGUAGE_CHANGE;
FUNCTION SUBJECTIV_NAME_F(
    p_subj_id SUBJECT.SUBJ_ID%type)
  RETURN VARCHAR2
IS
  vissza VARCHAR2(1000);
  v_rec subject%rowtype;
BEGIN
 if p_subj_id is not null then

SELECT *
  INTO v_rec
  FROM subject
  WHERE subj_id = p_subj_id;

END IF;
  RETURN vissza;
END SUBJECTIV_NAME_F;
FUNCTION SUBJECTIV_EPINAME_F(
    p_subj_id SUBJECt.SUBJ_ID%type)
  RETURN VARCHAR2
IS
  vissza VARCHAR2(1000);
BEGIN
  BEGIN
SELECT GET_SUBJECT_NAME(p_subj_id) subj_name
  INTO vissza
  FROM subject
  WHERE subj_id = p_subj_id;
EXCEPTION
WHEN no_data_found THEN    vissza:='ID:'||p_subj_id;
  END;
  RETURN vissza;
END SUBJECTIV_EPINAME_F;
FUNCTION SUBJECTIV_DATA_F(
    p_subj_id SUBJECT.SUBJ_ID%type)
  RETURN VARCHAR2
IS
  CURSOR cur
  IS
SELECT esp.value
  FROM SUBJ_PARAM esp
  WHERE subj_id = p_subj_id
    AND EXISTS (SELECT 1
        FROM DM_REGULATION r
        WHERE esp.PARAM_TYPE_ID = r.TYPE_VALUE1
          AND r.REGUL_TYPE_ID = 1015)
  ORDER BY PARAM_TYPE_ID;
vissza VARCHAR2(4000);
sep VARCHAR2(2);
BEGIN
  FOR r IN cur
  LOOP
    vissza:=vissza||sep||r.value;
    sep   :='; ';
  END LOOP;
  RETURN vissza;
END SUBJECTIV_DATA_F;

FUNCTION v_LANG_DEFAULT_F
  RETURN DM_LANGUAGE.LANGUAGE_ID%TYPE
IS
 vissza DM_LANGUAGE.LANGUAGE_ID%TYPE:=1;
BEGIN
  IF V('APP_ID')=1111 or 1=1 THEN
    vissza:= 1111;
  ELSE
    --vissza:= 1;
    begin
SELECT language_id
  INTO vissza
  FROM dm_user
  WHERE user_name = NVL(V('APP_USER'), USER);
EXCEPTION
WHEN OTHERS THEN null;
    end;
  END IF;
 return vissza;
  
END v_LANG_DEFAULT_F;
FUNCTION EPI_TYPE_F(
    p_epi_id EPI.EPI_ID%type)
  RETURN VARCHAR2
IS
  vissza VARCHAR2(4000);
  v_EPI_TYPE_ID epi.EPI_TYPE_ID%type;
BEGIN
  IF p_epi_id IS NOT NULL THEN
    BEGIN
SELECT EPI_TYPE_ID
  INTO v_EPI_TYPE_ID
  FROM epi
  WHERE epi_id = p_epi_id;
--vissza:=base_pkg.SUPER_TYP_F(v_EPI_TYPE_ID);
EXCEPTION
WHEN OTHERS THEN      vissza:=p_epi_id||'-error';
    END;
  END IF;
  RETURN vissza;
END EPI_TYPE_F;

FUNCTION GIS_F(
    p_GIS_ID GIS_DATA.GIS_ID%type)
  RETURN VARCHAR2
IS
  vissza VARCHAR2(4000);
BEGIN
  IF p_GIS_ID IS NOT NULL THEN
    BEGIN
SELECT
--base_pkg.SUPER_TYP_F(GIS_TYPE_ID)||'; '||
COUNTRY
|| '; '
|| CITY
|| '; '
|| PLZ
|| '; '
|| ADRESS
|| '; '
|| STREET
|| '; '
|| HOUSE_NUM
  INTO vissza
  FROM GIS_DATA
  WHERE p_GIS_ID = GIS_ID;
EXCEPTION
WHEN OTHERS THEN      vissza:=p_GIS_ID||'-error';
    END;
  END IF;
  RETURN vissza;
END GIS_F;

FUNCTION custom_hash(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2)
  RETURN VARCHAR2
IS
  l_password VARCHAR2(4000);
  l_salt     VARCHAR2(4000) := 'U37ET77M2KIMB90R8JL31G0YU2QI0Y';
BEGIN
  l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5 (input_string => p_password || SUBSTR(l_salt,10,13) || p_username || SUBSTR(l_salt, 4,10)));
  RETURN l_password;
END custom_hash;
FUNCTION STATUS_DEFAULT_F (P_TAB dm_regulation.type_table1%type)
  RETURN NUMBER
IS
 v_regul_type_id dm_regulation.regul_type_id%type:=1010;
 v_ret dm_regulation.type_value1%type;
BEGIN
 begin
SELECT type_value1
  INTO v_ret
  FROM dm_regulation r
  WHERE r.regul_type_id = v_regul_type_id
    AND p_tab = r.type_table1;
EXCEPTION
WHEN OTHERS THEN null;
   
 end;
  RETURN v_ret;
END STATUS_DEFAULT_F;
FUNCTION PARENT_SUBJ_ID_F(
    p_subj_id SUBJECT.SUBJ_ID%type)
  RETURN SUBJECT.SUBJ_ID%type
IS
  v_ret SUBJECT.SUBJ_ID%type;
  v_rec SUBJECT%rowtype;
BEGIN

SELECT *
  INTO v_rec
  FROM SUBJECT
  WHERE subj_id = p_subj_id;
   
  
  RETURN v_ret;
END PARENT_SUBJ_ID_F;
FUNCTION SUBJECTIV_UK_F(
    p_subj_id SUBJECT.SUBJ_ID%type)
  RETURN VARCHAR2 DETERMINISTIC
IS
  v_rec SUBJECT%rowtype;
  v_ret VARCHAR2(4000);
BEGIN
SELECT *
  INTO v_rec
  FROM subject
  WHERE subj_id = p_subj_id;
 -- v_ret:=v_ret||'Name:'||SUBJECTIV_NAME_I_F(v_rec.first_name,v_rec.last_name,v_rec.subj_name)||';';
--  v_ret:=v_ret||'B_date:'||TO_CHAR(v_rec.b_date,'yyyy.mm.dd.')||';';
 -- v_ret:=v_ret||'M_name:'||v_rec.m_name||';';
 -- v_ret:=v_ret||'Email:'||v_rec.email||';';
--  v_ret:=v_ret||'Phone1,2:'||SUBJECTIV_PHONE_I_F(v_rec.phone,v_rec.m_phone)||';';
  /*if v_rec.subj_type_id is null then
  v_ret:=v_ret||'Type:'||v_rec.subj_type_id||';';
  else
  select v_ret||'Type:'||SUPER_TYPE_NAME||';' into v_ret
  from dm_super_typ
  where type_id=v_rec.subj_type_id;
  end if;*/
  RETURN v_ret;
END SUBJECTIV_UK_F;
PROCEDURE SUBJECTIV_MOVE_P(
    p_subj_old SUBJECT.SUBJ_ID%type,
    p_subj_new SUBJECT.SUBJ_ID%type)
IS
BEGIN
UPDATE DM_USER
  SET SUBJ_ID = p_subj_new
  WHERE SUBJ_ID = p_subj_old;
UPDATE INVENT
  SET SUBJ_ID = p_subj_new
  WHERE SUBJ_ID = p_subj_old;
UPDATE SUBJ_PARAM
  SET SUBJ_ID = p_subj_new
  WHERE SUBJ_ID = p_subj_old;
UPDATE GIS_SUBJ_EPI_REL
  SET SUBJ_ID = p_subj_new
  WHERE SUBJ_ID = p_subj_old;
UPDATE SUBJ_REL
  SET SUBJ_ID1 = p_subj_new
  WHERE SUBJ_ID1 = p_subj_old;
UPDATE SUBJ_REL
  SET SUBJ_ID2 = p_subj_new
  WHERE SUBJ_ID2 = p_subj_old;
DELETE SUBJECT
  WHERE SUBJ_ID = p_subj_old; END SUBJECTIV_MOVE_P;

FUNCTION EPI_type_F(p_epi_id EPI.EPI_ID % TYPE) RETURN EPI.EPI_TYPE_ID % TYPE IS v_ret EPI.EPI_TYPE_ID % TYPE;
BEGIN
SELECT epi_type_id
  INTO v_ret
  FROM epi
  WHERE epi_id = p_epi_id;
  RETURN v_ret;
END EPI_type_F;
FUNCTION gis_f(
    p_gis GIS_DATA.GIS_ID%type)
  RETURN VARCHAR2
IS
  v_ret VARCHAR2(4000);
BEGIN
SELECT COUNTRY
|| ','
|| PLZ
|| ' '
|| CITY
|| ','
|| ADRESS
|| ' ('
|| STREET
|| ' '
|| HOUSE_NUM
|| ' )'
  INTO v_ret
  FROM gis_data
  WHERE gis_id = p_gis;
  RETURN v_ret;
END GIS_F;
PROCEDURE TREATM_REL_pkg ( 
  P_TREATM_ID1 TREATM_REL.TREATM_ID1%TYPE
 ,P_TREATM_ID2 TREATM_REL.TREATM_ID2%TYPE
  ,P_MODE varchar2 default 'I') is --I insert, U update, D delete
 CURSOR CUR_PAR IS SELECT *
  FROM TREATM_PARAM
  WHERE TREATM_ID = P_TREATM_ID1
  ORDER BY ORDER_NO,
           TREATM_PARAM_ID;
p_TREATM_PARAM_ID TREATM_PARAM.TREATM_PARAM_ID % TYPE;
BEGIN
 FOR REC IN CUR_PAR LOOP
  if p_mode='I' then
  BEGIN
SELECT TREATM_PARAM_ID
  INTO p_TREATM_PARAM_ID
  FROM TREATM_PARAM
  WHERE TREATM_ID = P_TREATM_ID2
    AND PARAM_TYPE_ID = rec.PARAM_TYPE_ID;
EXCEPTION
WHEN NO_DATA_FOUND THEN INSERT INTO TREATM_PARAM (
  TREATM_PARAM_ID, EPI_ID, PARAM_TYPE_ID, VALUE, UNIT_TYPE_ID, DESCRIPTION,
  --   STAT_TYPE_ID,
  TREATM_PARAM1_ID, SUBJ_TYPE_ID, ORDER_NO, SUBJ_ID, VALUE_TYPE_ID,
  --MM_ID,
  TREATM_ID
)
VALUES (SEQ_BASE.NEXTVAL, v('EPI_ID'), rec.PARAM_TYPE_ID, rec.VALUE, rec.UNIT_TYPE_ID, rec.DESCRIPTION,
  --  rec.STAT_TYPE_ID,
  rec.TREATM_PARAM_ID, rec.SUBJ_TYPE_ID, rec.ORDER_NO, rec.SUBJ_ID, rec.VALUE_TYPE_ID,
  --MM_ID,
  P_TREATM_ID2); END;
END IF;
END LOOP; END TREATM_REL_pkg;
FUNCTION popup_pages RETURN VARCHAR2 IS v_ret VARCHAR2(1) := 'N';
BEGIN
 if v('APP_PAGE_ID') in (101,1000,1001,1002,2040,2050,2051,2060,2070,2071,2220,2230,2500,6000) then
  v_ret:='Y';
 end if;
 return v_ret;
 
END POPUP_PAGES;
FUNCTION SUBJECTIV_IS_TYPE_F(
    P_SUBJ_ID SUBJECT.SUBJ_ID%TYPE
   ,P_TYPE_ID NUMBER
   ,P_MODE VARCHAR2 DEFAULT 'S')
  RETURN VARCHAR2 IS
 VISSZA VARCHAR2(1):='N';
BEGIN
 IF P_MODE='S' THEN
  BEGIN
SELECT 'I'
  INTO vissza
  FROM SUBJECT
  WHERE SUBJ_ID = P_SUBJ_ID
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
  END;
 elsif P_MODE='P' then
  BEGIN
SELECT 'I'
  INTO VISSZA
  FROM SUBJ_PARAM
  WHERE SUBJ_ID = P_SUBJ_ID
    AND PARAM_TYPE_ID = P_TYPE_ID
    AND ROWNUM < 2;
EXCEPTION
WHEN OTHERS THEN null;
  end;
 
 END IF;
 return vissza;
end SUBJECTIV_IS_TYPE_F;

procedure image_display( p_mm_id mm_files.mm_id%type) is
 l_mime        VARCHAR2 (255);
   l_length      NUMBER;
   l_file_name   VARCHAR2 (2000);
   lob_loc       BLOB;
BEGIN
SELECT MAIN_TYPE,
       MM_BLOB,
       DBMS_LOB.getlength(MM_BLOB)
  INTO l_mime,
       lob_loc,
       l_length
  FROM mm_files
  WHERE MM_ID = p_MM_ID;
   
   OWA_UTIL.mime_header (NVL (l_mime, 'application/octet'), FALSE);
   HTP.p ('Content-length: ' || l_length);
   OWA_UTIL.http_header_close;
   WPG_DOCLOAD.download_file (lob_loc);
end;


FUNCTION VALUE_LIST_DM_SUPER_TYP (p_group_id NUMBER) RETURN VALUE_LIST PIPELINED AS
BEGIN
  if p_group_id is not null then
   FOR super_typ_row in (SELECT super_typ_id,SUPER_TYPE_NAME FROM DM_SUPER_TYP WHERE GROUP_ID = p_group_id order by super_type_name) LOOP
      PIPE ROW(VALUE_LIST_ITEM(super_typ_row.SUPER_TYPE_NAME,super_typ_row.SUPER_TYP_ID));
   END LOOP;
  else
   FOR super_typ_row in (SELECT super_typ_id,SUPER_TYPE_NAME FROM DM_SUPER_TYP WHERE GROUP_ID is null  order by super_type_name) LOOP
      PIPE ROW(VALUE_LIST_ITEM(super_typ_row.SUPER_TYPE_NAME,super_typ_row.SUPER_TYP_ID));
   END LOOP;

  end if;
   RETURN;
END; 

FUNCTION VALUE_LIST_TREE_DM_SUPER_TYP (p_group_id NUMBER) RETURN VALUE_LIST PIPELINED AS
  cursor cur is SELECT super_typ_id,SUPER_TYPE_NAME,LEVEL
  FROM DM_SUPER_TYP 
  CONNECT BY PRIOR super_typ_id = group_id
  START WITH super_typ_id = p_group_id;
BEGIN
   FOR super_typ_row in cur LOOP
      IF super_typ_row.SUPER_TYP_ID != p_group_id THEN
        PIPE ROW(VALUE_LIST_ITEM(RPAD(' ', super_typ_row.level-1, '-')||super_typ_row.SUPER_TYPE_NAME,super_typ_row.SUPER_TYP_ID));
      END IF;
   END LOOP;
   RETURN;
END; 

END BASE_PKG;

/
