--------------------------------------------------------
--  DDL for Function GET_RANDOM_DATE_TEXT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_RANDOM_DATE_TEXT" 
  RETURN varchar2
AS
BEGIN
   return to_char(TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1940-01-01','J'),TO_CHAR(DATE '1990-12-31','J')
                                    )),'J'),'YYYY.MM.DD');
END;

/
