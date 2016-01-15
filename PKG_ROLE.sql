--------------------------------------------------------
--  DDL for Package PKG_ROLE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PKG_ROLE" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  function RLOOKUP_5083273_SUBJ_PARAM_ID(P_TEXT varchar)return integer;
  function RLOOKUP_ROLE_ID(P_TEXT varchar)return integer;
  function rlookup_STAT_TYPE_ID (P_TEXT varchar)return integer;
END PKG_ROLE;

/
