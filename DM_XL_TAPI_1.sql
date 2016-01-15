--------------------------------------------------------
--  DDL for Package Body DM_XL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_XL_TAPI" 
IS
  -- insert
  PROCEDURE ins(
      p_CRU                     IN DM_XL.CRU%type DEFAULT NULL ,
      p_PARAM_DATA_TYPE         IN DM_XL.PARAM_DATA_TYPE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_MDU                     IN DM_XL.MDU%type DEFAULT NULL ,
      p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
      p_MDD                     IN DM_XL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME         IN DM_XL.W_REL_TYPE_NAME%type DEFAULT NULL , 
      p_W_LIST_TYPE_NAME        IN DM_XL.W_LIST_TYPE_NAME%type DEFAULT NULL ,
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
      p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
      p_W_PARAM_DATE_TYPE_NAME  IN DM_XL.W_PARAM_DATE_TYPE_NAME%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_W_PARAM_TYPE_NAME       IN DM_XL.W_PARAM_TYPE_NAME%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_CRD                     IN DM_XL.CRD%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_W_PARAM_ADATE_TYPE_NAME IN DM_XL.W_PARAM_ADATE_TYPE_NAME%type DEFAULT NULL ,
      p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
      p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type )
  IS
  BEGIN
    INSERT
    INTO DM_XL
      (
        CRU ,
        PARAM_DATA_TYPE ,
        TO_DATE ,
        MDU ,
        PARAM_FDATE ,
        ORDER_REG ,
        PARAM_UNIT ,
        ORDER_SIGN ,
        PARAM_TDATE ,
        MDD ,
        W_REL_TYPE_NAME ,
        W_LIST_TYPE_NAME ,
        TREATM_ID ,
        PARAM_TYPE_ID ,
        VALUE_TABLE ,
        PARAM_DATE_TYPE_ID ,
        DESCRIPTION ,
        PARAM_D2VALUE ,
        ORDER_NO ,
        DATA_OWNER_ID ,
        PARAM_ADATE_TYPE_ID ,
        W_PARAM_DATE_TYPE_NAME ,
        FROM_DATE ,
        PARAM_UNIT_ID ,
        W_PARAM_TYPE_NAME ,
        REL_TYPE_ID ,
        CRD ,
        VALUE_PARAM_ID ,
        MUTABLE ,
        PRINT_TYPE ,
        W_PARAM_ADATE_TYPE_NAME ,
        SHEET_NAME ,
        PARAM_D1VALUE ,
        LIST_TYPE_ID ,
        DM_XL_ID
      )
      VALUES
      (
        p_CRU ,
        p_PARAM_DATA_TYPE ,
        p_TO_DATE ,
        p_MDU ,
        p_PARAM_FDATE ,
        p_ORDER_REG ,
        p_PARAM_UNIT ,
        p_ORDER_SIGN ,
        p_PARAM_TDATE ,
        p_MDD ,
        p_W_REL_TYPE_NAME ,
        p_W_LIST_TYPE_NAME ,
        p_TREATM_ID ,
        p_PARAM_TYPE_ID ,
        p_VALUE_TABLE ,
        p_PARAM_DATE_TYPE_ID ,
        p_DESCRIPTION ,
        p_PARAM_D2VALUE ,
        p_ORDER_NO ,
        p_DATA_OWNER_ID ,
        p_PARAM_ADATE_TYPE_ID ,
        p_W_PARAM_DATE_TYPE_NAME ,
        p_FROM_DATE ,
        p_PARAM_UNIT_ID ,
        p_W_PARAM_TYPE_NAME ,
        p_REL_TYPE_ID ,
        p_CRD ,
        p_VALUE_PARAM_ID ,
        p_MUTABLE ,
        p_PRINT_TYPE ,
        p_W_PARAM_ADATE_TYPE_NAME ,
        p_SHEET_NAME ,
        p_PARAM_D1VALUE ,
        p_LIST_TYPE_ID ,
        p_DM_XL_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CRU                     IN DM_XL.CRU%type DEFAULT NULL ,
      p_PARAM_DATA_TYPE         IN DM_XL.PARAM_DATA_TYPE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_MDU                     IN DM_XL.MDU%type DEFAULT NULL ,
      p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
      p_MDD                     IN DM_XL.MDD%type DEFAULT NULL ,
      p_W_REL_TYPE_NAME         IN DM_XL.W_REL_TYPE_NAME%type DEFAULT NULL ,
      p_W_LIST_TYPE_NAME        IN DM_XL.W_LIST_TYPE_NAME%type DEFAULT NULL ,
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
      p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
      p_W_PARAM_DATE_TYPE_NAME  IN DM_XL.W_PARAM_DATE_TYPE_NAME%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_W_PARAM_TYPE_NAME       IN DM_XL.W_PARAM_TYPE_NAME%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_CRD                     IN DM_XL.CRD%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_W_PARAM_ADATE_TYPE_NAME IN DM_XL.W_PARAM_ADATE_TYPE_NAME%type DEFAULT NULL ,
      p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
      p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type
    )
  IS
  BEGIN
    UPDATE DM_XL
    SET CRU                   = p_CRU ,
      PARAM_DATA_TYPE         = p_PARAM_DATA_TYPE ,
      TO_DATE                 = p_TO_DATE ,
      MDU                     = p_MDU ,
      PARAM_FDATE             = p_PARAM_FDATE ,
      ORDER_REG               = p_ORDER_REG ,
      PARAM_UNIT              = p_PARAM_UNIT ,
      ORDER_SIGN              = p_ORDER_SIGN ,
      PARAM_TDATE             = p_PARAM_TDATE ,
      MDD                     = p_MDD ,
      W_REL_TYPE_NAME         = p_W_REL_TYPE_NAME ,
      W_LIST_TYPE_NAME        = p_W_LIST_TYPE_NAME ,
      TREATM_ID               = p_TREATM_ID ,
      PARAM_TYPE_ID           = p_PARAM_TYPE_ID ,
      VALUE_TABLE             = p_VALUE_TABLE ,
      PARAM_DATE_TYPE_ID      = p_PARAM_DATE_TYPE_ID ,
      DESCRIPTION             = p_DESCRIPTION ,
      PARAM_D2VALUE           = p_PARAM_D2VALUE ,
      ORDER_NO                = p_ORDER_NO ,
      DATA_OWNER_ID           = p_DATA_OWNER_ID ,
      PARAM_ADATE_TYPE_ID     = p_PARAM_ADATE_TYPE_ID ,
      W_PARAM_DATE_TYPE_NAME  = p_W_PARAM_DATE_TYPE_NAME ,
      FROM_DATE               = p_FROM_DATE ,
      PARAM_UNIT_ID           = p_PARAM_UNIT_ID ,
      W_PARAM_TYPE_NAME       = p_W_PARAM_TYPE_NAME ,
      REL_TYPE_ID             = p_REL_TYPE_ID ,
      CRD                     = p_CRD ,
      VALUE_PARAM_ID          = p_VALUE_PARAM_ID ,
      MUTABLE                 = p_MUTABLE ,
      PRINT_TYPE              = p_PRINT_TYPE ,
      W_PARAM_ADATE_TYPE_NAME = p_W_PARAM_ADATE_TYPE_NAME ,
      SHEET_NAME              = p_SHEET_NAME ,
      PARAM_D1VALUE           = p_PARAM_D1VALUE ,
      LIST_TYPE_ID            = p_LIST_TYPE_ID
    WHERE DM_XL_ID            = p_DM_XL_ID;
  END;
