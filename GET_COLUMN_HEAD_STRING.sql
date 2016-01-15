--------------------------------------------------------
--  DDL for Function GET_COLUMN_HEAD_STRING
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_COLUMN_HEAD_STRING" 
  (
     p_dm_xl_id NUMBER,
     p_beerkezes_id  NUMBER
  )
  RETURN VARCHAR2
AS
v_dm_xl_row dm_xl%ROWTYPE;
v_beerkezes_row data_inco%ROWTYPE;

v_retval VARCHAR2 (500);
BEGIN

  SELECT * INTO v_dm_xl_row FROM dm_xl dx WHERE dx.dm_xl_id = p_dm_xl_id;
  SELECT * INTO v_beerkezes_row FROM data_inco ab WHERE ab.data_inco_id = p_beerkezes_id;

  IF v_dm_xl_row.param_date_type_id = 20114 THEN 
    IF v_dm_xl_row.param_d1value IS NULL then
      v_retval := to_char( v_beerkezes_row.param_tdate,'YYYY.MM.DD')||'<br>'||v_dm_xl_row.w_param_type_name;
    ELSE 
       --v_retval := to_char( trunc(v_beerkezes_row.param_tdate+v_dm_xl_row.param_d1value,'MM') ,'YYYY.MM.DD')||'<br>'||v_dm_xl_row.w_param_type_name;
       v_retval := to_char( last_day(ADD_MONTHS(v_beerkezes_row.param_tdate,v_dm_xl_row.param_d1value)),'YYYY.MM.DD')||'<br>'||v_dm_xl_row.w_param_type_name;
   END IF;
  ELSE
       v_retval := v_dm_xl_row.description;
  END IF;
RETURN v_retval;
   
END;

/
