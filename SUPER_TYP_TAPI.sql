--------------------------------------------------------
--  DDL for Package SUPER_TYP_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SUPER_TYP_TAPI" AS
  FUNCTION LOOKUP_SUPER_TYPE_NAME (P_SUPER_TYPE_ID NUMBER,
                                   P_LANGUAGE_ID   NUMBER DEFAULT null) 
    RETURN VARCHAR2; 

  FUNCTION LOOKUP_SUPER_TYPE_NAME (p_super_type_short_name varchar2, P_LANGUAGE_ID   NUMBER DEFAULT null)
  return varchar2;

FUNCTION LOOKUP_GROUP_ID(P_SUPER_TYPE_ID NUMBER)
  RETURN DM_SUPER_TYP.GROUP_ID % TYPE;

FUNCTION SEARCH_GROUND_LEVEL_ID (p_super_type_id NUMBER)
  RETURN NUMBER;

END SUPER_TYP_TAPI;

/
