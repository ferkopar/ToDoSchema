--------------------------------------------------------
--  DDL for Package GHTML_BASE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GHTML_BASE" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
 PROCEDURE GENERATE_PNG( p_mm_id IN NUMBER );
 PROCEDURE GENERATE_PNG( p_file_mame IN varchar2 );
 PROCEDURE GENERATE_FLAG(p_language_id number);
 PROCEDURE GENERATE_BIG_FLAG(p_language_id number);

 
END GHTML_BASE;

/
