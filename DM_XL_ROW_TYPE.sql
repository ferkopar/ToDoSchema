--------------------------------------------------------
--  DDL for Type DM_XL_ROW_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DM_XL_ROW_TYPE" IS OBJECT
(
  DM_XL_ID                 NUMBER(12, 0),
  LEAD_TYPE_ID             NUMBER(12, 0),
  W_LEAD_TYPE_NAME         VARCHAR2(60 BYTE),
  INC_TYPE_ID              NUMBER(12, 0),
  W_INC_TYPE_NAME          VARCHAR2(60 BYTE),
  PARAM_STATUS_TYPE_ID     NUMBER(12, 0),
  W_PARAM_STATUS_TYPE_NAME VARCHAR2(255 BYTE),
  PARAM_DATE_TYPE_ID       NUMBER(12, 0),
  W_PARAM_DATE_TYPE_NAME   VARCHAR2(60 BYTE),
  PARAM_UNIT_ID            NUMBER(12, 0),
  PARAM_UNIT               VARCHAR2(60 BYTE),
  LIST_TYPE_ID             NUMBER(12, 0),
  W_LIST_TYPE_NAME         VARCHAR2(60 BYTE),
  PARAM_TYPE_ID            NUMBER(12, 0),
  REL_TYPE_ID              NUMBER(12, 0),
  SHEET_NAME               VARCHAR2(60 BYTE),
  ORDER_NO                 NUMBER(3, 0),
  ORDER_SIGN               VARCHAR2(60 BYTE),
  ORDER_REG                VARCHAR2(60 BYTE),
  PRINT_TYPE               VARCHAR2(60 BYTE),
  EXCELL_COLUMNS_ID        NUMBER(12, 0),
  INTERVALL_TYPE_ID        NUMBER(12, 0),
  INTERVALL_TYPE_NAME      VARCHAR2(255 BYTE),
  FROM_DATE                DATE,
  TO_DATE                  DATE,
  DESCRIPTION              VARCHAR2(255 BYTE),
  CONSTRUCTOR FUNCTION DM_XL_ROW_TYPE(p_id NUMBER) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE BODY "DM_XL_ROW_TYPE" AS
     CONSTRUCTOR FUNCTION DM_XL_ROW_TYPE( p_id NUMBER ) RETURN SELF AS RESULT IS
      BEGIN
        SELF.DM_XL_ID := p_id;
        SELF.LEAD_TYPE_ID  := null;
        SELF.W_LEAD_TYPE_NAME := null;
        SELF.INC_TYPE_ID  := null;
        SELF.W_INC_TYPE_NAME := null;
        SELF.PARAM_STATUS_TYPE_ID  := null;
        SELF.W_PARAM_STATUS_TYPE_NAME := null;
        SELF.PARAM_DATE_TYPE_ID := null;
        SELF.W_PARAM_DATE_TYPE_NAME:= null;
        SELF.PARAM_UNIT_ID := null;
        SELF.PARAM_UNIT := null;
        SELF.LIST_TYPE_ID := null;
        SELF.W_LIST_TYPE_NAME := null;
        SELF.PARAM_TYPE_ID := null;
        SELF.REL_TYPE_ID  := null;  
        SELF.SHEET_NAME   := null;  
        SELF.ORDER_NO     := null;    
        SELF.ORDER_SIGN    := null; 
        SELF.ORDER_REG      := null;  
        SELF.PRINT_TYPE     := null;   
        SELF.EXCELL_COLUMNS_ID := null; 
        SELF.INTERVALL_TYPE_ID := null; 
        SELF.INTERVALL_TYPE_NAME  := null;
        SELF.FROM_DATE   := NULL;
        SELF.TO_DATE     := null;
        SELF.DESCRIPTION  := null;
       RETURN;
     END;
  END;

/
