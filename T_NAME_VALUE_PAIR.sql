--------------------------------------------------------
--  DDL for Type T_NAME_VALUE_PAIR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_NAME_VALUE_PAIR" as object (
  name          varchar2(255),
  value_string  varchar2(4000),
  value_number  number,
  value_date    date
);

/
