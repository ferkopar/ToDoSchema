--------------------------------------------------------
--  DDL for View WK_V_STAGE_WORKERS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "WK_V_STAGE_WORKERS" ("TITULUS", "NEV", "LAST_NAME", "FIRST_NAME", "sz�let�si n�v", "sz�letet�si hely", "sz�letet�si id�", "anyja neve", "szig sz�ma", "�lland� lakc�m", "ir.sz�m", "v�ros", "utca", "PLACE_TYPE", "UTCA_N�V", "HAZ", "ad�azonos�t� jel", "TAJ sz�m", "bank neve", "banksz�mla sz�ma", "vezet�i enged�ly sz�ma", "oktat�si azonos�t�", "di�kigazolv�ny sz�m", "nyugd�j kezdete", "nyugd�jas t�rzssz�m") AS 
  select 
  "doktori c�m" as TITULUS
  ,"N�v" as NEV
  ,REGEXP_SUBSTR("N�v",'(\S*)(\s)') LAST_NAME
  ,substr("N�v",REGEXP_INSTR ("N�v", '(\s)')) FIRST_NAME
  , "sz�let�si n�v"
  ,"sz�letet�si hely"
  ,"sz�letet�si id�"
  ,"anyja neve"
  ,"szig sz�ma"
  ,"�lland� lakc�m"
  ,"ir.sz�m"
  ,"v�ros"
  ,"utca"
  ,REGEXP_SUBSTR("utca", 'k�z( |\.)|d�l�( |\.)|(utca( |\.)|u( |\.)|�t(ja)?( |\.)|(k|K)rt( |\.)|t(�r|ere)( |\.)|s�t�ny( |\.)|(fa)?sora?( |\.))|fordul�( |\.)') PLACE_TYPE
  ,SUBSTR("utca",1,
   REGEXP_INSTR("utca", 'k�z( |\.)|d�l�( |\.)|(utca( |\.)|u( |\.)|�t(ja)?( |\.)|(k|K)rt( |\.)|t(�r|ere)( |\.)|s�t�ny( |\.)|(fa)?sora?( |\.))|fordul�( |\.)') -1
  ) utca_n�v
  ,SUBSTR ( "utca",
   REGEXP_INSTR( "utca", 'k�z( |\.)|d�l�( |\.)|(utca( |\.)|u( |\.)|�t(ja)?( |\.)|(k|K)rt( |\.)|t(�r|ere)( |\.)|s�t�ny( |\.)|(fa)?sora?( |\.))|fordul�( |\.)')
   + LENGTH(REGEXP_SUBSTR("utca", 'k�z( |\.)|d�l�( |\.)|(utca( |\.)|u( |\.)|�t(ja)?( |\.)|(k|K)rt( |\.)|t(�r|ere)( |\.)|s�t�ny( |\.)|(fa)?sora?( |\.))|fordul�( |\.)'))
   ) haz
  ,"ad�azonos�t� jel"
  ,"TAJ sz�m"
  ,"bank neve"
  ,"banksz�mla sz�ma"
  ,"vezet�i enged�ly sz�ma"
  ,"oktat�si azonos�t�"
  ,"di�kigazolv�ny sz�m"
  ,"nyugd�j kezdete"
  ,"nyugd�jas t�rzssz�m"
  from wk_stage_workers;
