--------------------------------------------------------
--  DDL for Procedure IMAGE_DISPLAY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "IMAGE_DISPLAY" ( p_image_id IN NUMBER)
AS
     
   l_mime        VARCHAR2 (255);
   l_length      NUMBER;
   l_file_name   VARCHAR2 (2000);
   lob_loc       BLOB;
BEGIN
 
         SELECT  mf.main_type, mf.mm_blob, DBMS_LOB.getlength ( mf.mm_blob )
         INTO l_mime, lob_loc, l_length
         FROM mm_files mf
         WHERE mm_id = p_image_id;    
 
 
   OWA_UTIL.mime_header (NVL (l_mime, 'application/octet'), FALSE);
   HTP.p ('Content-length: ' || l_length);
   OWA_UTIL.http_header_close;
   WPG_DOCLOAD.download_file (lob_loc);
    
END image_display;

/
