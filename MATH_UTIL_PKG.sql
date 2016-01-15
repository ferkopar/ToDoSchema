--------------------------------------------------------
--  DDL for Package MATH_UTIL_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MATH_UTIL_PKG" 
as
 
  /*
 
  Purpose:    Package handles general math functionality
 
  Remarks:    
 
  Who     Date        Description
  ------  ----------  -------------------------------------
  MBR     22.09.2006  Created
 
  */
 
  -- safe division by zero
  function safediv (p_value_1 in number,
                    p_value_2 in number) return number;
 
  -- get number formatted with specified number of decimals
  function get_fnum (p_value in number,
                     p_decimals in number := 2) return number;
                     
  -- return true if value is within given percentage of other value
  function is_within_pct_of_value (p_value1 in number,
                                   p_value2 in number,
                                   p_pct in number) return boolean;

                    
end math_util_pkg;

/
