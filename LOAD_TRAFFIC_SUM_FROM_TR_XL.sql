--------------------------------------------------------
--  DDL for Procedure LOAD_TRAFFIC_SUM_FROM_TR_XL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "LOAD_TRAFFIC_SUM_FROM_TR_XL" as
traffic_sum_rec traffic_sum%ROWTYPE;
cursor tr_xl_rows is
select tr_xl_id, SUBJ_ID, PARAM_DATE PARAM_DATE_ID,
       PARAM_TYPE_ID, PARAM_VALUE, CONTROL_VALUE,
       PARAM_UNIT, REV_LOOKUP_SUPER_TYPE_NAME_EX(PARAM_UNIT) PARAM_UNIT_ID, 20202 , 
       COLUMN_NO, LIST_TYPE_ID,data_inco_id,status_id,
       (select status_id from data_inco di where di.data_inco_id = tr_xl.data_inco_id) beerkezes_status_id,
      order_no
    from TR_XL
    where status_id = 914
    order by beerkezes_status_id;
begin

for tr_xl_row in tr_xl_rows
loop
 -- if tr_xl_row.beerkezes_status_id != 905 then   -- nem m°dos›t°
     insert into TRAFFIC_SUM
    (  SUBJ_ID , PARAM_DATE_ID 
      ,PARAM_TYPE_ID
      ,ORIGINAL_VALUE,CONTROL_VALUE
      ,param_unit ,PARAM_UNIT_ID
      ,SOURCE_TYPE_ID, COLUMN_NO
      , LIST_TYPE_ID,data_inco_id
      ,status_id,order_no)
      values(tr_xl_row.SUBJ_ID , tr_xl_row.PARAM_DATE_ID 
           , tr_xl_row.PARAM_TYPE_ID, tr_xl_row.PARAM_VALUE,tr_xl_row.CONTROL_VALUE, tr_xl_row.PARAM_UNIT , 
      tr_xl_row.PARAM_UNIT_ID, 20202, tr_xl_row.COLUMN_NO
      , tr_xl_row.LIST_TYPE_ID,tr_xl_row.data_inco_id,904,tr_xl_row.order_no);
      
      update tr_xl set status_id = 913 where tr_xl_id = tr_xl_row.tr_xl_id;
/*  else
  --begin
     select * into traffic_sum_rec from traffic_sum 
     where traffic_sum.SUBJ_ID = tr_xl_row.SUBJ_ID
     and   traffic_sum.PARAM_DATE_ID = tr_xl_row.PARAM_DATE_ID
     and   traffic_sum.PARAM_STATUS_ID = tr_xl_row.PARAM_STATUS_TYPE_ID
     and   traffic_sum.PARAM_TYPE_ID = tr_xl_row.PARAM_TYPE_ID
     and   traffic_sum.COLUMN_NO = tr_xl_row.COLUMN_NO
     and   traffic_sum.LIST_TYPE_ID = tr_xl_row.LIST_TYPE_ID
     and   (select intervall_type_id from adat_beerkezes where adat_beerkezes.beerkezes_id = traffic_sum.beerkezes_id)
           = tr_xl_row.intervall_id
    and rownum <2;
    -- and tr_xl_row.beerkezes_status_id = 904;     
     --and   traffic_sum_rec.STATUS_ID = 904;
     
     if traffic_sum_rec.PARAM_VALUE != tr_xl_row.PARAM_VALUE  then 
    
      update traffic_sum set status_id = 919 where traffic_sum_id = traffic_sum_rec.traffic_sum_id;
    
       insert into TRAFFIC_SUM
      (SUBJ_ID , PARAM_DATE_ID , PARAM_STATUS_ID , PARAM_TYPE_ID, ORIGINAL_VALUE,CONTROL_VALUE, PARAM_UNIT_NAME , 
      PARAM_UNIT_ID, SOURCE_TYPE_ID, COLUMN_NO, LIST_TYPE_ID,beerkezes_id,status_id,order_no)
      values(tr_xl_row.SUBJ_ID , tr_xl_row.PARAM_DATE_ID , tr_xl_row.PARAM_STATUS_TYPE_ID 
      , tr_xl_row.PARAM_TYPE_ID, tr_xl_row.PARAM_VALUE,tr_xl_row.CONTROL_VALUE, tr_xl_row.PARAM_UNIT , 
      tr_xl_row.PARAM_UNIT_ID,20202, tr_xl_row.COLUMN_NO
      , tr_xl_row.LIST_TYPE_ID,tr_xl_row.beerkezes_id,904,tr_xl_row.order_no);
     end if;
  --exception
  --when others then
  --   null;
  
  -- end;
  end if;
  */
  
end loop;

end LOAD_TRAFFIC_SUM_FROM_TR_XL;

/