-- del
  PROCEDURE del(
      p_DM_XL_ID IN DM_XL.DM_XL_ID%type )
  IS
  BEGIN
    DELETE FROM DM_XL WHERE DM_XL_ID = p_DM_XL_ID;
  END;

PROCEDURE add(p_DM_XL_ID_SRC IN DM_XL.DM_XL_ID%type,
                p_DM_XL_ID_DST IN DM_XL.DM_XL_ID%type  DEFAULT NULL,
                p_LIST_TYPE_ID IN DM_XL.LIST_TYPE_ID%type  DEFAULT NULL)
IS 
v_DM_XL_ID_DST DM_XL.DM_XL_ID%type;
row DM_XL%rowtype;
BEGIN
--  delete from wk_pf_audit_table;
--  INSERT into wk_pf_audit_table values('p_DM_XL_ID_SRC',p_DM_XL_ID_SRC);
--  INSERT into wk_pf_audit_table values('p_DM_XL_ID_DST',p_DM_XL_ID_DST);

  IF p_DM_XL_ID_DST = NULL THEN
    select SEQ_BASE.NEXTVAL INTO v_DM_XL_ID_DST FROM DUAL;
  ELSE
    v_DM_XL_ID_DST := p_DM_XL_ID_DST; 
  END IF; 
  BEGIN
     SELECT * INTO row FROM DM_XL WHERE DM_XL_ID = p_DM_XL_ID_SRC;
  EXCEPTION
    WHEN OTHERS THEN 
     SELECT * INTO row FROM DM_XL WHERE DM_XL_ID = 1;
  END;
  ins(
                         p_treatm_id               => row.treatm_id,
                         p_ORDER_REG               => row.ORDER_REG,
                         p_PARAM_FDATE             => row.PARAM_FDATE,
                         p_PARAM_UNIT              => row.PARAM_UNIT,
                         p_ORDER_SIGN              => row.ORDER_SIGN,
                         p_PARAM_TDATE             => row.PARAM_TDATE ,
                         p_PARAM_TYPE_ID           => row.PARAM_TYPE_ID,
                         p_PARAM_DATE_TYPE_ID      => row.PARAM_DATE_TYPE_ID,                         
                         p_DESCRIPTION             => 'COPY of '|| row.DESCRIPTION,
                         p_PARAM_D2VALUE           => row.PARAM_D2VALUE,
                         p_PARAM_ADATE_TYPE_ID     => row.PARAM_ADATE_TYPE_ID,
                         p_DATA_OWNER_ID           => row.DATA_OWNER_ID,
                         p_ORDER_NO                => max_order_no(row.LIST_TYPE_ID,row.REL_TYPE_ID)+1,
                         p_PARAM_UNIT_ID           => row.PARAM_UNIT_ID,
                         p_REL_TYPE_ID             => row.REL_TYPE_ID,
                         p_MUTABLE                 => row.MUTABLE,
                         p_PRINT_TYPE              => row.PRINT_TYPE ,
                         p_SHEET_NAME              => row.SHEET_NAME ,
                         p_PARAM_D1VALUE           => row.PARAM_D1VALUE,
                         p_DM_XL_ID                => v_DM_XL_ID_DST,
                         p_LIST_TYPE_ID            => nvl(p_LIST_TYPE_ID,row.LIST_TYPE_ID) ); 
