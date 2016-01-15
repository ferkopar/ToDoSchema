--------------------------------------------------------
--  DDL for View V_ADDRESS_SPLITTEER
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_ADDRESS_SPLITTEER" ("VALUE", "ZIP", "PLACE_TYPE", "CITY", "STREET") AS 
  SELECT VALUE,ZIP,PLACE_TYPE,CITY 
  ,trim(substr(value,instr(value,city)+LENGTH( city )+1,instr(value,PLACE_TYPE)-instr(value,city)- LENGTH( city )-1)) street
  from
(SELECT VALUE
  ,REGEXP_SUBSTR(VALUE, '^[0-9]{4}( |\.)') ZIP
  ,REGEXP_SUBSTR(VALUE, '(utca( |\.)|u( |\.)|�t(ja)?( |\.)|(k|K)rt( |\.)|t�r( |\.)|s�t�ny( |\.)|fasora?( |\.))') PLACE_TYPE
  ,SUBSTR(VALUE,REGEXP_INSTR(VALUE,'([A-Z])'),REGEXP_INSTR(VALUE,'[a-z]( |,|\.)')-REGEXP_INSTR(VALUE,'[A-Z]')+1) city
  from SUBJ_PARAM WHERE PARAM_TYPE_ID = 11531);
