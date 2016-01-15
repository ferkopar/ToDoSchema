--------------------------------------------------------
--  Constraints for Table TRAFFIC_SUM
--------------------------------------------------------

  ALTER TABLE "TRAFFIC_SUM" ADD CONSTRAINT "PK_TRAFFIC_SUM" PRIMARY KEY ("TRAFFIC_SUM_ID") ENABLE;
 
  ALTER TABLE "TRAFFIC_SUM" MODIFY ("TRAFFIC_SUM_ID" NOT NULL ENABLE);
