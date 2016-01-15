--------------------------------------------------------
--  DDL for Package Body TREATM_PRU_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_PRU_TAPI" 
IS
  -- insert
PROCEDURE ins(
    p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
    p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
    p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
    p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
    p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
    p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type ,
    p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL )
IS
BEGIN
  execute IMMEDIATE('ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY.MM.DD'' ');
  INSERT
  INTO TREATM_PRU
    (
      CRU ,
      SUBJ_ID ,
      UNIT_TYPE_ID ,
      TO_DATE ,
      STATUS_ID ,
      DESCRIPTION ,
      MDU ,
      MM_ID ,
      FROM_DATE ,
      CRD ,
      MDD ,
      VALUE ,
      TYPE_ID ,
      PARAM_TYPE_ID ,
      TREATM_PRU_ID ,
      EPI_ID
    )
    VALUES
    (
      p_CRU ,
      p_SUBJ_ID ,
      p_UNIT_TYPE_ID ,
      p_TO_DATE ,
      p_STATUS_ID ,
      p_DESCRIPTION ,
      p_MDU ,
      p_MM_ID ,
      p_FROM_DATE ,
      p_CRD ,
      p_MDD ,
      p_VALUE ,
      p_TYPE_ID ,
      p_PARAM_TYPE_ID ,
      p_TREATM_PRU_ID ,
      p_EPI_ID
    );
END;

  PROCEDURE UPDATE_DATA
    (
    p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
    p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
    p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
    p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
    p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
    p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type ,
    p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL
  )
IS
  v_treatm_pru_rec treatm_pru%ROWTYPE;
BEGIN
  execute IMMEDIATE('ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY.MM.DD'' '); 
  SELECT * INTO v_treatm_pru_rec FROM treatm_pru tp WHERE p_treatm_pru_id = tp.treatm_pru_id;
  IF v_treatm_pru_rec.STATUS_ID != 917
     AND ( p_SUBJ_ID != v_treatm_pru_rec.subj_id
        OR p_TYPE_ID  != v_treatm_pru_rec.TYPE_ID
        or p_param_type_id  != v_treatm_pru_rec.param_type_id
        or p_value  != v_treatm_pru_rec.value
        or p_unit_type_id  != v_treatm_pru_rec.unit_type_id ) THEN
        
        NULL;
 
  ELSE
      
       NULL;
  END IF;


END;

PROCEDURE upd
  (
    p_CRU           IN TREATM_PRU.CRU%type DEFAULT NULL ,
    p_SUBJ_ID       IN TREATM_PRU.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID  IN TREATM_PRU.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_TO_DATE       IN TREATM_PRU.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_PRU.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_PRU.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_PRU.MDU%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_PRU.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_PRU.FROM_DATE%type DEFAULT NULL ,
    p_CRD           IN TREATM_PRU.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_PRU.MDD%type DEFAULT NULL ,
    p_VALUE         IN TREATM_PRU.VALUE%type DEFAULT NULL ,
    p_TYPE_ID       IN TREATM_PRU.TYPE_ID%type DEFAULT NULL ,
    p_PARAM_TYPE_ID IN TREATM_PRU.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type ,
    p_EPI_ID        IN TREATM_PRU.EPI_ID%type DEFAULT NULL
  )
IS
  
BEGIN
  execute IMMEDIATE('ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY.MM.DD'' '); 
  


  UPDATE TREATM_PRU
  SET  
    SUBJ_ID           = p_SUBJ_ID ,
    UNIT_TYPE_ID      = p_UNIT_TYPE_ID ,
    TO_DATE           = p_TO_DATE ,
    STATUS_ID         = p_STATUS_ID ,
    DESCRIPTION       = p_DESCRIPTION ,
    MM_ID             = p_MM_ID ,
    FROM_DATE         = p_FROM_DATE ,
    VALUE             = p_VALUE ,
    TYPE_ID           = p_TYPE_ID ,
    PARAM_TYPE_ID     = p_PARAM_TYPE_ID ,
    EPI_ID            = p_EPI_ID
  WHERE TREATM_PRU_ID = p_TREATM_PRU_ID;
END;
-- del
PROCEDURE del(
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type )
IS
BEGIN
  DELETE FROM TREATM_PRU WHERE TREATM_PRU_ID = p_TREATM_PRU_ID;
END;

PROCEDURE invalidate(
    p_TREATM_PRU_ID IN TREATM_PRU.TREATM_PRU_ID%type )
