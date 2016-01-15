--------------------------------------------------------
--  DDL for Package Body PKG_INVENT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PKG_INVENT" as

  function LOOKUP_SUPER_TYP_NAME (P_SUPER_TYP_ID number) return varchar2 as
  m_ret varchar2(255);
  begin
    select super_type_name into m_ret from dm_super_typ where super_typ_id = p_super_typ_id;
    return m_ret;
  end LOOKUP_SUPER_TYP_NAME;
  
  function LOOKUP_SUPER_GROUP_ID (P_SUPER_TYP_ID number) return number as
  m_ret number(12,0);
  begin
     select group_id into m_ret from dm_super_typ where super_typ_id = p_super_typ_id;
    return m_ret;
  end LOOKUP_SUPER_GROUP_ID;

  function LOOKUP_SUPER_TYPE_ID (P_EPI_ID number) return number as
  m_ret number(12,0);
  begin
     select epi_type_id into m_ret from epi where epi_id = P_EPI_ID;
    return M_RET;
  end LOOKUP_SUPER_TYPE_ID;

  function LOOKUP_EPI_SUPER_TYP_NAME (P_EPI_ID number) return varchar2 as
  m_ret varchar2(255);
  begin
    select PKG_INVENT.LOOKUP_SUPER_TYP_NAME(epi_type_id) into m_ret from epi where epi_id = P_EPI_ID;
    return M_RET;
  end LOOKUP_EPI_SUPER_TYP_NAME;
  
  function LOOKUP_EPI_SUPER_GROUP_ID (P_EPI_ID number) return number as
  m_ret number(12,0);
  begin
    select PKG_INVENT.LOOKUP_SUPER_GROUP_ID(epi_type_id) into m_ret from epi where epi_id = P_EPI_ID;
    return M_RET;
  end LOOKUP_EPI_SUPER_GROUP_ID;

  function LOOKUP_MM_SUPER_TYP_NAME (P_MM_ID number) return varchar2 as
  m_ret varchar2(255);
  begin
    select PKG_INVENT.LOOKUP_SUPER_TYP_NAME(mm_type_id) into m_ret from mm_files where mm_id = P_MM_ID;
    return M_RET;
  end LOOKUP_MM_SUPER_TYP_NAME;

 function GET_INVENT_SUBJ_ID(P_EPI_ID number) return number as
   m_ret number(12,0);
 begin
   select SUBJ_ID into M_RET from EPI_SUBJ_PARAM where EPI_ID = P_EPI_ID;
   return M_RET;
 end GET_INVENT_SUBJ_ID;
 
 function CONDITION_FOR_INVENT(P_PARAM_TYPE_ID number, P_EPI_TYPE_ID number
         ,P_INVENT_INVENT_PARAM_VALUE varchar2
         , p_invent_param_type_id number) return number as
   m_ret number(12,0);
 begin
   m_ret := 0;
   
   select 1 into m_ret from DUAL where
   
   -- feltételek a katalógus beszerzéshez 
 PKG_INVENT.LOOKUP_SUPER_GROUP_ID(P_EPI_TYPE_ID) = 7003450 
 and
 (P_PARAM_TYPE_ID = 7001662 and  P_EPI_TYPE_ID != 7003551
  or (P_PARAM_TYPE_ID = 7001662 and NVL(p_invent_invent_param_VALUE,0) > 0 and  P_EPI_TYPE_ID = 7003551 )
 OR
 (
 P_EPI_TYPE_ID = 7003517
 AND EXISTS
   (
      select 1 from DM_REGULATION  where REGUL_TYPE_ID = 7003594 and TYPE_VALUE1 = P_EPI_TYPE_ID 
                                   and type_value2 = p_invent_param_type_id and p_invent_param_type_id != 7001662
   )
)

OR
 (
 P_EPI_TYPE_ID = 7003537
 AND EXISTS
   (
      select 1 from DM_REGULATION  where REGUL_TYPE_ID = 7003594 and TYPE_VALUE1 = P_EPI_TYPE_ID 
                                   and type_value2 = p_invent_param_type_id and p_invent_param_type_id != 7001662
   )
)

OR
 (
 P_EPI_TYPE_ID = 7003551
 AND EXISTS
   (
      select 1 from DM_REGULATION  where
                                  (REGUL_TYPE_ID = 7003594 and TYPE_VALUE1 = P_EPI_TYPE_ID 
                                   and type_value2 = p_invent_param_type_id 
                                   and p_invent_param_type_id != 7001662)
                                     
)
)
)
or
-- feltételek egyedi beszerzéshez
PKG_INVENT.LOOKUP_SUPER_GROUP_ID(P_EPI_TYPE_ID) = 7003450 and
(
  P_EPI_TYPE_ID = 7003551  /* Egyedi beszerzésû tételek igény rögzítése 7003657  */
  or
  P_EPI_TYPE_ID = 7003671  /* Egyedi beszerzésû tételek ajánlat kérése 7003671 */
  or
  P_EPI_TYPE_ID = 7003691  /* Egyedi beszerzésû tételek beérkezõ ajánlat 7003691 */
  or
  P_EPI_TYPE_ID = 7003705  /* Egyedi beszerzésû tételek rendelése 7003705 */
  or
  P_EPI_TYPE_ID = 7003719  /* Egyedi beszerzésû tételek szállítása 7003719 */
  or
  P_EPI_TYPE_ID = 7003733  /* Egyedi beszerzésû tételek nyilvántartása 7003733 */
);

 
   return M_RET;
 end CONDITION_FOR_INVENT;

