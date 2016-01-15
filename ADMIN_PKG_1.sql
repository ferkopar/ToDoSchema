--------------------------------------------------------
--  DDL for Package Body ADMIN_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "ADMIN_PKG" is
  PROCEDURE execute_plsql_block (plsql_code_block CLOB) IS
    ds_cur              PLS_INTEGER        := DBMS_SQL.OPEN_CURSOR;
    sql_table           DBMS_SQL.VARCHAR2S;
    c_buf_len  CONSTANT BINARY_INTEGER     := 256;
    v_accum             INTEGER            := 0;
    v_beg               INTEGER            := 1;
    v_end               INTEGER            := 256;
    v_loblen            PLS_INTEGER;
    v_retval            PLS_INTEGER;

---------------------------
-- local function to the execute_plsql_block procedure
    FUNCTION next_row (clob_in IN CLOB, len_in IN INTEGER, off_in IN INTEGER)
      RETURN VARCHAR2 IS
    BEGIN
      RETURN DBMS_LOB.SUBSTR (clob_in, len_in, off_in);
    END next_row;
---------------------------
  BEGIN
    v_loblen := DBMS_LOB.getlength (plsql_code_block);

    LOOP
      -- Set the length to the remaining size
      -- if there are < c_buf_len characters remaining.
      IF v_accum + c_buf_len > v_loblen THEN
        v_end := v_loblen - v_accum;
      END IF;

      sql_table (NVL (sql_table.LAST, 0) + 1) := next_row (plsql_code_block, v_end, v_beg);
      v_beg := v_beg + c_buf_len;
      v_accum := v_accum + v_end;

      IF v_accum >= v_loblen THEN
        EXIT;
      END IF;
    END LOOP;

    -- Parse the pl/sql and execute it
    DBMS_SQL.PARSE (ds_cur, sql_table, sql_table.FIRST, sql_table.LAST, FALSE, DBMS_SQL.native);
    v_retval := DBMS_SQL.EXECUTE (ds_cur);
    DBMS_SQL.CLOSE_CURSOR (ds_cur);
  END execute_plsql_block;

  FUNCTION GET_USER_TABLE_PK(p_table IN user_tables.table_name%TYPE) return VARCHAR2
  is
    v_retval ALL_CONS_COLUMNS.COLUMN_NAME%TYPE := null;
  begin 
  SELECT cols.column_name INTO v_retval
     FROM all_constraints cons, all_cons_columns cols
     WHERE cons.constraint_type = 'P'
     AND cons.owner = USER
     AND cons.constraint_name = cols.constraint_name
     AND cons.owner = cols.owner
     AND cols.table_name = p_table;
   return v_retval;
   exception 
    WHEN others then
   return null;
  end;
     
  PROCEDURE cre_trg 
  is
   CURSOR cur_table IS
            SELECT   table_name
          FROM USER_TABLES 
         WHERE
--           table_name NOT IN ('LOG_TABLE') AND
           table_name NOT LIKE '%TEMP' AND
           table_name NOT LIKE 'ADMIN%' AND
           table_name NOT LIKE 'W%'
      ORDER BY table_name;

    v_command  VARCHAR(4000);
    v_id_col ALL_CONS_COLUMNS.COLUMN_NAME%TYPE ;
 BEGIN
  FOR t IN cur_table
  LOOP
    v_id_col    := GET_USER_TABLE_PK(t.table_name);
    IF v_id_col IS NOT NULL THEN
      v_command := 'create or replace TRIGGER TRG2_'||t.table_name|| CHR (10);
      v_command := v_command || 'BEFORE INSERT OR UPDATE ON ' || t.table_name ||' FOR EACH ROW'|| CHR (10);
      v_command := v_command || 'BEGIN'|| CHR (10);
      v_command := v_command || '  IF INSERTING'|| CHR (10);
      v_command := v_command || '  THEN'|| CHR (10);
      v_command := v_command || '    IF :new.'|| v_id_col ||' IS NULL OR :new.'|| v_id_col ||' = 0'|| CHR (10);
      v_command := v_command || '      THEN'|| CHR (10);
      v_command := v_command || '      SELECT SEQ_BASE.NEXTVAL'|| CHR (10);
      v_command := v_command || '      INTO :NEW.'||v_id_col||CHR (10);
      v_command := v_command || '      FROM DUAL;'|| CHR (10);
      v_command := v_command || '      END IF;'|| CHR (10);
      v_command := v_command || '      :new.CRD := SYSTIMESTAMP;      --LÉTREHOZÁS IDÕPONTJA '|| CHR (10);
      v_command := v_command || '      :NEW.CRU := NVL(V(''APP_USER''), USER); --APEX USER AKI LÉTREHOZZA A REKORDOT'|| CHR (10);
      v_command := v_command || '      ELSIF UPDATING'|| CHR (10);
      v_command := v_command || '      THEN'|| CHR (10);
      v_command := v_command || '      :new.MDD := SYSTIMESTAMP;      --MÓDOSÍTÁS IDÕPONTJA'|| CHR (10);
      v_command := v_command || '      :NEW.MDU := NVL(V(''APP_USER''), USER); --APEX USER AKI MÓDOSÍT'|| CHR (10);
      v_command := v_command || '      END IF;'|| CHR (10);
      v_command := v_command || '      END TRG_'||t.table_name||';';
      DBMS_OUTPUT.PUT_LINE ('create trigger for '|| t.table_name );
      -- execute_plsql_block (v_command);
      execute IMMEDIATE v_command;
      v_command := NULL;
    ELSE
      DBMS_OUTPUT.PUT_LINE ('Nincs elsõdleges kulcs:'||t.table_name );
    END IF;
  END LOOP;
