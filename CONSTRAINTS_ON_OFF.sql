--------------------------------------------------------
--  DDL for Procedure CONSTRAINTS_ON_OFF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CONSTRAINTS_ON_OFF" 
(Target_Schema_Name IN VARCHAR2, Action IN VARCHAR2:='')
IS
   sql_str VARCHAR2(4000);
   FK_name VARCHAR2(4000);
   var_action VARCHAR2(4000);
CURSOR cCur1 IS
   /*Creating the list of foreign keys that should be disabled/enabled,*/
   /*with creating a command at the same time.*/
   SELECT
      'ALTER TABLE '||OWNER||'.'||
      TABLE_NAME||' '||var_action||' CONSTRAINT '||CONSTRAINT_NAME AS sql_string,
      CONSTRAINT_NAME
   FROM
      ALL_CONSTRAINTS
   WHERE
      CONSTRAINT_TYPE='R' AND OWNER=Target_Schema_Name;
BEGIN
   IF upper(Action)='ON' THEN
       var_action :='ENABLE';
   ELSE
       var_action :='DISABLE';
   END IF;
OPEN cCur1;
   LOOP
      FETCH cCur1 INTO SQL_str,fk_name;
      EXIT WHEN cCur1%NOTFOUND;
      /*Disabling/Enabling foreign keys.*/
      EXECUTE IMMEDIATE SQL_str;
      DBMS_Output.PUT_LINE('Foreign key '||FK_name||' is '||var_action||'d');
   END LOOP;
EXCEPTION
WHEN OTHERS THEN
    BEGIN
        DBMS_Output.PUT_LINE(SQLERRM);
    END;
    CLOSE cCur1;
END;

/
