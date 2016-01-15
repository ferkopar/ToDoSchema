--------------------------------------------------------
--  DDL for Function GET_TREATM_CREATE_BTN_TEXT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_CREATE_BTN_TEXT" (p_treatm_group_id NUMBER,
                                                                 p_action          VARCHAR2 DEFAULT NULL)
  RETURN VARCHAR2
  AS
    v_action VARCHAR2(50);
  BEGIN
    IF p_action IS NOT NULL
      AND p_action = 'COPY'
    THEN
      v_action := 'létrehozása';
    ELSE
      v_action := 'mentése';
    END IF;
    IF p_treatm_group_id = 1601
    THEN
      RETURN 'Normafej ' || v_action;
    ELSIF p_treatm_group_id = 1603
    THEN
      RETURN 'Tervfej ' || v_action;
    ELSIF p_treatm_group_id = 1604
    THEN
      RETURN 'Tényfej ' || v_action;
    ELSE
      RETURN 'TREATM fej';
    END IF;
  END;

/
