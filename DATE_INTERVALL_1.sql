--------------------------------------------------------
--  DDL for Package Body DATE_INTERVALL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DATE_INTERVALL" AS

  FUNCTION IS_SAME_PERIOD(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS  
  BEGIN
  IF p_start_fix = p_start_var AND p_end_fix = p_end_var THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION HAS_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF p_start_fix <= p_start_var 
     AND p_end_fix >= p_end_var THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION OVERLAP(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF NOT( p_end_var < p_start_fix OR p_end_fix < p_start_var )
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION CONTINOUS(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF p_start_fix = p_end_var
	   or p_end_fix = p_end_var  THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION COMPARE_PERIOD(
      p_action    IN VARCHAR2,
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER 
  AS  
      
  BEGIN
  
  IF p_action = 'IS_SAME_PERIOD' THEN
    RETURN DATE_INTERVALL.IS_SAME_PERIOD(p_start_fix,p_end_fix,p_start_var,p_end_var);
  ELSIF p_action = 'HAS_INSIDE' THEN
    RETURN DATE_INTERVALL.HAS_INSIDE(p_start_fix,p_end_fix,p_start_var,p_end_var);
  ELSIF p_action = 'CONTINOUS' THEN 
    RETURN DATE_INTERVALL.CONTINOUS(p_start_fix,p_end_fix,p_start_var,p_end_var);
  ELSIF p_action = 'OVERLAP' THEN
    RETURN DATE_INTERVALL.OVERLAP(p_start_fix,p_end_fix,p_start_var,p_end_var);
  ELSE         
        raise_application_error(-20000,'Az akció nem érvényes'||nvl(p_action,' null'));
  END IF;
END;

FUNCTION AFTER(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_end_fix < p_start_var  THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix < p_start_var 
  AND p_end_fix = p_start_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION START_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix < p_start_var 
  AND p_end_fix < p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION INSIDE_START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix < p_start_var 
  AND p_end_fix < p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION ENCLOSING_START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix = p_start_var 
  AND p_end_fix   < p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION ENCLOSING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix > p_start_var 
  AND p_end_fix   < p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION ENCLOSING_END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix > p_start_var 
  AND p_end_fix   = p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION EXACT_MATCH(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix = p_start_var 
  AND p_end_fix   = p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix < p_start_var 
  AND p_end_fix   > p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

  
FUNCTION INSIDE_END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix < p_start_var 
  AND p_end_fix   = p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION END_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix > p_start_var 
  AND p_start_fix < p_end_var
  AND p_end_fix   > p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix = p_end_var 
  AND p_end_fix   > p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;

FUNCTION BEFORE_NEW(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER AS
BEGIN 
  IF  p_start_fix > p_end_var 
  AND p_end_fix   > p_end_var
    THEN
    RETURN 1;
  ELSE
    RETURN -1;
  END IF;
END;



END DATE_INTERVALL;

/
