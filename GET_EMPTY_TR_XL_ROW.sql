--------------------------------------------------------
--  DDL for Function GET_EMPTY_TR_XL_ROW
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_EMPTY_TR_XL_ROW" (p_doc_id NUMBER)
  RETURN VARCHAR2
AS

  cursor super_type_rows(c_group_id number) is
      SELECT * from DM_SUPER_TYP WHERE GROUP_ID = c_group_id;

  l_ret_val VARCHAR2 (4000);

BEGIN
   l_ret_val := '<tr   class="editable">';
   l_ret_val := l_ret_val ||'<td class="dmXlId">';
   l_ret_val := l_ret_val ||'<input type="hidden" value="0">';      
   l_ret_val := l_ret_val ||'</td>';
   l_ret_val := l_ret_val || '<td class = "paramTypeId">';
   l_ret_val := l_ret_val || '<SELECT>';
   l_ret_val := l_ret_val || '<OPTION value ="" > - Válasszon - </OPTION> ';
   FOR super_type_row IN super_type_rows(2200) LOOP
      l_ret_val := l_ret_val || '<OPTION value ="'|| super_type_row.super_typ_id ||'" >'|| super_type_row.super_type_name  ||'</OPTION> ';
   END LOOP;
   l_ret_val := l_ret_val || '</SELECT> ';
   l_ret_val := l_ret_val || '</td> ';
   l_ret_val := l_ret_val || '<td  class="unitTypeId"> ';
   l_ret_val := l_ret_val || '<SELECT> ';
   l_ret_val := l_ret_val || '<OPTION value ="" > - Válasszon - </OPTION >';
   FOR super_type_row IN super_type_rows(20000) LOOP
       l_ret_val := l_ret_val || '<OPTION value ="'|| super_type_row.super_typ_id ||'" >'|| super_type_row.super_type_name  ||'</OPTION>';
   END LOOP;
   l_ret_val := l_ret_val || '</SELECT >';
   l_ret_val := l_ret_val || '</td> ';
   l_ret_val := l_ret_val || '<td class = "orderNo"><input type="text" ></td>';
   l_ret_val := l_ret_val || '<td class = "orderSign"><input type="text"></td> ';
   l_ret_val := l_ret_val || '<td class = "orderReg"><input type="text"></td>';
   l_ret_val := l_ret_val || '<td class = "printType"><input type="text"></td>';
   l_ret_val := l_ret_val || '<td class = "description"><input type="text"></td>';
   l_ret_val := l_ret_val || '<td class = "fromDate"><input type="text" class="datePicker"  value="'||TO_CHAR(SYSDATE,'YYYY.MM.DD')||'" ></td>';
   l_ret_val := l_ret_val || '<td  class = "toDate">< input type="text" class="datePicker"  value="2099.12.31" ></td>';
   
   l_ret_val := l_ret_val || '</tr>';
  RETURN l_ret_val;
END;

/