END; 

  PROCEDURE cre_logtrg_t (p_table IN USER_TABLES.table_name%TYPE) IS
    CURSOR cur_table IS
      SELECT   table_name
          FROM USER_TABLES ut
         WHERE
       -- EXISTS (SELECT 1 FROM USER_CONSTRAINTS uc
        --                WHERE ut.table_name = uc.table_name AND uc.constraint_type = 'P')
          -- AND table_name LIKE p_table
           --AND 
           table_name NOT IN ('LOG_TABLE')
           AND table_name NOT LIKE 'ADMIN%'
           AND table_name NOT LIKE 'W%'
      ORDER BY table_name;

    CURSOR cur_id (p_table_name USER_TABLES.table_name%TYPE) IS
      SELECT   column_name
          FROM USER_CONSTRAINTS ct, USER_CONS_COLUMNS cc
         WHERE ct.constraint_name = cc.constraint_name
           AND ct.table_name = cc.table_name
           AND ct.constraint_type = 'P'
           AND ct.table_name = p_table_name
      ORDER BY cc.POSITION;

    CURSOR cur_col (p_table_name USER_TABLES.table_name%TYPE) IS
      SELECT   column_name, nullable, data_type
          FROM USER_TAB_COLUMNS
         WHERE table_name = p_table_name
      --         and rownum <= 41
      ORDER BY column_id;

    v_id1      VARCHAR2 (4000);
    v_count    NUMBER (10)    := 0;
    --    v_command   LONG;
    v_command  CLOB;
    v_sep      VARCHAR2 (100);
  BEGIN
    FOR c1 IN cur_table LOOP
      v_count := 0;
      v_command := 'CREATE OR REPLACE TRIGGER LTRG_' || c1.table_name || CHR (10);
      v_command := v_command || 'AFTER UPDATE OR DELETE OR INSERT ON ' || c1.table_name || CHR (10);
      v_command := v_command || 'REFERENCING OLD AS OLD NEW AS NEW FOR EACH ROW' || CHR (10);
      v_command := v_command || 'DECLARE' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_command := v_command || 'DECLARE' || CHR (10);
      v_command := v_command || 'V_TNAME VARCHAR2(30) := ''' || c1.table_name || ''';' || CHR (10);
      v_command := v_command || 'VALUE_EX EXCEPTION;' || CHR (10);
      v_command := v_command || 'INSERT_EXC EXCEPTION;' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_command := v_command || 'IF updating THEN' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_sep := '';
      v_id1 := '';

      FOR c2 IN cur_id (c1.table_name) LOOP
        v_id1 := v_id1 || v_sep || ':new.' || c2.column_name;
        v_sep := '||''||''||';
      END LOOP;

      FOR c3 IN cur_col (c1.table_name) LOOP
        IF c3.data_type IN ('CHAR', 'VARCHAR2', 'NUMBER', 'DATE') THEN
          v_command :=
            v_command || 'IF   (:new.' || c3.column_name || ' IS NULL AND :old.' || c3.column_name || ' IS NOT NULL)'
            || CHR (10);
          v_command :=
            v_command || '  OR (:new.' || c3.column_name || ' IS NOT NULL AND :old.' || c3.column_name || ' IS NULL)'
            || CHR (10);
          v_command := v_command || '  OR (:new.' || c3.column_name || ' != :old.' || c3.column_name || ') THEN ' || CHR (10);
          v_command := v_command || 'INSERT INTO LOG_TABLE' || CHR (10);
          v_command := v_command || '(LOG_ID, OPERATION_TIME, TABLE_NAME,' || CHR (10);
          v_command := v_command || 'RECORD_ID, OPERATION_TYPE, USER_NAME,' || CHR (10);
          v_command := v_command || ' COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)' || CHR (10);
          v_command := v_command || 'VALUES' || CHR (10);
          v_command := v_command || '(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,' || CHR (10);
          v_command := v_command || v_id1 || ',''U'',admin_pkg.apex_user,' || CHR (10);
          v_command :=
            v_command || '''' || c3.column_name || ''',:old.' || c3.column_name || ',:new.' || c3.column_name || ',v(''EPI_ID'') );'
            || CHR (10);
          v_command := v_command || 'END IF;' || CHR (10);
        --end if;
        END IF;
      END LOOP;

      v_command := v_command || 'EXCEPTION' || CHR (10);
      v_command := v_command || 'WHEN VALUE_ERROR THEN RAISE VALUE_EX;' || CHR (10);
      v_command := v_command || 'WHEN OTHERS THEN RAISE INSERT_EXC;' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      v_command := v_command || 'END IF;' || CHR (10);
      v_command := v_command || 'IF deleting THEN' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_sep := '';
      v_id1 := '';

      FOR c2 IN cur_id (c1.table_name) LOOP
        v_id1 := v_id1 || v_sep || ':old.' || c2.column_name;
        v_sep := '||''||''||';
      END LOOP;

      FOR c3 IN cur_col (c1.table_name) LOOP
        IF c3.data_type IN ('CHAR', 'VARCHAR2', 'NUMBER', 'DATE') THEN
          v_command := v_command || 'INSERT INTO LOG_TABLE' || CHR (10);
          v_command := v_command || '(LOG_ID, OPERATION_TIME, TABLE_NAME,' || CHR (10);
          v_command := v_command || 'RECORD_ID, OPERATION_TYPE, USER_NAME,' || CHR (10);
          v_command := v_command || ' COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)' || CHR (10);
          v_command := v_command || 'VALUES' || CHR (10);
          v_command := v_command || '(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,' || CHR (10);
          v_command := v_command || v_id1 || ',''D'',admin_pkg.apex_user,' || CHR (10);
          v_command :=
            v_command || '''' || c3.column_name || ''',:old.' || c3.column_name || ',:new.' || c3.column_name || ',v(''EPI_ID'') );'
            || CHR (10);
        END IF;
      END LOOP;

      v_command := v_command || 'EXCEPTION' || CHR (10);
      v_command := v_command || 'WHEN VALUE_ERROR THEN RAISE VALUE_EX;' || CHR (10);
      v_command := v_command || 'WHEN OTHERS THEN RAISE INSERT_EXC;' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      v_command := v_command || 'END IF;' || CHR (10);
      v_command := v_command || 'IF inserting THEN' || CHR (10);
      v_command := v_command || 'BEGIN' || CHR (10);
      v_sep := '';
      v_id1 := '';

      FOR c2 IN cur_id (c1.table_name) LOOP
        v_id1 := v_id1 || v_sep || ':new.' || c2.column_name;
        v_sep := '||''||''||';
      END LOOP;

         v_command := v_command || 'INSERT INTO LOG_TABLE' || CHR (10);
        v_command := v_command || '(LOG_ID, OPERATION_TIME, TABLE_NAME,' || CHR (10);
        v_command := v_command || ' RECORD_ID, OPERATION_TYPE, USER_NAME,' || CHR (10);
        v_command := v_command || ' COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)' || CHR (10);
        v_command := v_command || 'VALUES' || CHR (10);
        v_command := v_command || '(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,' || CHR (10);
        v_command := v_command || v_id1 || ',''I'',admin_pkg.apex_user,' || CHR (10);
        v_command := v_command || 'null,null,null,v(''EPI_ID'') );' || CHR (10);
 
      v_command := v_command || 'EXCEPTION' || CHR (10);
      v_command := v_command || 'WHEN VALUE_ERROR THEN RAISE VALUE_EX;' || CHR (10);
      v_command := v_command || 'WHEN OTHERS THEN RAISE INSERT_EXC;' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      v_command := v_command || 'END IF;' || CHR (10);
      v_command := v_command || 'EXCEPTION' || CHR (10);
      v_command := v_command || 'WHEN VALUE_EX THEN' || CHR (10);
      v_command := v_command || 'raise_application_error(-20201,' || '''Value error on LOG_TABLE insert:''' || ');' || CHR (10);
      v_command := v_command || 'WHEN INSERT_EXC THEN' || CHR (10);
      v_command := v_command || 'raise_application_error(-20202,' || '''Error on LOG_TABLE insert!''' || ');' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      v_command := v_command || 'END;' || CHR (10);
      --      EXECUTE IMMEDIATE (v_command);
      execute_plsql_block (v_command);
      v_command := NULL;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE (SQLERRM);
  END;

