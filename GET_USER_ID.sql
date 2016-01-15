--------------------------------------------------------
--  DDL for Function GET_USER_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_USER_ID" (p_string VARCHAR2,
                                                  p_search VARCHAR2)
  RETURN VARCHAR2
  AS
    v_pos  INTEGER;
    v_pos1 INTEGER;
    v_str  VARCHAR2(2000);
    lv_str VARCHAR2(2000);
  BEGIN
    v_pos := INSTR(p_string, ',', 1, 1);
    lv_str := p_string;
    IF v_pos = 0
    THEN
      RETURN p_string;
    END IF;
    WHILE (v_pos != 0)
      LOOP
        v_str := SUBSTR(lv_str, 1, v_pos - 1);
        v_pos1 := INSTR(v_str, p_search, 1, 1);
        IF v_pos1 != 0
        THEN
          v_str := SUBSTR(v_str, INSTR(v_str, ':', 1, 1) + 1);
          IF v_str = 'null'
          THEN
            RETURN NULL;
          END IF;
          RETURN v_str;
        END IF;
        -- remove chunk from string
        lv_str := SUBSTR(lv_str, v_pos + 1, LENGTH(lv_str));
        -- determine next chunk
        v_pos := INSTR(lv_str, ',', 1, 1);
        -- no last chunk, add to array
        IF v_pos = 0
        THEN

          v_str := lv_str;
          v_pos1 := INSTR(v_str, p_search, 1, 1);
          IF v_pos1 != 0
          THEN
            v_str := SUBSTR(v_str, INSTR(v_str, ':', 1, 1) + 1);
            IF v_str = 'null'
            THEN
              RETURN NULL;
            END IF;
            RETURN v_str;
          END IF;
        END IF;

      END LOOP;
    RETURN NULL;
  END;

/
