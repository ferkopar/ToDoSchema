--------------------------------------------------------
--  DDL for Package Body PKG_ROLE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PKG_ROLE" as
function RLOOKUP_5083273_SUBJ_PARAM_ID(P_TEXT varchar)return integer
as
ret_val integer;
begin
select r into ret_val from
(select PKG_INVENT.LOOKUP_SUPER_TYP_NAME(CAT_TYPE_ID) d, CAT_TYPE_ID R 
from DM_CAT_USAGE
where TABLE_NAME = 'SUBJ_PARAM'
and   TABLE_COLUMN = 'PARAM_TYPE_ID')
where D = P_TEXT;
return ret_val;
end RLOOKUP_5083273_SUBJ_PARAM_ID;

function RLOOKUP_ROLE_ID(P_TEXT varchar)return integer
as 
ret_val integer;
begin
if P_TEXT is null then return null; end if;
select R into RET_VAL from 
(select distinct s.ROLE_NAME||'('||s.ROLE_ID||')' d, s.ROLE_ID r
from   DM_ROLE S
order by 1)
 where d = P_TEXT;
   return ret_val;
end RLOOKUP_ROLE_ID;



function RLOOKUP_STAT_TYPE_ID (P_TEXT varchar)return integer
as 
RET_VAL integer;
begin
  RETURN 0;
end RLOOKUP_STAT_TYPE_ID;


END PKG_ROLE;

/
