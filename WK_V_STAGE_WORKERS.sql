--------------------------------------------------------
--  DDL for View WK_V_STAGE_WORKERS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "WK_V_STAGE_WORKERS" ("TITULUS", "NEV", "LAST_NAME", "FIRST_NAME", "születési név", "születetési hely", "születetési idõ", "anyja neve", "szig száma", "állandó lakcím", "ir.szám", "város", "utca", "PLACE_TYPE", "UTCA_NÉV", "HAZ", "adóazonosító jel", "TAJ szám", "bank neve", "bankszámla száma", "vezetõi engedély száma", "oktatási azonosító", "diákigazolvány szám", "nyugdíj kezdete", "nyugdíjas törzsszám") AS 
  select 
  "doktori cím" as TITULUS
  ,"Név" as NEV
  ,REGEXP_SUBSTR("Név",'(\S*)(\s)') LAST_NAME
  ,substr("Név",REGEXP_INSTR ("Név", '(\s)')) FIRST_NAME
  , "születési név"
  ,"születetési hely"
  ,"születetési idõ"
  ,"anyja neve"
  ,"szig száma"
  ,"állandó lakcím"
  ,"ir.szám"
  ,"város"
  ,"utca"
  ,REGEXP_SUBSTR("utca", 'köz( |\.)|dûlõ( |\.)|(utca( |\.)|u( |\.)|út(ja)?( |\.)|(k|K)rt( |\.)|t(ér|ere)( |\.)|sétány( |\.)|(fa)?sora?( |\.))|forduló( |\.)') PLACE_TYPE
  ,SUBSTR("utca",1,
   REGEXP_INSTR("utca", 'köz( |\.)|dûlõ( |\.)|(utca( |\.)|u( |\.)|út(ja)?( |\.)|(k|K)rt( |\.)|t(ér|ere)( |\.)|sétány( |\.)|(fa)?sora?( |\.))|forduló( |\.)') -1
  ) utca_név
  ,SUBSTR ( "utca",
   REGEXP_INSTR( "utca", 'köz( |\.)|dûlõ( |\.)|(utca( |\.)|u( |\.)|út(ja)?( |\.)|(k|K)rt( |\.)|t(ér|ere)( |\.)|sétány( |\.)|(fa)?sora?( |\.))|forduló( |\.)')
   + LENGTH(REGEXP_SUBSTR("utca", 'köz( |\.)|dûlõ( |\.)|(utca( |\.)|u( |\.)|út(ja)?( |\.)|(k|K)rt( |\.)|t(ér|ere)( |\.)|sétány( |\.)|(fa)?sora?( |\.))|forduló( |\.)'))
   ) haz
  ,"adóazonosító jel"
  ,"TAJ szám"
  ,"bank neve"
  ,"bankszámla száma"
  ,"vezetõi engedély száma"
  ,"oktatási azonosító"
  ,"diákigazolvány szám"
  ,"nyugdíj kezdete"
  ,"nyugdíjas törzsszám"
  from wk_stage_workers;
