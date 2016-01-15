--------------------------------------------------------
--  DDL for Function CALCULATE_ROW_VALUE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CALCULATE_ROW_VALUE" (
   p_beerk_id data_inco.data_inco_id%TYPE,
   p_col_no NUMBER,
   p_param_type_id NUMBER,
   p_list_id NUMBER 
  )
  RETURN NUMBER
AS
CURSOR RULES ( p_list_id NUMBER, p_param_type_id NUMBER) IS
  SELECT dm_xl_id1,mathop,connum FROM dm_xl dx , dm_xl_rel dxr
  WHERE list_type_id = p_list_id
    AND param_type_id = p_param_type_id
  and dx.dm_xl_id = dxr.dm_xl_id2
  ORDER BY dxr.dm_xl_id2;

v_dm_xl_row dm_xl%ROWTYPE;
v_retval NUMBER := 0;
v_cell_value NUMBER;
v_cell_value_char VARCHAR2 (10);
v_tr_xl_id NUMBER;
BEGIN
  FOR rule IN RULES ( p_list_id,p_param_type_id )
    LOOP
      SELECT * INTO v_dm_xl_row FROM dm_xl WHERE dm_xl_id = rule.dm_xl_id1; 
      v_cell_value_char := lookup_tr_xl_value(p_beerk_id,p_list_id,v_dm_xl_row.param_type_id,p_col_no,v_tr_xl_id);
      IF v_cell_value_char IS NOT NULL AND v_cell_value_char != 'N/A' AND v_cell_value_char != 'HIBA' THEN
         v_cell_value := v_cell_value_char;
      ELSE
        v_cell_value := 0;
      END IF;
      IF rule.mathop = '+' THEN
        v_retval := v_retval*rule.connum + v_cell_value;
      ELSIF rule.mathop = '-' THEN
        v_retval := v_retval*rule.connum - v_cell_value;
     END IF;
    END LOOP;
  RETURN v_retval;
END;

/
