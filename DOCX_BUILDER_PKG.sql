--------------------------------------------------------
--  DDL for Package DOCX_BUILDER_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DOCX_BUILDER_PKG" AS
  PROCEDURE GENERATE_DOCX(p_template BLOB); 
  PROCEDURE GENERATE_DOCX(p_template NUMBER := 1000);

END DOCX_BUILDER_PKG;

/
