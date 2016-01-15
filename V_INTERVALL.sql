--------------------------------------------------------
--  DDL for View V_INTERVALL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_INTERVALL" ("INTERVALL_ID", "INTERVALL_TEXT", "PARAM_FDATE", "PARAM_TDATE") AS 
  SELECT ROWNUM as intervall_id,
       intervall_text,
       param_fdate,
       param_tdate from
(SELECT DISTINCT 
  to_char(DM_XL.PARAM_FDATE,'YYYY.MM.DD')||'-'||to_char(DM_XL.PARAM_TDATE,'YYYY.MM.DD') intervall_text,
  DM_XL.PARAM_FDATE,
  DM_XL.PARAM_TDATE
  from DM_XL);
 

   COMMENT ON TABLE "V_INTERVALL"  IS 'Intervallum álltábla dm_xl-ben lévõ intervallumokról';
