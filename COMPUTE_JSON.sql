--------------------------------------------------------
--  DDL for Package COMPUTE_JSON
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "COMPUTE_JSON" AS

FUNCTION TREATM(p_json varchar2)    return number; 
FUNCTION DM_TREATM(p_json varchar2) return number;
FUNCTION DM_SUPER_TYPE(p_json varchar2) return number;
FUNCTION SUBJECTIV(p_json varchar2) return number;

END COMPUTE_JSON;

/
