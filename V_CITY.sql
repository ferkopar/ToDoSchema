--------------------------------------------------------
--  DDL for View V_CITY
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_CITY" ("STREET_ID", "CITY_ID", "STREET_NAME_ID", "CITY_NAME", "STREET_NAME", "DISTRICT", "ZIP") AS 
  select STREET_ID
      , CITY CITY_ID
      , NAME as STREET_NAME_ID
      ,(select name from dm_city where DM_CITY_ID = WK_STAGE_STREET.city) CITY_NAME
      ,(select cnames from dm_text where TEXT_ID = WK_STAGE_STREET.NAME AND LANGUAGE_ID =1) STREET_NAME
      ,DISTRICT
      ,ZIP
  from WK_STAGE_STREET;