-- ******************************************************
  PROCEDURE dis_logtrg (p_table IN USER_TABLES.table_name%TYPE) IS
    CURSOR c_trigger IS
      SELECT trigger_name
        FROM ALL_TRIGGERS
       WHERE trigger_name LIKE 'LTRG_' || p_table;

    rec  c_trigger%ROWTYPE;
  BEGIN
    DBMS_OUTPUT.ENABLE (1000000);

    OPEN c_trigger;

    LOOP
      FETCH c_trigger
       INTO rec;

      EXIT WHEN c_trigger%NOTFOUND;

      EXECUTE IMMEDIATE ('ALTER TRIGGER ' || rec.trigger_name || ' DISABLE');
    END LOOP;

    CLOSE c_trigger;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE (rec.trigger_name || ':' || SQLERRM);

      CLOSE c_trigger;
  END;

-- ******************************************************
  PROCEDURE en_logtrg (p_table IN USER_TABLES.table_name%TYPE) IS
    CURSOR c_trigger IS
      SELECT trigger_name
        FROM ALL_TRIGGERS
       WHERE trigger_name LIKE 'LTRG_' || p_table;

    rec  c_trigger%ROWTYPE;
  BEGIN
    DBMS_OUTPUT.ENABLE (1000000);

    OPEN c_trigger;

    LOOP
      FETCH c_trigger
       INTO rec;

      EXIT WHEN c_trigger%NOTFOUND;

      EXECUTE IMMEDIATE ('ALTER TRIGGER ' || rec.trigger_name || ' ENABLE');
    END LOOP;

    CLOSE c_trigger;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE (rec.trigger_name || ':' || SQLERRM);

      CLOSE c_trigger;
  END;
