--------------------------------------------------------
--  DDL for View VT_DM_LANGUAGE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VT_DM_LANGUAGE" ("LANGUAGE_ID", "T_LANGUAGE_NAME", "LANGUAGE_TYP", "APEX_LANGUAGE", "RL", "DESCRIPTION", "FROM_DATE", "TO_DATE", "CRU", "CRD", "MDU", "MDD", "LANGUAGE_CODE") AS 
  SELECT LANGUAGE_ID,
    BASE_PKG.DM_TRANSLATE_F ('DM_LANGUAGE' ,'LANGUAGE_ID' ,LANGUAGE_ID ,BASE_PKG.V_LANG_F )||' ('||language_id||')'  T_LANGUAGE_NAME,
    LANGUAGE_TYP,
    RL,
    DESCRIPTION,
    FROM_DATE,
    TO_DATE,
    CRU,
    CRD,
    MDU,
    MDD,
    LANGUAGE_CODE,
    STATUS_ID
  FROM DM_LANGUAGE
  WHERE BASE_PKG.RIGHTS_READ_ROW_F('DM_LANGUAGE',LANGUAGE_ID,STATUS_ID)='Y'
    AND STATUS_ID                                             =3
  AND (FROM_DATE  <=sysdate
  OR FROM_DATE    IS NULL)
  AND (TO_DATE     >sysdate
  OR TO_DATE      IS NULL)
  AND LANGUAGE_TYP ='Alapnyelv';
