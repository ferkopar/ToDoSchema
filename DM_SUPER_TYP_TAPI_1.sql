--------------------------------------------------------
--  DDL for Package Body DM_SUPER_TYP_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_SUPER_TYP_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU                   IN DM_SUPER_TYP.CRU%type DEFAULT NULL ,
      p_SUPER_TYPE_NAME       IN DM_SUPER_TYP.SUPER_TYPE_NAME%type ,
      p_WK_CLASS_ID           IN DM_SUPER_TYP.WK_CLASS_ID%type DEFAULT NULL ,
      p_GROUP_ID              IN DM_SUPER_TYP.GROUP_ID%type DEFAULT NULL ,
      p_TO_DATE               IN DM_SUPER_TYP.TO_DATE%type ,
      p_DESCRIPTION           IN DM_SUPER_TYP.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                   IN DM_SUPER_TYP.MDU%type DEFAULT NULL ,
      p_GROUND_LEVEL_ID       IN DM_SUPER_TYP.GROUND_LEVEL_ID%type ,
      p_SUPER_GROUP_NAME      IN DM_SUPER_TYP.SUPER_GROUP_NAME%type DEFAULT NULL ,
      p_SLEVEL                IN DM_SUPER_TYP.SLEVEL%type DEFAULT NULL ,
      p_FROM_DATE             IN DM_SUPER_TYP.FROM_DATE%type ,
      p_SUPER_TYPE_SHORT_NAME IN DM_SUPER_TYP.SUPER_TYPE_SHORT_NAME%type DEFAULT NULL ,
      p_CRD                   IN DM_SUPER_TYP.CRD%type DEFAULT NULL ,
      p_MDD                   IN DM_SUPER_TYP.MDD%type DEFAULT NULL ,
      p_ROLL_TYPE             IN DM_SUPER_TYP.ROLL_TYPE%type DEFAULT NULL ,
      p_USE_COMMENT           IN DM_SUPER_TYP.USE_COMMENT%type DEFAULT NULL ,
      p_WIRED_TO              IN DM_SUPER_TYP.WIRED_TO%type DEFAULT NULL ,
      p_SUPER_TYP_ID          IN DM_SUPER_TYP.SUPER_TYP_ID%type )
  IS
  BEGIN
    INSERT
    INTO DM_SUPER_TYP
      (
        CRU ,
        SUPER_TYPE_NAME ,
        WK_CLASS_ID ,
        GROUP_ID ,
        TO_DATE ,
        DESCRIPTION ,
        MDU ,
        GROUND_LEVEL_ID ,
        SUPER_GROUP_NAME ,
        SLEVEL ,
        FROM_DATE ,
        SUPER_TYPE_SHORT_NAME ,
        CRD ,
        MDD ,
        ROLL_TYPE ,
        USE_COMMENT ,
        WIRED_TO ,
        SUPER_TYP_ID
      )
      VALUES
      (
        p_CRU ,
        p_SUPER_TYPE_NAME ,
        p_WK_CLASS_ID ,
        p_GROUP_ID ,
        p_TO_DATE ,
        p_DESCRIPTION ,
        p_MDU ,
        p_GROUND_LEVEL_ID ,
        p_SUPER_GROUP_NAME ,
        p_SLEVEL ,
        p_FROM_DATE ,
        p_SUPER_TYPE_SHORT_NAME ,
        p_CRD ,
        p_MDD ,
        p_ROLL_TYPE ,
        p_USE_COMMENT ,
        p_WIRED_TO ,
        p_SUPER_TYP_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU                   IN DM_SUPER_TYP.CRU%type DEFAULT NULL ,
      p_SUPER_TYPE_NAME       IN DM_SUPER_TYP.SUPER_TYPE_NAME%type ,
      p_WK_CLASS_ID           IN DM_SUPER_TYP.WK_CLASS_ID%type DEFAULT NULL ,
      p_GROUP_ID              IN DM_SUPER_TYP.GROUP_ID%type DEFAULT NULL ,
      p_TO_DATE               IN DM_SUPER_TYP.TO_DATE%type ,
      p_DESCRIPTION           IN DM_SUPER_TYP.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                   IN DM_SUPER_TYP.MDU%type DEFAULT NULL ,
      p_GROUND_LEVEL_ID       IN DM_SUPER_TYP.GROUND_LEVEL_ID%type ,
      p_SUPER_GROUP_NAME      IN DM_SUPER_TYP.SUPER_GROUP_NAME%type DEFAULT NULL ,
      p_SLEVEL                IN DM_SUPER_TYP.SLEVEL%type DEFAULT NULL ,
      p_FROM_DATE             IN DM_SUPER_TYP.FROM_DATE%type ,
      p_SUPER_TYPE_SHORT_NAME IN DM_SUPER_TYP.SUPER_TYPE_SHORT_NAME%type DEFAULT NULL ,
      p_CRD                   IN DM_SUPER_TYP.CRD%type DEFAULT NULL ,
      p_MDD                   IN DM_SUPER_TYP.MDD%type DEFAULT NULL ,
      p_ROLL_TYPE             IN DM_SUPER_TYP.ROLL_TYPE%type DEFAULT NULL ,
      p_USE_COMMENT           IN DM_SUPER_TYP.USE_COMMENT%type DEFAULT NULL ,
      p_WIRED_TO              IN DM_SUPER_TYP.WIRED_TO%type DEFAULT NULL ,
      p_SUPER_TYP_ID          IN DM_SUPER_TYP.SUPER_TYP_ID%type
    )
  IS
  BEGIN
    UPDATE DM_SUPER_TYP
    SET CRU                 = p_CRU ,
      SUPER_TYPE_NAME       = p_SUPER_TYPE_NAME ,
      WK_CLASS_ID           = p_WK_CLASS_ID ,
      GROUP_ID              = p_GROUP_ID ,
      TO_DATE               = p_TO_DATE ,
      DESCRIPTION           = p_DESCRIPTION ,
      MDU                   = p_MDU ,
      GROUND_LEVEL_ID       = p_GROUND_LEVEL_ID ,
      SUPER_GROUP_NAME      = p_SUPER_GROUP_NAME ,
      SLEVEL                = p_SLEVEL ,
      FROM_DATE             = p_FROM_DATE ,
      SUPER_TYPE_SHORT_NAME = p_SUPER_TYPE_SHORT_NAME ,
      CRD                   = p_CRD ,
      MDD                   = p_MDD ,
      ROLL_TYPE             = p_ROLL_TYPE ,
      USE_COMMENT           = p_USE_COMMENT ,
      WIRED_TO              = p_WIRED_TO
    WHERE SUPER_TYP_ID      = p_SUPER_TYP_ID;
  END;
