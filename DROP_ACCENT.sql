--------------------------------------------------------
--  DDL for Function DROP_ACCENT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DROP_ACCENT" (p_text varchar2)
  RETURN varchar2
AS
BEGIN
  return TRANSLATE(p_text,'φόσυϊιαϋνΦάΣΥΪΙΑΫΝ', 'ouooueauiOUOOUEAUI');
END;

/
