--------------------------------------------------------
--  DDL for Function TREATMENT_IS_IN_TREE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "TREATMENT_IS_IN_TREE" (p_root_id Treatm.treatm_id % TYPE,
                                                           p_to_tree treatm.treatm_id % TYPE)
  RETURN NUMBER
  IS
  BEGIN
    IF p_root_id = p_to_tree
    THEN
      RETURN -1;
    END IF;
    FOR n IN (SELECT treatm_id2
        FROM treatm_rel
        WHERE treatm_id1 = p_root_id)
    LOOP
      IF n.treatm_id2 = p_to_tree
      THEN
        RETURN -1;
      ELSE
        IF TREATMENT_IS_IN_TREE(n.treatm_id2, p_to_tree) = -1
        THEN
          RETURN -1;
        END IF;
      END IF;
    END LOOP;
    RETURN 0;
  EXCEPTION
    WHEN OTHERS THEN RETURN -1;
  END;

/