-- del
  PROCEDURE del(
      p_SUPER_TYP_ID IN DM_SUPER_TYP.SUPER_TYP_ID%type )
  IS
  BEGIN
    DELETE FROM DM_SUPER_TYP WHERE SUPER_TYP_ID = p_SUPER_TYP_ID;
  END;

FUNCTION LOOKUP_NAME (P_SUPER_TYPE_ID NUMBER,P_LANGUAGE_ID NUMBER DEFAULT null)
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
      IF v_ret NOT IN ('nn','tn') then
        return v_ret;
      ELSE
        IF P_LANGUAGE_ID is null then
          SELECT SUPER_TYPE_NAME
            INTO v_ret
            FROM dm_super_typ
            WHERE SUPER_TYP_ID = P_SUPER_TYPE_ID;
        ELSE
          v_ret := '';
        END IF;
      END IF;

    RETURN V_RET;
    EXCEPTION
      WHEN OTHERS THEN -- Ha nem talált rekordot super_type tekordot
          RETURN NULL;

  END;

  FUNCTION LOOKUP_NAME (p_short_name DM_SUPER_TYP.SUPER_TYPE_SHORT_NAME%TYPE,P_LANGUAGE_ID   NUMBER DEFAULT null)RETURN VARCHAR2
  AS
  v_dm_super_typ_id DM_SUPER_TYP.SUPER_TYP_ID%TYPE;
  BEGIN
     select DM_SUPER_TYP.SUPER_TYP_ID INTO v_dm_super_typ_id from DM_SUPER_TYP where DM_SUPER_TYP.SUPER_TYPE_SHORT_NAME = p_short_name;
     RETURN lookup_name(v_dm_super_typ_id);
  END;

END DM_SUPER_TYP_tapi;

/
