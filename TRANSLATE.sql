--------------------------------------------------------
--  DDL for Package TRANSLATE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "TRANSLATE" AS
    FUNCTION ADD_OR_REPLACE_SUPER_TYP_TR(p_super_typ_id number,p_language_id number, p_text varchar2)
    return number;
END TRANSLATE;

/
