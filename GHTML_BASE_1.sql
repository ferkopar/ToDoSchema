--------------------------------------------------------
--  DDL for Package Body GHTML_BASE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GHTML_BASE" AS

 PROCEDURE GENERATE_PNG( p_mm_id IN NUMBER )
 AS
     
   l_mime        VARCHAR2 (255);
   l_length      NUMBER;
   l_file_name   VARCHAR2 (2000);
   lob_loc       BLOB;
BEGIN
 
         SELECT  mf.main_type, mf.mm_blob, DBMS_LOB.getlength ( mf.mm_blob )
         INTO l_mime, lob_loc, l_length
         FROM mm_files mf
         WHERE mm_id = p_mm_id;     
 
 
   OWA_UTIL.mime_header (NVL (l_mime, 'application/octet'), FALSE);
   HTP.p ('Content-length: ' || l_length);
   OWA_UTIL.http_header_close;
   WPG_DOCLOAD.download_file (lob_loc);
--  htp.p(p_mm_id);
null;

EXCEPTION WHEN OTHERS THEN
 -- NULL;
 raise_application_error(-20001,'An error was encountered - GENERATE_PNG('|| p_mm_id ||')'||SQLCODE||' -ERROR- '||SQLERRM);  
END GENERATE_PNG;

PROCEDURE GENERATE_FLAG(p_language_id number)
AS
  v_mm_id number(12,0);
begin

  select flag_id into v_mm_id from dm_language where language_id = NVL( p_language_id,1);
  GENERATE_PNG( v_mm_id );
--  htp.p(p_language_id);
exception when others then
  raise_application_error(-20001,'An error was encountered - GENERATE_FLAG('|| p_language_id ||')'||SQLCODE||' -ERROR- '||SQLERRM);
end;

PROCEDURE GENERATE_BIG_FLAG(p_language_id number)
AS
  v_mm_id number(12,0);
begin
  select flag_id into v_mm_id from dm_language where language_id = NVL( p_language_id,1);
  GENERATE_PNG( v_mm_id+50 );
end;

PROCEDURE GENERATE_PNG( p_file_mame IN varchar2 )
AS
  v_mm_id number(12,0);
begin
    select mm_id into v_mm_id from MM_FILES where UPPER(FILE_NAME) = UPPER( p_file_mame );
    GENERATE_PNG(v_mm_id );

EXCEPTION WHEN OTHERS THEN
  NULL;
end;




END GHTML_BASE;

/
