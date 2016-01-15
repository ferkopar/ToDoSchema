--------------------------------------------------------
--  DDL for Package Body DOCX_BUILDER_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DOCX_BUILDER_PKG" AS

 FUNCTION replaceClob (
srcClob IN CLOB, 
replaceStr IN VARCHAR2,
replaceWith IN VARCHAR2) 
RETURN CLOB IS

vBuffer    VARCHAR2 (32767);
l_amount   BINARY_INTEGER := 32760;
l_pos      PLS_INTEGER := 1;
l_clob_len PLS_INTEGER;
newClob    CLOB := EMPTY_CLOB;
    
BEGIN
  -- initalize the new clob
  dbms_lob.createtemporary(newClob,TRUE);
    
  l_clob_len := dbms_lob.getlength(srcClob);

  WHILE l_pos <= l_clob_len
  LOOP
    dbms_lob.read(srcClob, l_amount, l_pos, vBuffer);

    IF vBuffer IS NOT NULL THEN
      -- replace the text
      vBuffer := replace(vBuffer, replaceStr, replaceWith);
      -- write it to the new clob
      dbms_lob.writeappend(newClob, LENGTH(vBuffer), vBuffer);
    END IF;
    l_pos := l_pos + l_amount;
  END LOOP;
    
  RETURN newClob; 
--EXCEPTION
--  WHEN OTHERS THEN
--    RAISE;
END;

PROCEDURE GENERATE_DOCX(p_template NUMBER := 1000) 
AS
l_blob BLOB;
BEGIN
  SELECT mf.MM_BLOB INTO l_blob FROM MM_FILES mf WHERE mf.MM_ID = 1000;
  GENERATE_DOCX(l_blob);
END;

PROCEDURE GENERATE_DOCX(p_template BLOB) 
AS


    l_file_list ZIP_UTIL_PKG.t_file_list;
    l_file_name VARCHAR2 (2000);
    l_output_zip BLOB;
    l_clob CLOB;
    l_blob BLOB;
    l_start INTEGER := -1;
    l_len INTEGER;
    l_to_replace VARCHAR2(2000);
    l_dummy VARCHAR2 (2000);

    offset number := 1;
    amount number := 32767;
    amount_last number := 0;
BEGIN
    l_file_list := ZIP_UTIL_PKG.get_file_list(p_template);
    for i in l_file_list.FIRST .. l_file_list.LAST
    loop
      l_file_name := dbms_lob.substr( l_file_list(i), 4000, 1 );
      IF l_file_name LIKE '%document.xml' THEN
        DBMS_OUTPUT.PUT_LINE('l_file_list('||i||') '||  l_file_name);
        l_blob := ZIP_UTIL_PKG.GET_FILE(p_template,l_file_name );
        l_clob := sql_util_pkg.blob_to_clob (l_blob);
        LOOP
          l_start := DBMS_LOB.INSTR (l_clob,'<<')+2;
          IF l_start = 0 THEN 
            EXIT;
          END IF;
          l_len :=  DBMS_LOB.INSTR (l_clob,'>>') - l_start; 
          l_to_replace := SUBSTR(l_clob,l_start,l_len);
          l_dummy := replaceClob(l_clob,'<<'||l_to_replace||'>>','TESZT');                         
        END LOOP;
        l_blob := SQL_UTIL_PKG.CLOB_TO_BLOB(l_dummy);
        ZIP_UTIL_PKG.ADD_FILE(l_output_zip, l_file_name,l_blob);       
      ELSE
         ZIP_UTIL_PKG.ADD_FILE(l_output_zip, l_file_name,ZIP_UTIL_PKG.GET_FILE(p_template,l_file_name ));
      END IF; 
    END LOOP;
    ZIP_UTIL_PKG.FINISH_ZIP(l_output_zip);
    INSERT INTO MM_FILES (MM_ID, MM_BLOB) VALUES (1001, l_output_zip);
END;


END DOCX_BUILDER_PKG;

/