-- ******************************************************
  procedure enable_all_constraint (p_table in user_tables.table_name%type default null) is
  BEGIN
  FOR c IN
  (SELECT c.owner, c.table_name, c.constraint_name
   FROM user_constraints c, user_tables t
   WHERE c.table_name = t.table_name and t.table_name like p_table||'%'
   AND c.status = 'DISABLED'
   ORDER BY decode(c.constraint_type,'R',1,'U',2,'P',3,'C',4) desc )
  LOOP
    dbms_output.put_line('alter table "' || c.owner || '"."' || c.table_name || '" enable constraint ' || c.constraint_name);
    dbms_utility.exec_ddl_statement('alter table "' || c.owner || '"."' || c.table_name || '" enable constraint "' || c.constraint_name||'"');
  END LOOP;
END enable_all_constraint;
  procedure disable_all_constraint (p_table in user_tables.table_name%type default null) is
BEGIN
  FOR c IN
  (SELECT c.owner, c.table_name, c.constraint_name
   FROM user_constraints c, user_tables t
   WHERE c.table_name = t.table_name and t.table_name like p_table||'%'
   AND c.status = 'ENABLED'
   ORDER BY decode(c.constraint_type,'R',1,'U',2,'P',3,'C',4) )
  LOOP
    dbms_output.put_line('alter table "' || c.owner || '"."' || c.table_name || '" disable constraint ' || c.constraint_name);
    dbms_utility.exec_ddl_statement('alter table "' || c.owner || '"."' || c.table_name || '" disable constraint "' || c.constraint_name||'"');
  END LOOP;
END disable_all_constraint;
procedure translate_remove_dupl is
 cursor cur is 
  SELECT TBL_NAME,TBL_COL_NAME,TBL_PK_ID
     ,count(9)
      FROM DM_TRANSLATE
group by TBL_NAME,TBL_COL_NAME,TBL_PK_ID
having count(9)>1;
 v_min number;
 v_max number;
