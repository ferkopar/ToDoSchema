--------------------------------------------------------
--  DDL for Package DATE_INTERVALL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DATE_INTERVALL" AS
FUNCTION IS_SAME_PERIOD(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

FUNCTION HAS_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

FUNCTION OVERLAP(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

FUNCTION CONTINOUS(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER; 



FUNCTION COMPARE_PERIOD(
      p_action    IN VARCHAR2,
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

FUNCTION AFTER(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

FUNCTION START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION START_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION INSIDE_START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION ENCLOSING_START_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION ENCLOSING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION ENCLOSING_END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION EXACT_MATCH(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION INSIDE_END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION END_INSIDE(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION END_TOUCHING(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

  FUNCTION BEFORE_NEW(
      p_start_fix IN DATE,
      p_end_fix   IN DATE,
      p_start_var IN DATE,
      p_end_var   IN DATE ) RETURN NUMBER;

END DATE_INTERVALL;

/