IS
v_treatm_pru_row treatm_pru%ROWTYPE;
BEGIN
  
  SELECT * INTO v_treatm_pru_row FROM treatm_pru WHERE treatm_pru_id = p_treatm_pru_id;
  IF v_treatm_pru_row.status_id = 917 then
     del(p_TREATM_PRU_ID);
  ELSE
     UPDATE treatm_pru SET status_id = 919 WHERE treatm_pru_id = p_TREATM_PRU_ID;
  END IF;
END;

FUNCTION clone(p_treatm_pru_id in treatm_pru.treatm_pru_id%TYPE) RETURN NUMBER
  
  IS
  v_treatm_pru_id treatm_pru.treatm_pru_id%TYPE;
  v_treatm_pru_row treatm_pru%ROWTYPE;
  BEGIN
  
     execute IMMEDIATE('ALTER TRIGGER TRG2_DM_TREATM_PRU DISABLE');
     execute IMMEDIATE('ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY.MM.DD'' ');
     SELECT seq_base.nextval INTO v_treatm_pru_id FROM dual;
     SELECT * INTO v_treatm_pru_row FROM treatm_pru WHERE treatm_pru_id = p_treatm_pru_id;
     TREATM_PRU_tapi.ins(
   
    p_SUBJ_ID      =>  v_treatm_pru_row.SUBJ_ID,
    p_UNIT_TYPE_ID =>  v_treatm_pru_row.UNIT_TYPE_ID ,
    p_TO_DATE      =>  v_treatm_pru_row.TO_DATE ,
    p_STATUS_ID    =>  921,
    p_DESCRIPTION  =>  v_treatm_pru_row.description|| '(Cloned from '|| v_treatm_pru_row.treatm_pru_id ||')' ,
    p_MM_ID        =>  v_treatm_pru_row.MM_ID ,
    p_FROM_DATE    =>  v_treatm_pru_row.FROM_DATE ,
    p_VALUE        =>  v_treatm_pru_row.VALUE ,
    p_TYPE_ID      =>  v_treatm_pru_row.TYPE_ID ,
    p_PARAM_TYPE_ID=>  v_treatm_pru_row.PARAM_TYPE_ID ,
    p_TREATM_PRU_ID=>  v_treatm_pru_id ,
    p_EPI_ID       =>  v_treatm_pru_row.EPI_ID );
    execute IMMEDIATE('ALTER TRIGGER TRG2_DM_TREATM_PRU ENABLE');


    RETURN v_treatm_pru_id;
    
    END;
    
FUNCTION apex_condtion(  p_treatm_pru_id treatm_pru.treatm_pru_id%TYPE DEFAULT NULL,
                         p_subj_id treatm_pru.subj_id%TYPE,
                         p_type_id treatm_pru.type_id%TYPE,
                         p_param_type_id treatm_pru.param_type_id%TYPE,
                         p_unit_type_id treatm_pru.unit_type_id%TYPE,
                         p_from_date treatm_pru.from_date%TYPE,
                         p_to_date treatm_pru.to_date%TYPE
                       ) RETURN VARCHAR2
  AS
  l_rows pls_integer;
  v_treatm_pri_id treatm_pru.treatm_pru_id%TYPE;
  BEGIN
      IF p_from_date > p_to_date THEN 
        RETURN 'A záró dátum nem lehet kisebb a kezdõ dáátumnál';
      END IF;
      SELECT count(1) INTO l_rows FROM treatm_pru 
      WHERE SUBJ_ID = p_subj_id
      AND TYPE_ID = p_type_id
      AND PARAM_TYPE_ID = p_param_type_id
      AND UNIT_TYPE_ID = p_unit_type_id
      AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
      AND STATUS_ID NOT IN (919,912)
      AND STATUS_ID = 917;       
      IF l_rows > 0 THEN

        IF l_rows = 1 AND p_treatm_pru_id IS NOT NULL THEN
         
          SELECT treatm_pru_id INTO v_treatm_pri_id FROM treatm_pru 
            WHERE SUBJ_ID = p_subj_id
              AND TYPE_ID = p_type_id
              AND PARAM_TYPE_ID = p_param_type_id
              AND UNIT_TYPE_ID = p_unit_type_id
              AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
              AND STATUS_ID NOT IN (919,912)
              AND STATUS_ID = 917;   

          IF v_treatm_pri_id = p_treatm_pru_id THEN 
            RETURN NULL;
          END IF;
         END IF;
        RETURN 'Már létezik ilyen, nem lehet újra létrehozni';
      ELSE
        RETURN NULL; -- no error
      END IF;
  END;  
END TREATM_PRU_tapi;

/