begin
 for r in cur loop
  select min(text_id) INTO v_min
   from  DM_TRANSLATE 
   where r.TBL_NAME=TBL_NAME AND R.TBL_COL_NAME=TBL_COL_NAME AND R.TBL_PK_ID=TBL_PK_ID;
  select max(text_id) INTO v_max
   from  DM_TRANSLATE 
   where r.TBL_NAME=TBL_NAME AND R.TBL_COL_NAME=TBL_COL_NAME AND R.TBL_PK_ID=TBL_PK_ID;
  delete DM_TRANSLATE 
   where r.TBL_NAME=TBL_NAME AND R.TBL_COL_NAME=TBL_COL_NAME AND R.TBL_PK_ID=TBL_PK_ID
    and text_id=v_max;
  update dm_text
   set text_id=v_min
   where text_id=v_max;  
 end loop;
end;
PROCEDURE Image_Load (
 vFileName  in varchar2
) 
IS
  l_source bfile;
  l_dest   blob;
  --create or replace directory KEP_DIR as 'c:\tmp';
BEGIN
  null;
  l_source:= bfilename ('KEP_DIR', vFileName);
  update mm_files mm set mm_blob=empty_blob() where mm.file_name=vFileName;
  select mm_blob into l_dest from mm_files mm where mm.file_name=vFileName;
  DBMS_LOB.fileopen (l_source, DBMS_LOB.file_readonly);
  DBMS_LOB.loadfromfile (l_dest, l_source, DBMS_LOB.getlength (l_source));
  DBMS_LOB.fileclose (l_source);
exception when others then
  update mm_files mm set stat_type_id=-1 where mm.file_name=vFileName;
END Image_Load;
PROCEDURE all_Image_Load is
 cursor cur is select file_name from  mm_files where file_name is not null;
 begin
  for r in cur loop
   Image_Load(r.file_name);
  end loop;
 end all_Image_Load;
procedure TR_ITEMS is
 v_id number:=1;
 v_page number:=90000;
 v_item_onpage number:=10;
 cursor cur is 
  select t.apex_page page,substr(t.apex_variable,2,length(t.apex_variable)-2) item_name
  from dm_translate t
  where t.apex_variable is not null
  order by 1,2;
 procedure ins(p_txt varchar2) is
  begin
   insert into DEV_TEMP (dev_temp_id,TEXT) values (v_id,p_txt||chr(10));
   v_id:=v_id+1;
  end ins;
 procedure page_begin is
  begin
