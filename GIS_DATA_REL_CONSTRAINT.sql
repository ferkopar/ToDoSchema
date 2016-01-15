--------------------------------------------------------
--  Constraints for Table GIS_DATA_REL
--------------------------------------------------------

  ALTER TABLE "GIS_DATA_REL" ADD CONSTRAINT "PK_GIS_DATA_REL" PRIMARY KEY ("GIS_REL_ID") ENABLE;
 
  ALTER TABLE "GIS_DATA_REL" MODIFY ("GIS_REL_ID" NOT NULL DISABLE);
