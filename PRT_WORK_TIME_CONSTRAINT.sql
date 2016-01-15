--------------------------------------------------------
--  Constraints for Table PRT_WORK_TIME
--------------------------------------------------------

  ALTER TABLE "PRT_WORK_TIME" ADD CONSTRAINT "PK_WK_TIME" PRIMARY KEY ("WK_TIME_ID") ENABLE;
 
  ALTER TABLE "PRT_WORK_TIME" MODIFY ("WK_TIME_ID" NOT NULL DISABLE);
