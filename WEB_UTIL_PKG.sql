--------------------------------------------------------
--  DDL for Package WEB_UTIL_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "WEB_UTIL_PKG" 
as
 
  /*
 
  Purpose:      Package contains various web-related utility routines
 
  Remarks:      
 
  Who     Date        Description
  ------  ----------  --------------------------------
  MBR     23.10.2011  Created
 
  */
 
 
  -- get domain name from email address
  function get_email_domain (p_email in varchar2) return varchar2;

  -- get escaped string with HTML line breaks
  function get_escaped_str_with_breaks (p_string in varchar2) return varchar2;
 
  -- get local file URL
  function get_local_file_url (p_file_path in varchar2) return varchar2;
 
end web_util_pkg;

/
