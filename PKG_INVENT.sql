--------------------------------------------------------
--  DDL for Package PKG_INVENT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PKG_INVENT" as 

   function LOOKUP_SUPER_TYP_NAME (P_SUPER_TYP_ID number) return varchar2;
   function LOOKUP_SUPER_GROUP_ID (P_SUPER_TYP_ID number) return number;
   function LOOKUP_SUPER_TYPE_ID (P_EPI_ID number) return number;
   function LOOKUP_EPI_SUPER_TYP_NAME (P_EPI_ID number) return varchar2;
   function LOOKUP_EPI_SUPER_GROUP_ID (P_EPI_ID number) return number;
   function LOOKUP_MM_SUPER_TYP_NAME (P_MM_ID number) return varchar2;
   function GET_INVENT_SUBJ_ID(P_EPI_ID number) return number;
   function CONDITION_FOR_INVENT(P_PARAM_TYPE_ID number, P_EPI_TYPE_ID number,P_INVENT_INVENT_PARAM_VALUE varchar2
         , P_INVENT_PARAM_TYPE_ID number) return number;
   function CONDITION_FOR_INVENT_TYPE(p_epi_type_id number) return number;

   function LOOKUP_SUBJECT_COLUMN_HEAD (P_SUPER_TYP_ID number) return varchar2;
   function LOOKUP_SUBJECT1_COLUMN_HEAD (P_SUPER_TYP_ID number) return varchar2;
   function GET_NEXT_ORDER(P_INVENT_ID number) return number;
   function GET_TRANSP_QTY(p_invent_id number, p_prev_epi_id number,p_epi_id number) return number;
end pkg_invent;

/
