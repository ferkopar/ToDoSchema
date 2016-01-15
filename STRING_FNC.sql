--------------------------------------------------------
--  DDL for Package STRING_FNC
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "STRING_FNC" 
IS

TYPE t_array IS TABLE OF VARCHAR2(3900)
   INDEX BY BINARY_INTEGER;

FUNCTION SPLIT2ARRAY (p_in_string VARCHAR2, p_delim VARCHAR2) RETURN t_array;

END;

/
