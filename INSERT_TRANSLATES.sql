--------------------------------------------------------
--  DDL for Procedure INSERT_TRANSLATES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "INSERT_TRANSLATES" 
AS
  cursor t is 
    select * from SZUPER_TYP_FORDITAS ;
  l_text_id number(12,0);
BEGIN
  for te in t loop
     l_text_id := seq_base.nextval;
     insert INTO DM_TEXT (CNAMES,LANGUAGE_ID,TEXT_ID)
      VALUES (te.angol,3,l_text_id); 
     insert INTO DM_TRANSLATE(TEXT_ID,TBL_NAME,TBL_COL_NAME,TBL_PK_ID)
      VALUES (l_text_id,'DM_SUPER_TYP','SUPER_TYPE_NAME',te.SUPER_TYP_id);
  end loop;
END;

/