ins('--application/pages/page_'||v_page);
ins('prompt  ...PAGE '||v_page||': '||v_page);
ins('--');
ins(' ');
ins('begin');
ins(' ');
ins('wwv_flow_api.create_page (');
ins('  p_flow_id => wwv_flow.g_flow_id');
ins(' ,p_id => '||v_page);
ins(' ,p_name => '''||v_page||'''');
ins(' ,p_step_title => '''||v_page||'''');
ins(' ,p_step_sub_title => '''||v_page||'''');
ins(' ,p_step_sub_title_type => ''TEXT_WITH_SUBSTITUTIONS''');
ins(' ,p_first_item => ''NO_FIRST_ITEM''');
ins(' ,p_include_apex_css_js_yn => ''Y''');
ins(' ,p_cache_page_yn => ''N''');
ins(' ,p_last_updated_by => ''ASZABO''');
ins(' ,p_last_upd_yyyymmddhh24miss => ''20121003173016''');
ins('  );');
ins('null;');
ins(' ');
ins('end;');
ins('/');
ins('');
ins('declare');
ins('  s varchar2(32767) := null;');
ins('  l_clob clob;');
ins('  l_length number := 1;');
ins('begin');
ins('s := null;');
ins('wwv_flow_api.create_page_plug (');
ins(' -- p_id=> 20214808148912302 + wwv_flow_api.g_id_offset,');
ins('  p_flow_id=> wwv_flow.g_flow_id,');
ins('  p_page_id=> '||v_page||',');
ins('  p_plug_name=> ''TR'||v_page||''',');
ins('  p_region_name=>''TR'||v_page||''',');
ins('  p_escape_on_http_output=>''Y'',');
ins(' -- p_plug_template=> 120971321862285115+ wwv_flow_api.g_id_offset,');
ins('  p_plug_display_sequence=> 10,');
ins('  p_plug_display_column=> 1,');
ins('  p_plug_display_point=> ''AFTER_SHOW_ITEMS'',');
ins('  p_plug_source=> s,');
ins('  p_plug_source_type=> ''STATIC_TEXT'',');
ins('  p_plug_query_row_template=> 1,');
ins('  p_plug_query_headings_type=> ''QUERY_COLUMNS'',');
ins('  p_plug_query_num_rows => 15,');
ins('  p_plug_query_num_rows_type => ''NEXT_PREVIOUS_LINKS'',');
ins('  p_plug_query_row_count_max => 500,');
ins('  p_plug_query_show_nulls_as => '' - '',');
ins('  p_plug_display_condition_type => '''',');
ins('  p_pagination_display_position=>''BOTTOM_RIGHT'',');
ins('  p_plug_caching=> ''NOT_CACHED'',');
ins('  p_plug_comment=> '''');');
ins('end;');
ins('/');
ins(' ');
ins('begin');
ins(' ');
ins('null;');
ins(' ');
ins('end;');
ins('/');
ins('');
ins(' ');
ins('begin');
ins(' ');
ins('null;');
ins(' ');
ins('end;');
ins('/');
ins('');

end page_begin;
  
 procedure page_end is
  begin
ins(' ');
ins('begin');
ins(' ');
ins('---------------------------------------');
ins('-- ...updatable report columns for page '||v_page);
ins('--');
ins(' ');
ins('begin');
ins(' ');
ins('null;');
ins('end;');
ins('null;');
ins(' ');
ins('end;');
ins('/');
ins('');
ins(' ');
ins('-- end application/pages/page_'||v_page);
  end page_end;      
 procedure ins_item(p_item varchar2) is
  begin
ins('declare');
ins('    h varchar2(32767) := null;');
ins(' v_reg_id number; --SzAn');
ins('begin');
ins(' select id into v_reg_id');
ins('  from WWV_FLOW_PAGE_PLUGS');
ins('  where flow_id=wwv_flow.g_flow_id');
ins('   and PLUG_NAME=''TR'||v_page||'''');
ins('   and REGION_NAME=''TR'||v_page||''';');
ins('wwv_flow_api.create_page_item(');
ins(' -- p_id=>20215032548912305 + wwv_flow_api.g_id_offset,');
ins('  p_flow_id=> wwv_flow.g_flow_id,');
ins('  p_flow_step_id=> '||v_page||' ,');
ins('  p_name=>'''||p_item||''',');
ins('  p_data_type=> ''VARCHAR'',');
ins('  p_is_required=> false,');
ins('  p_accept_processing=> ''REPLACE_EXISTING'',');
ins('  p_item_sequence=> '||v_item_onpage||',');
--ins(' --p_item_plug_id => 20214808148912302+wwv_flow_api.g_id_offset,');
ins(' p_item_plug_id => v_reg_id,');
ins('  p_use_cache_before_default=> ''YES'',');
ins('  p_item_default_type=> ''STATIC_TEXT_WITH_SUBSTITUTIONS'',');
ins('  p_source_type=> ''STATIC'',');
--ins('  p_display_as=> ''NATIVE_HIDDEN'',');
ins('  p_display_as=> ''NATIVE_TEXT_FIELD'',');
ins('  p_lov_display_null=> ''NO'',');
ins('  p_lov_translated=> ''N'',');
ins('  p_cSize=> 30,');
ins('  p_cMaxlength=> 4000,');
ins('  p_cHeight=> 1,');
ins('  p_cAttributes=> ''nowrap="nowrap"'',');
ins('  p_begin_on_new_line=> ''NO'',');
ins('  p_begin_on_new_field=> ''YES'',');
ins('  p_colspan=> 1,');
ins('  p_rowspan=> 1,');
ins('  p_label_alignment=> ''LEFT'',');
ins('  p_field_alignment=> ''LEFT'',');
ins('  p_is_persistent=> ''Y'',');
ins('  p_lov_display_extra=>''YES'',');
ins('  p_protection_level => ''N'',');
ins('  p_escape_on_http_output => ''Y'',');
ins('  p_attribute_01 => ''N'',');
ins('  p_show_quick_picks=>''N'',');
ins('  p_item_comment => '''');');
ins(' ');
ins(' ');
ins('end;');
ins('/');
ins('');
  end ins_item;  
begin  
 delete dev_temp;
 v_item_onpage:=10;
 page_begin;
 for r in cur loop
  if v_page!=r.page then
   page_end;
   v_page:=r.page;   
   page_begin;
   v_item_onpage:=10;
  end if;
  ins_item(r.item_name);
  v_item_onpage:=v_item_onpage+10;
 end loop;
page_end;
end TR_ITEMS;
end ADMIN_PKG;

/