END;

  FUNCTION max_order_no(p_list_type_id DM_XL.LIST_TYPE_ID%TYPE,
                        p_rel_type_id  DM_XL.REL_TYPE_ID%TYPE) 
    return DM_XL.ORDER_NO%TYPE
  IS
   v_ret_val DM_XL.ORDER_NO%TYPE;
  BEGIN
  SELECT max(ORDER_NO) into v_ret_val from DM_XL
      where LIST_TYPE_ID =  p_list_type_id
      and   REL_TYPE_ID = p_rel_type_id;
    return v_ret_val;   
  END;

   PROCEDURE insert_or_update(
      p_DM_XL_ID                IN DM_XL.DM_XL_ID%type, 
      p_TREATM_ID               IN DM_XL.TREATM_ID%type ,
      p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type ,
      p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type ,
      p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
      p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type ,
      p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
      p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
      p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
      p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
      p_FROM_DATE               IN DM_XL.FROM_DATE%type DEFAULT NULL ,
      p_TO_DATE                 IN DM_XL.TO_DATE%type DEFAULT NULL ,
      p_VALUE_TABLE             IN DM_XL.VALUE_TABLE%type DEFAULT NULL ,
      p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
      p_VALUE_PARAM_ID          IN DM_XL.VALUE_PARAM_ID%type DEFAULT NULL ,
      p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL 
      
  ) IS
  l_new_dm_xl_id  DM_XL.DM_XL_ID%type;
  l_dm_xl_row DM_XL%rowtype;
  BEGIN
   select seq_base.nextval into l_new_dm_xl_id from dual;
   IF p_DM_XL_ID is null then
     ins(                p_DM_XL_ID                => l_new_dm_xl_id,
                         p_treatm_id               => p_TREATM_ID,
                         p_ORDER_REG               => p_ORDER_REG,
                         p_ORDER_SIGN              => p_ORDER_SIGN,
                         p_PARAM_TYPE_ID           => p_PARAM_TYPE_ID,
                         p_DESCRIPTION             => p_DESCRIPTION,
                         p_ORDER_NO                => nvl(p_ORDER_NO, max_order_no(p_LIST_TYPE_ID,p_REL_TYPE_ID)+1),
                         p_PARAM_UNIT_ID           => p_PARAM_UNIT_ID,
                         p_REL_TYPE_ID             => p_REL_TYPE_ID,
                         p_MUTABLE                 => p_MUTABLE,
                         p_PRINT_TYPE              => p_PRINT_TYPE ,
                         p_LIST_TYPE_ID            => p_LIST_TYPE_ID ); 
   ELSE
     select * into l_dm_xl_row from dm_xl where dm_xl_id = p_DM_XL_ID;
     upd
    (
	  p_DM_XL_ID                => p_DM_XL_ID,
      p_TO_DATE                 => nvl(p_TO_DATE,l_dm_xl_row.TO_DATE),
      p_ORDER_REG               => nvl(p_ORDER_REG ,l_dm_xl_row.ORDER_REG ),
      p_ORDER_SIGN              => nvl(p_ORDER_SIGN ,l_dm_xl_row.ORDER_SIGN ),
      p_TREATM_ID               => nvl(p_TREATM_ID ,l_dm_xl_row.TREATM_ID ),
      p_PARAM_TYPE_ID           => nvl(p_PARAM_TYPE_ID ,l_dm_xl_row.PARAM_TYPE_ID ),
      p_ORDER_NO                => nvl(p_ORDER_NO ,l_dm_xl_row.ORDER_NO ),
      p_FROM_DATE               => nvl(p_FROM_DATE ,l_dm_xl_row.FROM_DATE ),
      p_PARAM_UNIT_ID           => nvl(p_PARAM_UNIT_ID ,l_dm_xl_row.PARAM_UNIT_ID ),
      p_REL_TYPE_ID             => nvl(p_REL_TYPE_ID ,l_dm_xl_row.REL_TYPE_ID ),
      p_PRINT_TYPE              => nvl(p_PRINT_TYPE ,l_dm_xl_row.PRINT_TYPE ),
      p_LIST_TYPE_ID            => nvl(p_LIST_TYPE_ID ,l_dm_xl_row.LIST_TYPE_ID )     
    );
   END IF;
  END;

END DM_XL_tapi;

/
