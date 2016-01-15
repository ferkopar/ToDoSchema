--------------------------------------------------------
--  DDL for Package Body SUPER_TYP_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SUPER_TYP_TAPI" AS


FUNCTION DM_TRANSLATE_F(p_TBL_NAME     vt_DM_TRANSLATE.TBL_NAME % TYPE,
                          p_TBL_COL_NAME vt_DM_TRANSLATE.TBL_COL_NAME % TYPE,
                          p_TBL_PK_ID    vt_DM_TRANSLATE.TBL_PK_ID % TYPE,
                          p_LANGUAGE_ID  vt_DM_TRANSLATE.LANGUAGE_ID % TYPE)
  RETURN vt_DM_TRANSLATE.NAMES % TYPE
  IS
    v_return vt_DM_TRANSLATE.NAMES % TYPE;
  BEGIN
    BEGIN
      IF p_TBL_PK_ID IS NOT NULL
      THEN
        SELECT names
          INTO v_return
          FROM vt_DM_TRANSLATE
          WHERE TBL_NAME = p_TBL_NAME
            AND (tbl_col_name = p_TBL_COL_NAME
            OR p_tbl_col_name IS NULL)
            AND TBL_PK_ID = p_TBL_PK_ID
            AND LANGUAGE_ID = p_LANGUAGE_ID
        --ide mÃšg lehetne ÃšrvÃšnyessÃšg, stb...
        ;
      END IF;
    EXCEPTION
      WHEN no_data_found THEN v_return := 'nn';
      WHEN too_many_rows THEN v_return := 'tn';
    END;
    RETURN v_return;
  END DM_TRANSLATE_F; 

FUNCTION LOOKUP_SUPER_TYPE_NAME (P_SUPER_TYPE_ID NUMBER,
                                   P_LANGUAGE_ID   NUMBER DEFAULT null)
  RETURN VARCHAR2
  AS

    v_ret VARCHAR2(2000);
    v_language_id number(12,0);
  BEGIN
      if P_LANGUAGE_ID is null then 
        v_language_id := V('LANGUAGE');
      else
        v_language_id := P_LANGUAGE_ID;
      end if;
      v_ret := DM_TRANSLATE_F('DM_SUPER_TYP', 'SUPER_TYPE_NAME', P_SUPER_TYPE_ID, v_language_id);
      IF v_ret IN ('nn','tn') then
        SELECT SUPER_TYPE_NAME
          INTO v_ret
          FROM dm_super_typ
          WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
      END IF;
    if V('APP_USER') = 'FPARDI' then
     v_ret := v_ret || ' ('||P_SUPER_TYPE_ID||')';
    end if;
    RETURN V_RET;
    EXCEPTION
      WHEN OTHERS THEN -- Ha nem talált rekordot super_type tekordot
          RETURN NULL;

  END LOOKUP_SUPER_TYPE_NAME;

FUNCTION LOOKUP_SUPER_TYPE_NAME (p_super_type_short_name varchar2, P_LANGUAGE_ID   NUMBER DEFAULT null)
  return varchar2 as

v_super_typ_id number (12,0);

begin
  select DM_SUPER_TYP.SUPER_TYP_ID INTO v_super_typ_id FROM DM_SUPER_TYP WHERE SUPER_TYPE_SHORT_NAME = p_super_type_short_name;
  RETURN LOOKUP_SUPER_TYPE_NAME(v_super_typ_id,P_LANGUAGE_ID);
  exception when NO_DATA_FOUND then
    raise_application_error(-20001,'Sajnálatos esemény történt'||chr(13)||chr(10) ||'Nem talált értékrt a DM_SUPER_TYP táblában:'||p_super_type_short_name||' '||SQLCODE||' -ERROR- '||SQLERRM);

end;

FUNCTION LOOKUP_GROUP_ID(P_SUPER_TYPE_ID NUMBER)
  RETURN DM_SUPER_TYP.GROUP_ID % TYPE
  AS

    v_ret DM_SUPER_TYP.GROUP_ID % TYPE;
  BEGIN
    BEGIN
      SELECT GROUP_ID
        INTO v_ret
        FROM dm_super_typ
        WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
    EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
    END;
    RETURN V_RET;
  END LOOKUP_GROUP_ID;

FUNCTION SEARCH_GROUND_LEVEL_ID (p_super_type_id NUMBER)
  RETURN NUMBER
AS
  v_super_typ_row dm_super_typ%rowtype;
BEGIN
  select * INTO v_super_typ_row FROM DM_SUPER_TYP WHERE SUPER_TYP_ID = p_super_type_id;
  if v_super_typ_row.GROUP_ID is null or v_super_typ_row.GROUP_ID = 0 then
     return v_super_typ_row.super_typ_id;
  else
     return SEARCH_GROUND_LEVEL_ID (v_super_typ_row.group_id);
  end if;
END;
END SUPER_TYP_TAPI;

/
