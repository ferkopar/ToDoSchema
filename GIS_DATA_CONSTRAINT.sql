--------------------------------------------------------
--  Constraints for Table GIS_DATA
--------------------------------------------------------

  ALTER TABLE "GIS_DATA" ADD CONSTRAINT "PK_GIS_DATA" PRIMARY KEY ("GIS_ID") ENABLE;
 
  ALTER TABLE "GIS_DATA" MODIFY ("GIS_ID" NOT NULL DISABLE);
 
  ALTER TABLE "GIS_DATA" MODIFY ("GIS_TYPE_ID" NOT NULL DISABLE);
