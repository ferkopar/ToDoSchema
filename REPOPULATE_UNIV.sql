--------------------------------------------------------
--  DDL for Procedure REPOPULATE_UNIV
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "REPOPULATE_UNIV" 
AS
 l_new_row_id number(12,0);
BEGIN
   delete from subject where SUBJ_CATEGORY_ID=1300;
    for egyetem in (select * from egyet) loop
        insert into subject (SUBJ_CATEGORY_ID)
        values(1300)
        returning SUBJ_ID into l_new_row_id;
      insert into SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
        values (l_new_row_id,1300,1301,egyetem.NAME);
      insert into SUBJ_PARAM (SUBJ_ID,SUBJ_TYPE_ID,PARAM_TYPE_ID,VALUE)
        values (l_new_row_id,1300,1001,1300);

  end loop;
END;

/