function CONDITION_FOR_INVENT_TYPE(p_epi_type_id number) return number as
 m_ret number(12,0);
  begin
     select distinct to_number(type_value2) into m_ret from dm_regulation where REGUL_TYPE_ID = 7003978 and type_value1 =  PKG_INVENT.LOOKUP_SUPER_GROUP_ID (p_epi_type_id);
  return m_ret;
end CONDITION_FOR_INVENT_TYPE;

function LOOKUP_SUBJECT_COLUMN_HEAD (P_SUPER_TYP_ID number) return varchar2 as
  m_ret varchar2(255);
  begin
      select distinct PKG_INVENT.LOOKUP_SUPER_TYP_NAME ( TYPE_VALUE2 ) into m_ret  from DM_REGULATION
      where REGUL_TYPE_ID = 7004010
      and TYPE_VALUE1 = P_SUPER_TYP_ID;
    return M_RET;
  end LOOKUP_SUBJECT_COLUMN_HEAD;
  
  function LOOKUP_SUBJECT1_COLUMN_HEAD (P_SUPER_TYP_ID number) return varchar2 as
  m_ret varchar2(255);
  begin
      select distinct PKG_INVENT.LOOKUP_SUPER_TYP_NAME ( TYPE_VALUE3 ) into m_ret  from DM_REGULATION
      where REGUL_TYPE_ID = 7004010
      and TYPE_VALUE1 = P_SUPER_TYP_ID;
    return M_RET;
  end LOOKUP_SUBJECT1_COLUMN_HEAD;

 function GET_NEXT_ORDER(P_INVENT_ID number) return number as
 M_RET number(12,0);
 begin
    select max(NVL(ORDER_NO,0))+1  into M_RET from INVENT_PARAM where INVENT_ID = P_INVENT_ID;
    return M_RET;
 end GET_NEXT_ORDER;
 
 function GET_TRANSP_QTY(P_INVENT_ID number, P_PREV_EPI_ID number, P_EPI_ID number) return number as
 M_RET number(12,0);
 M_PARAM_TYPE_ID number(12,0);
 M_EPI_TYPE_ID number (12,0);
 begin
  M_RET := 333;
  M_EPI_TYPE_ID := 0;
 select EPI_TYPE_ID into M_EPI_TYPE_ID  from EPI where EPI_ID = 7004694;
  if M_EPI_TYPE_ID in (7003517) then
     return 0;
  end if;

  if M_EPI_TYPE_ID =7003537 then M_PARAM_TYPE_ID := 7001748;
  ELSIF M_EPI_TYPE_ID =7003551 then M_PARAM_TYPE_ID := 7001841;
  end if;
  select SUM( NVL( TO_NUMBER(value),0 ) ) into M_RET  from V_INVENT_INVENT_PARAM where 
  PREV_EPI_ID = P_PREV_EPI_ID 
   and INVENT_ID = P_INVENT_ID 
  and PARAM_TYPE_ID = 7001748;
  return M_RET;
 end GET_TRANSP_QTY;

end "PKG_INVENT";

/
