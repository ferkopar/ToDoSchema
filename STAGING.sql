--------------------------------------------------------
--  DDL for Package STAGING
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "STAGING" AS

PROCEDURE LOAD_SUBJ_FROM_SZALLITO;
PROCEDURE LOAD_SUBJ_FROM_VEVO;
PROCEDURE LOAD_FROM_WORKERS; 
PROCEDURE ADJUST_STREET(p_city number);
PROCEDURE ADJUST_STREETS;

END STAGING;

/
