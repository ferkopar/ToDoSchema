--------------------------------------------------------
--  DDL for Package GENERATE_ADMIN_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "GENERATE_ADMIN_HTML" AS

  procedure GENERATE_ALERTS;
  PROCEDURE GENERATE_CONFIRM_PAGE(p_alert_id NUMBER);
  PROCEDURE INVALIDATE_ALERT(p_alert_id NUMBER);

END GENERATE_ADMIN_HTML;

/
