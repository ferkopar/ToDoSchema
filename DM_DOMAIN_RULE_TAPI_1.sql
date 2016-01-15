--------------------------------------------------------
--  DDL for Package Body DM_DOMAIN_RULE_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_DOMAIN_RULE_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU                IN DM_DOMAIN_RULE.CRU%type DEFAULT NULL ,
      p_TO_DATE            IN DM_DOMAIN_RULE.TO_DATE%type DEFAULT NULL ,
      p_SUPER_GROUP_TREE   IN DM_DOMAIN_RULE.SUPER_GROUP_TREE%type DEFAULT NULL ,
      p_TARGET_TABLE_NAME  IN DM_DOMAIN_RULE.TARGET_TABLE_NAME%type DEFAULT NULL ,
      p_DESCRIPTION        IN DM_DOMAIN_RULE.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN DM_DOMAIN_RULE.MDU%type DEFAULT NULL ,
      p_FROM_DATE          IN DM_DOMAIN_RULE.FROM_DATE%type DEFAULT NULL ,
      p_CRD                IN DM_DOMAIN_RULE.CRD%type DEFAULT NULL ,
      p_MDD                IN DM_DOMAIN_RULE.MDD%type DEFAULT NULL ,
      p_RULE_TYPE_ID       IN DM_DOMAIN_RULE.RULE_TYPE_ID%type DEFAULT NULL ,
      p_SUPER_GROUP_ID     IN DM_DOMAIN_RULE.SUPER_GROUP_ID%type DEFAULT NULL ,
      p_DOMAIN_RULE_ID     IN DM_DOMAIN_RULE.DOMAIN_RULE_ID%type ,
      p_DOMAIN_ID          IN DM_DOMAIN_RULE.DOMAIN_ID%type ,
      p_TARGET_COLUMN_NAME IN DM_DOMAIN_RULE.TARGET_COLUMN_NAME%type DEFAULT NULL )
  IS
  BEGIN
    INSERT
    INTO DM_DOMAIN_RULE
      (
        CRU ,
        TO_DATE ,
        SUPER_GROUP_TREE ,
        TARGET_TABLE_NAME ,
        DESCRIPTION ,
        MDU ,
        FROM_DATE ,
        CRD ,
        MDD ,
        RULE_TYPE_ID ,
        SUPER_GROUP_ID ,
        DOMAIN_RULE_ID ,
        DOMAIN_ID ,
        TARGET_COLUMN_NAME
      )
      VALUES
      (
        p_CRU ,
        p_TO_DATE ,
        p_SUPER_GROUP_TREE ,
        p_TARGET_TABLE_NAME ,
        p_DESCRIPTION ,
        p_MDU ,
        p_FROM_DATE ,
        p_CRD ,
        p_MDD ,
        p_RULE_TYPE_ID ,
        p_SUPER_GROUP_ID ,
        p_DOMAIN_RULE_ID ,
        p_DOMAIN_ID ,
        p_TARGET_COLUMN_NAME
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU                IN DM_DOMAIN_RULE.CRU%type DEFAULT NULL ,
      p_TO_DATE            IN DM_DOMAIN_RULE.TO_DATE%type DEFAULT NULL ,
      p_SUPER_GROUP_TREE   IN DM_DOMAIN_RULE.SUPER_GROUP_TREE%type DEFAULT NULL ,
      p_TARGET_TABLE_NAME  IN DM_DOMAIN_RULE.TARGET_TABLE_NAME%type DEFAULT NULL ,
      p_DESCRIPTION        IN DM_DOMAIN_RULE.DESCRIPTION%type DEFAULT NULL ,
      p_MDU                IN DM_DOMAIN_RULE.MDU%type DEFAULT NULL ,
      p_FROM_DATE          IN DM_DOMAIN_RULE.FROM_DATE%type DEFAULT NULL ,
      p_CRD                IN DM_DOMAIN_RULE.CRD%type DEFAULT NULL ,
      p_MDD                IN DM_DOMAIN_RULE.MDD%type DEFAULT NULL ,
      p_RULE_TYPE_ID       IN DM_DOMAIN_RULE.RULE_TYPE_ID%type DEFAULT NULL ,
      p_SUPER_GROUP_ID     IN DM_DOMAIN_RULE.SUPER_GROUP_ID%type DEFAULT NULL ,
      p_DOMAIN_RULE_ID     IN DM_DOMAIN_RULE.DOMAIN_RULE_ID%type ,
      p_DOMAIN_ID          IN DM_DOMAIN_RULE.DOMAIN_ID%type ,
      p_TARGET_COLUMN_NAME IN DM_DOMAIN_RULE.TARGET_COLUMN_NAME%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE DM_DOMAIN_RULE
    SET CRU              = p_CRU ,
      TO_DATE            = p_TO_DATE ,
      SUPER_GROUP_TREE   = p_SUPER_GROUP_TREE ,
      TARGET_TABLE_NAME  = p_TARGET_TABLE_NAME ,
      DESCRIPTION        = p_DESCRIPTION ,
      MDU                = p_MDU ,
      FROM_DATE          = p_FROM_DATE ,
      CRD                = p_CRD ,
      MDD                = p_MDD ,
      RULE_TYPE_ID       = p_RULE_TYPE_ID ,
      SUPER_GROUP_ID     = p_SUPER_GROUP_ID ,
      DOMAIN_ID          = p_DOMAIN_ID ,
      TARGET_COLUMN_NAME = p_TARGET_COLUMN_NAME
    WHERE DOMAIN_RULE_ID = p_DOMAIN_RULE_ID;
  END;
-- del
  PROCEDURE del(
      p_DOMAIN_RULE_ID IN DM_DOMAIN_RULE.DOMAIN_RULE_ID%type )
  IS
  BEGIN
    DELETE FROM DM_DOMAIN_RULE WHERE DOMAIN_RULE_ID = p_DOMAIN_RULE_ID;
  END;

FUNCTION GET_GROUP(p_domain_id NUMBER,p_rule_type_id NUMBER, p_target_table_name VARCHAR2, p_target_column_name VARCHAR2) RETURN NUMBER as
  v_ret_val number (12,0);
  v_error_string VARCHAR2 (2000);
  begin
    select super_group_id into v_ret_val FROM dm_domain_rule 
    where domain_id = p_domain_id
    AND RULE_TYPE_ID = p_rule_type_id
    AND Target_table_name  = p_target_table_name 
    AND target_column_name = p_target_column_name;
    RETURN v_ret_val;
  exception when no_data_found then 
    v_error_string := 'Nem talát sort a DM_DOMAIN_RULE táblában'|| chr(13);
    v_error_string := v_error_string || 'p_domain_id : '||p_domain_id|| chr(13);
    v_error_string := v_error_string || 'p_rule_type_id : '||p_rule_type_id|| chr(13);
    v_error_string := v_error_string || 'p_target_table_name : '||p_target_table_name|| chr(13);
    v_error_string := v_error_string || 'p_target_column_name : '||p_target_column_name|| chr(13);
    --RAISE_APPLICATION_ERROR(-20001,v_error_string);
    return 0;
  end;

  FUNCTION GET_TREE(p_domain_id NUMBER,p_rule_type_id NUMBER, p_target_table_name VARCHAR2, p_target_column_name VARCHAR2) RETURN NUMBER as
  v_ret_val number (12,0);
  begin
    select super_group_tree into v_ret_val FROM dm_domain_rule 
    where domain_id = p_domain_id
    AND RULE_TYPE_ID = p_rule_type_id
    AND Target_table_name  = p_target_table_name 
    AND target_column_name = p_target_column_name;
    RETURN v_ret_val;
  end;

END DM_DOMAIN_RULE_tapi;

/
