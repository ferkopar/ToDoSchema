--------------------------------------------------------
--  DDL for Package Body SUBJECT_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SUBJECT_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU              IN SUBJECT.CRU%type DEFAULT NULL ,
      p_CRD              IN SUBJECT.CRD%type DEFAULT NULL ,
      p_TO_DATE          IN SUBJECT.TO_DATE%type DEFAULT NULL ,
      p_SUBJ_ID          IN SUBJECT.SUBJ_ID%type ,
      p_MDD              IN SUBJECT.MDD%type DEFAULT NULL ,
      p_DESCRIPTION      IN SUBJECT.DESCRIPTION%type DEFAULT NULL ,
      p_MDU              IN SUBJECT.MDU%type DEFAULT NULL ,
      p_SUBJ_CATEGORY_ID IN SUBJECT.SUBJ_CATEGORY_ID%type DEFAULT NULL ,
      p_ROLL_TYPE        IN SUBJECT.ROLL_TYPE%type DEFAULT NULL ,
      p_FROM_DATE        IN SUBJECT.FROM_DATE%type DEFAULT NULL )
  IS
  BEGIN
    INSERT
    INTO SUBJECT
      (
        CRU ,
        CRD ,
        TO_DATE ,
        SUBJ_ID ,
        MDD ,
        DESCRIPTION ,
        MDU ,
        SUBJ_CATEGORY_ID ,
        ROLL_TYPE ,
        FROM_DATE
      )
      VALUES
      (
        p_CRU ,
        p_CRD ,
        p_TO_DATE ,
        p_SUBJ_ID ,
        p_MDD ,
        p_DESCRIPTION ,
        p_MDU ,
        p_SUBJ_CATEGORY_ID ,
        p_ROLL_TYPE ,
        p_FROM_DATE
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU              IN SUBJECT.CRU%type DEFAULT NULL ,
      p_CRD              IN SUBJECT.CRD%type DEFAULT NULL ,
      p_TO_DATE          IN SUBJECT.TO_DATE%type DEFAULT NULL ,
      p_SUBJ_ID          IN SUBJECT.SUBJ_ID%type ,
      p_MDD              IN SUBJECT.MDD%type DEFAULT NULL ,
      p_DESCRIPTION      IN SUBJECT.DESCRIPTION%type DEFAULT NULL ,
      p_MDU              IN SUBJECT.MDU%type DEFAULT NULL ,
      p_SUBJ_CATEGORY_ID IN SUBJECT.SUBJ_CATEGORY_ID%type DEFAULT NULL ,
      p_ROLL_TYPE        IN SUBJECT.ROLL_TYPE%type DEFAULT NULL ,
      p_FROM_DATE        IN SUBJECT.FROM_DATE%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE SUBJECT
    SET CRU            = p_CRU ,
      CRD              = p_CRD ,
      TO_DATE          = p_TO_DATE ,
      MDD              = p_MDD ,
      DESCRIPTION      = p_DESCRIPTION ,
      MDU              = p_MDU ,
      SUBJ_CATEGORY_ID = p_SUBJ_CATEGORY_ID ,
      ROLL_TYPE        = p_ROLL_TYPE ,
      FROM_DATE        = p_FROM_DATE
    WHERE SUBJ_ID      = p_SUBJ_ID;
  END;
-- del
  PROCEDURE del(
      p_SUBJ_ID IN SUBJECT.SUBJ_ID%type )
  IS
  BEGIN
    DELETE FROM SUBJECT WHERE SUBJ_ID = p_SUBJ_ID;
  END;
  FUNCTION GET_CATEGORY(
      p_subj_id NUMBER)
    RETURN NUMBER
  AS
    v_retval NUMBER (12,0);
  BEGIN
    SELECT SUBJECT.SUBJ_CATEGORY_ID
    INTO v_retval
    FROM SUBJECT
    WHERE SUBJ_ID = p_subj_id;
    RETURN v_retval;
  EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
  END;
-- get_subject_name
  FUNCTION GET_SUBJECT_NAME(
      p_subj_id NUMBER)
    RETURN VARCHAR2
  AS
    v_retval VARCHAR2(255) := 'Nincs név hozzárendelve';
    v_ret    VARCHAR2(255);
  BEGIN
    IF GET_CATEGORY(p_subj_id) = 1300 THEN
      -- Ez a szervezetek neve
      BEGIN
        SELECT VALUE
        INTO v_retval
        FROM SUBJ_PARAM
        WHERE SUBJ_ID     = p_subj_id
        AND PARAM_TYPE_ID = 11501;
        RETURN v_retval;
      EXCEPTION
      WHEN OTHERS THEN
        NULL;
      END;
    ELSE
      -- Ez a személyek neve
      BEGIN
        SELECT VALUE
        INTO v_retval
        FROM SUBJ_PARAM
        WHERE SUBJ_ID     = p_subj_id
        AND PARAM_TYPE_ID = 1112;
        SELECT VALUE
        INTO v_ret
        FROM SUBJ_PARAM
        WHERE SUBJ_ID     = p_subj_id
        AND PARAM_TYPE_ID = 1113;
        v_retval         := v_retval || ' ' || v_ret;
        RETURN v_retval;
      EXCEPTION
      WHEN OTHERS THEN
        NULL;
      END;
    END IF;
    RETURN v_retval;
  END GET_SUBJECT_NAME;
  FUNCTION GET_USER_SUBJ_ID(
      p_user_name VARCHAR2)
    RETURN NUMBER
  IS
    v_subj_id NUMBER (12,0);
  BEGIN
    SELECT SUBJ_ID
    INTO v_subj_id
    FROM DM_USER
    WHERE upper(USER_NAME) = UPPER(p_user_name);
    RETURN v_subj_id;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  END;
  FUNCTION GET_USER_NAME(
      p_user_name VARCHAR2)
    RETURN VARCHAR2
  IS
    v_subj_id NUMBER (12,0);
  BEGIN
    RETURN GET_SUBJECT_NAME(GET_USER_SUBJ_ID(p_user_name ));
  END;
  FUNCTION is_user_in(
      p_user_name VARCHAR2,
      p_value     VARCHAR2)
    RETURN BOOLEAN
  IS
    v_any_rows_found NUMBER;
    v_subj_id        NUMBER;
  BEGIN
    v_subj_id := get_user_subj_id(p_user_name);
    SELECT COUNT(*)
    INTO v_any_rows_found
    FROM subj_param
    WHERE rownum       <= 1
    AND subj_id         = v_subj_id
    AND param_type_id   = 1001
    AND value           = p_value;
    IF v_any_rows_found > 0 THEN
      RETURN true;
    ELSE
      RETURN false;
    END IF;
  END;
  FUNCTION is_subj_in_type(
      p_subj_id NUMBER,
      p_type    VARCHAR2)
    RETURN BOOLEAN
  IS
    v_any_rows_found NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO v_any_rows_found
    FROM subj_param
    WHERE
      --   rownum <= 1 and
      subj_id           = p_subj_id
    AND param_type_id   = 1010
    AND value           = p_type;
    IF v_any_rows_found > 0 THEN
      --    htp.p('TRUE p_subj_id:'||p_subj_id || 'p_type :'||p_type);
      RETURN true;
    ELSE
      --    htp.p('FALSE p_subj_id:'||p_subj_id || 'p_type :'||p_type);
      RETURN false;
    END IF;
  END;
  FUNCTION IS_ENDUSER(
      p_subj_id NUMBER)
    RETURN BOOLEAN
  IS
    v_user_name VARCHAR2 (50);
  BEGIN
    SELECT DM_USER.USER_NAME
    INTO v_user_name
    FROM DM_USER
    WHERE SUBJ_ID = p_subj_id;
    RETURN IS_ENDUSER(v_user_name);
  EXCEPTION
  WHEN OTHERS THEN
    RETURN false;
  END;
  FUNCTION IS_ENDUSER(
      p_user_name VARCHAR2)
    RETURN BOOLEAN
  IS
  BEGIN
    RETURN is_user_in(p_user_name,'1011');
  END;
  FUNCTION IS_ADMINISTRATOR(
      p_user_name VARCHAR2)
    RETURN BOOLEAN
  IS
  BEGIN
    RETURN is_user_in(p_user_name,'1012');
  END;
  FUNCTION IS_QUERY_BUILDER(
      p_user_name VARCHAR2)
    RETURN BOOLEAN
  IS
  BEGIN
    RETURN is_user_in(p_user_name,'1013');
  END;
  FUNCTION is_number(
      p_string IN VARCHAR2)
    RETURN BOOLEAN
  IS
    v_new_num NUMBER;
  BEGIN
    v_new_num := TO_NUMBER(p_string);
    RETURN true;
  EXCEPTION
  WHEN VALUE_ERROR THEN
    RETURN false;
  END is_number;
  FUNCTION is_multiply_member(
      p_dm_subject_id NUMBER)
    RETURN BOOLEAN
  IS
    v_ret NUMBER;
  BEGIN
    SELECT MULTIPLY
    INTO v_ret
    FROM dm_subject
    WHERE DM_SUBJECT_ID =
      (SELECT group_id FROM dm_subject WHERE DM_SUBJECT_ID = p_dm_subject_id
      );
    IF v_ret = 0 THEN
      RETURN false;
    ELSE
      RETURN true;
    END IF;
  EXCEPTION
  WHEN OTHERS THEN
    RETURN false;
  END;
  FUNCTION param_row_exists(
      p_param_id NUMBER)
    RETURN BOOLEAN
  AS
    v_ret NUMBER;
  BEGIN
    SELECT COUNT(0) INTO v_ret FROM SUBJ_PARAM WHERE SUBJ_PARAM_ID = p_param_id;
    IF v_ret = 0 THEN
      RETURN false;
    ELSE
      RETURN true;
    END IF;
  END;
  PROCEDURE COMPUTE_JSON(
      p_json VARCHAR2)
  AS
    l_json json := json(p_json);
    l_param_json json;
    l_json_list json_list;
    l_list_cnt NUMBER (2,0);
    l_subj_id  NUMBER(12,0);
    l_param_id NUMBER (12,0);
    l_dm_subject_row dm_subject%rowtype;
    l_subject_row subject%rowtype;
    l_value              VARCHAR2 (2000);
    l_value_type_id      NUMBER (12,0);
    l_group_param_type   NUMBER(12,0);
    l_new_group_param_id NUMBER(12,0);
  BEGIN
    l_subj_id := json_ext.get_number (l_json, 'SUBJ_ID');
    SELECT * INTO l_subject_row FROM SUBJECT WHERE SUBJ_ID = l_subj_id;
    htp.p('Feldolgozás:'||l_subj_id);
    l_json_list := json_ext.get_json_list(l_json,'PARAMS');
    l_list_cnt  := l_json_list.count;
    FOR i IN 1 .. l_list_cnt
    LOOP
      htp.p('Param:'||i);
      l_param_json := json(l_json_list.get(i));
      l_value      := json_ext.GET_STRING(l_param_json, 'PARAM_VALUE');
      htp.p('Param dm id:'||json_ext.get_number (l_param_json, 'DM_SUBJECT_ID'));
      SELECT *
      INTO l_dm_subject_row
      FROM DM_SUBJECT
      WHERE DM_SUBJECT_ID            = json_ext.get_number (l_param_json, 'DM_SUBJECT_ID');
      IF l_dm_subject_row.FIELD_TYPE = 'LOCATION' THEN
         htp.p('LOCATION');
      ELSE
        htp.p('Param dm:'||l_dm_subject_row.dm_subject_id);
        IF l_param_json.exist('PARAM_ID') THEN
          IF l_dm_subject_row.FIELD_TYPE = 'SELECT' THEN
            UPDATE SUBJ_PARAM
            SET VALUE_TYPE_ID   = TO_NUMBER(l_value)
            WHERE SUBJ_PARAM_ID = json_ext.get_number (l_param_json, 'PARAM_ID') ;
          ELSE
            UPDATE SUBJ_PARAM
            SET VALUE           = l_value
            WHERE SUBJ_PARAM_ID = json_ext.get_number (l_param_json, 'PARAM_ID');
          END IF;
        ELSE
          htp.p('új paraméter:');
          IF is_multiply_member(l_dm_subject_row.DM_SUBJECT_ID) THEN
            htp.p('többszörös:'||json_ext.get_number (l_param_json, 'GROUP_ID'));
            IF param_row_exists(json_ext.get_number (l_param_json, 'GROUP_ID')) = false THEN
              htp.p('nem volt csoport:');
              SELECT SUBJ_PARAM_TYPE_ID
              INTO l_group_param_type
              FROM DM_SUBJECT
              WHERE DM_SUBJECT_ID = l_dm_subject_row.GROUP_ID;
              INSERT
              INTO SUBJ_PARAM
                (
                  SUBJ_PARAM_ID,
                  SUBJ_ID,
                  SUBJ_TYPE_ID,
                  PARAM_TYPE_ID
                )
                VALUES
                (
                  json_ext.get_number (l_param_json, 'GROUP_ID'),
                  l_subj_id,
                  l_subject_row.subj_category_id,
                  l_group_param_type
                )
              RETURNING subj_param_id
              INTO l_new_group_param_id;
            ELSE
              htp.p('volt csoport:');
              l_new_group_param_id:= json_ext.get_number (l_param_json, 'GROUP_ID');
            END IF;
            IF l_dm_subject_row.FIELD_TYPE = 'SELECT' THEN
              INSERT
              INTO SUBJ_PARAM
                (
                  SUBJ_ID,
                  SUBJ_TYPE_ID,
                  PARAM_TYPE_ID,
                  GROUP_ID ,
                  VALUE_TYPE_ID
                )
                VALUES
                (
                  l_subj_id,
                  l_subject_row.subj_category_id,
                  l_dm_subject_row.subj_param_type_id,
                  l_new_group_param_id,
                  TO_NUMBER(l_value)
                );
            ELSE
              INSERT
              INTO SUBJ_PARAM
                (
                  SUBJ_ID,
                  SUBJ_TYPE_ID,
                  PARAM_TYPE_ID,
                  GROUP_ID ,
                  VALUE
                )
                VALUES
                (
                  l_subj_id,
                  l_subject_row.subj_category_id,
                  l_dm_subject_row.subj_param_type_id,
                  l_new_group_param_id ,
                  l_value
                );
            END IF;
          ELSE
            htp.p('nem többszörös:');
            IF l_dm_subject_row.FIELD_TYPE = 'SELECT' THEN
              INSERT
              INTO SUBJ_PARAM
                (
                  SUBJ_ID,
                  SUBJ_TYPE_ID,
                  PARAM_TYPE_ID ,
                  VALUE_TYPE_ID
                )
                VALUES
                (
                  l_subj_id,
                  l_subject_row.subj_category_id,
                  l_dm_subject_row.subj_param_type_id,
                  TO_NUMBER(l_value)
                );
            ELSE
              INSERT
              INTO SUBJ_PARAM
                (
                  SUBJ_ID,
                  SUBJ_TYPE_ID,
                  PARAM_TYPE_ID ,
                  VALUE
                )
                VALUES
                (
                  l_subj_id,
                  l_subject_row.subj_category_id,
                  l_dm_subject_row.subj_param_type_id,
                  l_value
                );
            END IF;
          END IF;
        END IF;
      END IF;
    END LOOP;
    htp.p(p_json);
  EXCEPTION
  WHEN OTHERS THEN
    htp.p('An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
    htp.p(p_json);
  END COMPUTE_JSON;
  PROCEDURE DELETE_PARAM_ROW
    (
      p_group_id NUMBER
    )
  AS
  BEGIN
    DELETE FROM SUBJ_PARAM WHERE GROUP_ID = p_group_id;
    DELETE FROM SUBJ_PARAM WHERE SUBJ_PARAM_ID = p_group_id;
    htp.p(p_group_id);
  END;
END SUBJECT_tapi;

/
