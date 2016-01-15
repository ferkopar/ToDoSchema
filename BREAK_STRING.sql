--------------------------------------------------------
--  DDL for Function BREAK_STRING
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BREAK_STRING" (IN_STR  IN VARCHAR2,
                                                   CHAR_NO IN NUMBER)
  RETURN VARCHAR2
  AS
    v_cnt    NUMBER(5, 0)    := 0;
    v_retval VARCHAR2(20000) := '';
    v_char   VARCHAR2(2);
  BEGIN
    IF IN_STR IS NOT NULL
    THEN
      FOR i IN 1 .. LENGTH(IN_STR)
      LOOP
        BEGIN
          v_char := SUBSTR(IN_STR, i, 1);
          v_cnt := v_cnt + 1;
          IF v_cnt > char_no
          THEN
            IF v_char = ' '
            THEN
              v_retval := v_retval || '<br/>';
              v_cnt := 0;
            ELSE
              v_retval := v_retval || v_char;
            END IF;
          ELSE
            v_retval := v_retval || v_char;
          END IF;
        EXCEPTION
          WHEN OTHERS THEN EXIT;
        END;
      END LOOP;
    ELSE
      v_retval := '';
    END IF;
    RETURN v_retval;
  END BREAK_STRING;

/
